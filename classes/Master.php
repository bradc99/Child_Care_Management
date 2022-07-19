<?php
require_once('../config.php');
class Master extends DBConnection
{
	private $settings;
	public function __construct()
	{
		global $_settings;
		$this->settings = $_settings;
		parent::__construct();
	}
	public function __destruct()
	{
		parent::__destruct();
	}
	function capture_err()
	{
		if (!$this->conn->error)
			return false;
		else {
			$resp['status'] = 'failed';
			$resp['error'] = $this->conn->error;
			return json_encode($resp);
			exit;
		}
	}
	function save_service()
	{
		$_POST['description'] = htmlentities($_POST['description']);
		extract($_POST);
		$data = "";
		foreach ($_POST as $k => $v) {
			if (!in_array($k, array('id'))) {
				if (!is_numeric($v))
					$v = $this->conn->real_escape_string($v);
				if (!empty($data)) $data .= ",";
				$data .= " `{$k}`='{$v}' ";
			}
		}
		if (empty($id)) {
			$sql = "INSERT INTO `service_list` set {$data} ";
		} else {
			$sql = "UPDATE `service_list` set {$data} where id = '{$id}' ";
		}
		$check = $this->conn->query("SELECT * FROM `service_list` where `name`='{$name}' " . ($id > 0 ? " and id != '{$id}'" : ""))->num_rows;
		if ($check > 0) {
			$resp['status'] = 'failed';
			$resp['msg'] = "Service Name Already Exists.";
		} else {
			$save = $this->conn->query($sql);
			if ($save) {
				$rid = !empty($id) ? $id : $this->conn->insert_id;
				$resp['status'] = 'success';
				if (empty($id))
					$resp['msg'] = "Service details successfully added.";
				else
					$resp['msg'] = "Service details has been updated successfully.";
			} else {
				$resp['status'] = 'failed';
				$resp['msg'] = "An error occured.";
				$resp['err'] = $this->conn->error . "[{$sql}]";
			}
		}
		if ($resp['status'] == 'success')
			$this->settings->set_flashdata('success', $resp['msg']);
		return json_encode($resp);
	}
	function delete_service()
	{
		extract($_POST);
		$del = $this->conn->query("DELETE FROM `service_list` where id = '{$id}'");
		if ($del) {
			$resp['status'] = 'success';
			$this->settings->set_flashdata('success', "Service has been deleted successfully.");
		} else {
			$resp['status'] = 'failed';
			$resp['error'] = $this->conn->error;
		}
		return json_encode($resp);
	}
	function save_babysitter()
	{
		if (empty($_POST['id'])) {
			$prefix = "BS-" . (date('Ym'));
			$code = sprintf("%'.04d", 1);
			while (true) {
				$check = $this->conn->query("SELECT * FROM babysitter_list where `code` = '{$prefix}{$code}' ")->num_rows;
				if ($check > 0) {
					$code = sprintf("%'.04d", ceil($code) + 1);
				} else {
					break;
				}
			}
			$_POST['code'] = "{$prefix}{$code}";
		}
		$_POST['fullname'] = "{$_POST['lastname']}, {$_POST['firstname']} {$_POST['middlename']}";
		extract($_POST);
		$data = "";
		foreach ($_POST as $k => $v) {
			if (in_array($k, array('code', 'fullname', 'status'))) {
				if (!is_numeric($v))
					$v = $this->conn->real_escape_string($v);
				if (!empty($data)) $data .= ",";
				$data .= " `{$k}`='{$v}' ";
			}
		}
		if (empty($id)) {
			$sql = "INSERT INTO `babysitter_list` set {$data} ";
		} else {
			$sql = "UPDATE `babysitter_list` set {$data} where id = '{$id}' ";
		}
		$check = $this->conn->query("SELECT * FROM `babysitter_details` where `meta_field`='email' and `meta_value`='{$email}' " . ($id > 0 ? " and babysitter_id != '{$id}'" : ""))->num_rows;
		if ($check > 0) {
			$resp['status'] = 'failed';
			$resp['msg'] = "Babysitter's Email Already Exists.";
		} else {
			$save = $this->conn->query($sql);
			if ($save) {
				$bsid = !empty($id) ? $id : $this->conn->insert_id;
				$resp['status'] = 'success';
				if (empty($id))
					$resp['msg'] = "Babysitter details successfully added.";
				else
					$resp['msg'] = "Babysitter details has been updated successfully.";
				$data = "";
				foreach ($_POST as $k => $v) {
					if (!in_array($k, array('id', 'code', 'fullname', 'status'))) {
						if (!is_numeric($v))
							$v = $this->conn->real_escape_string($v);
						if (!empty($data)) $data .= ",";
						$data .= " ('{$bsid}', '{$k}', '{$v}')";
					}
				}
				if (!empty($data)) {
					$sql2 = "INSERT INTO `babysitter_details` (`babysitter_id`,`meta_field`,`meta_value`) VALUES {$data}";
					$this->conn->query("DELETE FROM `babysitter_details` FROM where babysitter_id = '{$bsid}'");
					$save_meta = $this->conn->query($sql2);
					if ($save_meta) {
						$resp['status'] = 'success';
					} else {
						$this->conn->query("DELETE FROM `babysitter_list` FROM where id = '{$bsid}'");
						$resp['status'] = 'failed';
						$resp['msg'] = "An error occurred while saving the data. Error: " . $this->conn->error;
					}
				}
				if (isset($_FILES['img']) && $_FILES['img']['tmp_name'] != '') {
					$fname = 'uploads/babysitters/' . $bsid . '.png';
					$dir_path = base_app . $fname;
					$upload = $_FILES['img']['tmp_name'];
					$type = mime_content_type($upload);
					$allowed = array('image/png', 'image/jpeg');
					if (!in_array($type, $allowed)) {
						$resp['msg'] .= " But Image failed to upload due to invalid file type.";
					} else {
						$new_height = 200;
						$new_width = 200;

						list($width, $height) = getimagesize($upload);
						$t_image = imagecreatetruecolor($new_width, $new_height);
						imagealphablending($t_image, false);
						imagesavealpha($t_image, true);
						$gdImg = ($type == 'image/png') ? imagecreatefrompng($upload) : imagecreatefromjpeg($upload);
						imagecopyresampled($t_image, $gdImg, 0, 0, 0, 0, $new_width, $new_height, $width, $height);
						if ($gdImg) {
							if (is_file($dir_path))
								unlink($dir_path);
							$uploaded_img = imagepng($t_image, $dir_path);
							imagedestroy($gdImg);
							imagedestroy($t_image);
						} else {
							$resp['msg'] .= " But Image failed to upload due to unkown reason.";
						}
					}
				}
			} else {
				$resp['status'] = 'failed';
				$resp['msg'] = "An error occured.";
				$resp['err'] = $this->conn->error . "[{$sql}]";
			}
		}
		if ($resp['status'] == 'success')
			$this->settings->set_flashdata('success', $resp['msg']);
		return json_encode($resp);
	}
	function delete_babysitter()
	{
		extract($_POST);
		$del = $this->conn->query("DELETE FROM `babysitter_list` where id = '{$id}'");
		if ($del) {
			$resp['status'] = 'success';
			$this->settings->set_flashdata('success', "Babysitter has been deleted successfully.");
			if (is_file(base_app . "uploads/babysitters/{$id}.png")) {
				unlink(base_app . "uploads/babysitters/{$id}.png");
			}
		} else {
			$resp['status'] = 'failed';
			$resp['error'] = $this->conn->error;
		}
		return json_encode($resp);
	}



	/// Enrollment Inserted Into Database Starts From Here.

	//============= Start ================//

	function save_enrollment()
	{
		if ($_POST['child_firstname'] == '' || $_POST['child_lastname'] == '') {
			foreach ($_POST as $key => $value) {
				echo "<li>Please Enter " . $key . ".</li>";
			}
			exit();
		}


		if (empty($_POST['id'])) {

			//============= Start ================//
			//Enrollment Code Generated from Here.
			$alpha = range("A", "Z");
			shuffle($alpha);
			$prefix = (substr(implode("", $alpha), 0, 3)) . "-" . (date('Ym'));
			$code = sprintf("%'.04d", 1);
			while (true) {
				$check = $this->conn->query("SELECT * FROM enrollment_list where `code` = '{$prefix}{$code}' ")->num_rows;
				if ($check > 0) {
					$code = sprintf("%'.04d", ceil($code) + 1);
				} else {
					break;
				}
			}
			$_POST['code'] = "{$prefix}{$code}";
		}








		$_POST['child_fullname'] = "{$_POST['child_lastname']}, {$_POST['child_firstname']} {$_POST['child_middlename']}";
		$_POST['parent_fullname'] = "{$_POST['parent_lastname']}, {$_POST['parent_firstname']} {$_POST['parent_middlename']}";
		//$_POST['babysitter_id'] = $_POST['babysitter_id']; // added this line for inserting babysitter ID coming from Enrollement.php Page

		extract($_POST);
		$data = "";
		foreach ($_POST as $k => $v) {
			if (in_array($k, array('code', 'child_fullname', 'parent_fullname', 'status'))) {
				if (!is_numeric($v))
					$v = $this->conn->real_escape_string($v);
				if (!empty($data)) $data .= ",";
				$data .= " `{$k}`='{$v}' ";
			}
		}
		if (empty($id)) {
			$sql = "INSERT INTO `enrollment_list` set {$data} ";
		} else {
			$sql = "UPDATE `enrollment_list` set {$data} where id = '{$id}' ";
		}

		$save = $this->conn->query($sql);
		if ($save) {
			$eid = !empty($id) ? $id : $this->conn->insert_id;
			$resp['status'] = 'success';
			if (empty($id))
				$resp['msg'] = "Enrollment Details has successfully submitted. Your Enrollment Code is <b>{$code}</b>.";
			else
				$resp['msg'] = "Enrollment details has been updated successfully.";
			$data = "";
			foreach ($_POST as $k => $v) {
				if (!in_array($k, array('id', 'code', 'fullname', 'status'))) {
					if (!is_numeric($v))
						//is_numeric means whether the result is numeric or string
						$v = $this->conn->real_escape_string($v);
					if (!empty($data)) $data .= ",";
					$data .= " ('{$eid}', '{$k}', '{$v}')";
				}
			}
			if (!empty($data)) {
				$sql2 = "INSERT INTO `enrollment_details` (`enrollment_id`,`meta_field`,`meta_value`) VALUES {$data}";
				$this->conn->query("DELETE FROM `enrollment_details` FROM where enrollment_id = '{$eid}'");
				$save_meta = $this->conn->query($sql2);
				if ($save_meta) {
					$resp['status'] = 'success';
				} else {
					$this->conn->query("DELETE FROM `enrollment_list` FROM where id = '{$eid}'");
					$resp['status'] = 'failed';
					$resp['msg'] = "An error occurred while saving the data. Error: " . $this->conn->error;
				}
			}
		} else {
			$resp['status'] = 'failed';
			$resp['msg'] = "An error occured.";
			$resp['err'] = $this->conn->error . "[{$sql}]";
		}
		if ($resp['status'] == 'success' && !empty($id))
			$this->settings->set_flashdata('success', $resp['msg']);
		if ($resp['status'] == 'success' && empty($id))
			$this->settings->set_flashdata('pop_msg', $resp['msg']);
		return json_encode($resp);
	}

	//=======================BabySitter Enrollment==============Start ==================//

	function babysitter_enrollment()
	{

		$_POST['child_id'] = "{$_POST['child_id']}";
		$_POST['babysitter_id'] = "{$_POST['babysitter_id']}";
		$_POST['date'] = "{$_POST['date']}"; // added this line for inserting babysitter ID coming from Enrollement.php Page
		$_POST['time'] = "{$_POST['time']}";
		$_POST['dateTime'] = "{$_POST['date']} {$_POST['time']}";
		$enroll_time = $_POST['dateTime'];
		$now = date('Y-m-d H:i:s');

		extract($_POST);
		$data = "";
		foreach ($_POST as $k => $v) {
			if (in_array($k, array('child_id', 'babysitter_id', 'date', 'time', 'dateTime'))) {
				if (!is_numeric($v))
					$v = $this->conn->real_escape_string($v);
				if (!empty($data)) $data .= ",";
				$data .= " `{$k}`='{$v}' ";
			}
		}
		if (empty($id)) {
			$sql = "INSERT INTO `babysitter_enrollment` set {$data} ";
		} else {
			$sql = "UPDATE `babysitter_enrollment` set {$data} where id = '{$id}' ";
		}
		$check = $this->conn->query("SELECT * from `babysitter_enrollment` where `child_id`='{$child_id}' and `babysitter_id`='{$babysitter_id}' and `date`='{$date}' and `time`='$time'")->num_rows;
		if ($check > 0) {
			$resp['status'] = 'failed';
			$resp['msg'] = "Enrollment time Already Exists.Please Change the time";
		} else {
			$save = $this->conn->query($sql);
			if ($save) {
				$rid = !empty($id) ? $id : $this->conn->insert_id;
				$this->settings->set_flashdata('success', 'Enrollment Details has successfully submitted.');

				$resp['status'] = 'success';
				if (empty($id))
					$resp['msg'] = "Enrollment Details has successfully submitted.";
				else
					$resp['msg'] = "Enrollment details has been updated successfully.";
			} else {
				$resp['status'] = 'failed';
				$resp['msg'] = "An error occured.";
				$resp['err'] = $this->conn->error . "[{$sql}]";
			}
		}

		if ($resp['status'] == 'success' && !empty($id))
			$this->settings->set_flashdata('success', $resp['msg']);
		if ($resp['status'] == 'success' && empty($id))
			$this->settings->set_flashdata('pop_msg', $resp['msg']);
		return json_encode($resp);
	}

	//=======================BabySitter Enrollment==============End ==================//

	//=======================BabySitter Enrollment update==============Start ==================//

	function babysitter_enrollment_update()
	{
		//$_POST['child_id'] = "{$_POST['child_id']}";
		$_POST['babysitter_id'] = "{$_POST['babysitter_id']}";
		$_POST['date'] = "{$_POST['date']}"; // added this line for inserting babysitter ID coming from Enrollement.php Page
		$_POST['time'] = "{$_POST['time']}";
		//$_POST['dateTime'] = "{$_POST['date']} {$_POST['time']}";

		extract($_POST);
		$data = "";
		foreach ($_POST as $k => $v) {
			if (in_array($k, array('babysitter_id', 'date', 'time'))) {
				if (!is_numeric($v))
					$v = $this->conn->real_escape_string($v);
				if (!empty($data)) $data .= ",";
				$data .= " `{$k}`='{$v}' ";
			}
		}
		if (!empty($id)) {
			$sql = "UPDATE `babysitter_enrollment` set {$data} where id = '{$id}' ";
		} else {
			$sql = "INSERT INTO `babysitter_enrollment` set {$data} ";
		}

		$check = $this->conn->query("SELECT * from `babysitter_enrollment` where `babysitter_id`='{$babysitter_id}' and `date`='{$date}' and `time`='$time'")->num_rows;
		if ($check > 0) {
			$resp['status'] = 'failed';
			$resp['msg'] = "Enrollment time Already Exists.Please Change the time";
		} else {
			$save = $this->conn->query($sql);
			if ($save) {
				$rid = !empty($id) ? $id : $this->conn->insert_id;
				$this->settings->set_flashdata('success', 'Enrollment Details has successfully submitted.');

				$resp['status'] = 'success';
				if (empty($id))
					$resp['msg'] = "Enrollment Details has successfully submitted.";
				else
					$resp['msg'] = "Enrollment details has been updated successfully.";
			} else {
				$resp['status'] = 'failed';
				$resp['msg'] = "An error occured.";
				$resp['err'] = $this->conn->error . "[{$sql}]";
			}
		}


		if ($resp['status'] == 'success' && !empty($id))
			$this->settings->set_flashdata('success', $resp['msg']);
		if ($resp['status'] == 'success' && empty($id))
			$this->settings->set_flashdata('pop_msg', $resp['msg']);
		return json_encode($resp);
	}


	//=======================BabySitter Enrollment==============End ==================//


	function attendance()
	{

		$_POST['child_id'] = "{$_POST['child_id']}";
		$_POST['babysitter_id'] = "{$_SESSION['userdata']['id']}";
		$_POST['attendance_date'] = "{$_POST['attendance_date']}"; // added this line for inserting babysitter ID coming from Enrollement.php Page
		$_POST['attendance_status'] = "{$_POST['attendance_status']}";
		//$_POST['dateTime'] = "{$_POST['date']} {$_POST['time']}";
		//$enroll_time = $_POST['dateTime'];
		//$now = date('Y-m-d H:i:s');

		extract($_POST);
		$data = "";
		foreach ($_POST as $k => $v) {
			if (in_array($k, array('child_id', 'babysitter_id', 'attendance_date', 'attendance_status'))) {
				if (!is_numeric($v))
					$v = $this->conn->real_escape_string($v);
				if (!empty($data)) $data .= ",";
				$data .= " `{$k}`='{$v}' ";
			}
		}
		if (empty($id)) {
			$sql = "INSERT INTO `attendance` set {$data} ";
		} else {
			$sql = "UPDATE `attendance` set {$data} where id = '{$id}' ";
		}
		$check = $this->conn->query("SELECT * from `attendance` where `child_id`='{$child_id}' and `babysitter_id`='{$babysitter_id}' and `attendance_date`='{$attendance_date}' and `attendance_status`='$attendance_status'")->num_rows;
		if ($check > 0) {
			$resp['status'] = 'failed';
			$resp['msg'] = "Data Already Exists.Please input another record";
		} else {
			$save = $this->conn->query($sql);
			if ($save) {
				$rid = !empty($id) ? $id : $this->conn->insert_id;
				$this->settings->set_flashdata('success', 'Enrollment Details has successfully submitted.');

				$resp['status'] = 'success';
				if (empty($id))
					$resp['msg'] = "Enrollment Details has successfully submitted.";
				else
					$resp['msg'] = "Enrollment details has been updated successfully.";
			} else {
				$resp['status'] = 'failed';
				$resp['msg'] = "An error occured.";
				$resp['err'] = $this->conn->error . "[{$sql}]";
			}
		}

		if ($resp['status'] == 'success' && !empty($id))
			$this->settings->set_flashdata('success', $resp['msg']);
		if ($resp['status'] == 'success' && empty($id))
			$this->settings->set_flashdata('pop_msg', $resp['msg']);
		return json_encode($resp);
	}

	function attendance_update()
	{

		//$_POST['child_id'] = "{$_POST['child_id']}";
		//$_POST['babysitter_id'] = "{$_SESSION['userdata']['id']}";
		$_POST['attendance_date'] = "{$_POST['attendance_date']}"; // added this line for inserting babysitter ID coming from Enrollement.php Page
		$_POST['attendance_status'] = "{$_POST['attendance_status']}";
		//$_POST['dateTime'] = "{$_POST['date']} {$_POST['time']}";
		//$enroll_time = $_POST['dateTime'];
		//$now = date('Y-m-d H:i:s');

		extract($_POST);
		$data = "";
		foreach ($_POST as $k => $v) {
			if (in_array($k, array('attendance_date', 'attendance_status'))) {
				if (!is_numeric($v))
					$v = $this->conn->real_escape_string($v);
				if (!empty($data)) $data .= ",";
				$data .= " `{$k}`='{$v}' ";
			}
		}
		if (empty($id)) {
			$sql = "UPDATE `attendance` set {$data} where id = '{$id}' ";
		} else {
			$sql = "INSERT INTO `attendance` set {$data} ";
		}
		$check = $this->conn->query("SELECT * from `attendance` where `child_id`='{$child_id}' and `attendance_date`='{$attendance_date}' and `attendance_status`='$attendance_status'")->num_rows;
		if ($check > 0) {
			$resp['status'] = 'failed';
			$resp['msg'] = "Data Already Exists.Please input another record";
		} else {
			$save = $this->conn->query($sql);
			if ($save) {
				$rid = !empty($id) ? $id : $this->conn->insert_id;
				$this->settings->set_flashdata('success', 'Attendance Details has successfully submitted.');

				$resp['status'] = 'success';
				if (empty($id))
					$resp['msg'] = "Attendance Details has successfully submitted.";
				else
					$resp['msg'] = "Attendance Details has been updated successfully.";
			} else {
				$resp['status'] = 'failed';
				$resp['msg'] = "An error occured.";
				$resp['err'] = $this->conn->error . "[{$sql}]";
			}
		}

		if ($resp['status'] == 'success' && !empty($id))
			$this->settings->set_flashdata('success', $resp['msg']);
		if ($resp['status'] == 'success' && empty($id))
			$this->settings->set_flashdata('pop_msg', $resp['msg']);
		return json_encode($resp);
	}

	//======================================Attendance============= End ==================//




	// function take_attendance()
	// {
	// 	$att = "{$_POST['attendance']}";
	// 	$date = "{date('d-m-yy')}";
	// 	$babysitter = "{$_SESSION['userdata']['id']}";


	// 	extract($_POST);
	// 	$data = "";
	// 	foreach ($_POST as $k => $v) {
	// 		if (in_array($k, array('attendance'))) {
	// 			if (!is_numeric($v))
	// 				$v = $this->conn->real_escape_string($v);
	// 			if (!empty($data)) $data .= ",";
	// 			$data .= " `{$k}`='{$v}' ";
	// 		}
	// 	}


	// 	$result = $this->conn->query("select * from attendance where attendance_date=$date and babysitter_id=$babysitter")->num_rows;
	// 	//$result = $link->query($query);
	// 	print_r($result);
	// 	$b = false;
	// 	if ($result > 0) {
	// 		while ($check = mysqli_fetch_assoc($result)) {
	// 			if ($date == $check['attendance_date']) {
	// 				$b = true;
	// 				$resp['msg'] = "Enrollment time Already Exists.Please Change the time";
	// 			}
	// 		}
	// 		if (!$b) {
	// 			foreach ($att as $key => $value) {
	// 				if ($value = "Present") {

	// 					$query = $this->conn->query("insert into attendance(child_id,attendance_status,attendance_date,babysitter_id) values('$key','Present','$date','$babysitter')");
	// 					//$insertResult = $link->query($query);
	// 				} else {
	// 					$query = $this->conn->query("insert into attendance(child_id,attendance_status,attendance_date,babysitter_id) values('$key','Absent','$date','$babysitter')");
	// 					//$insertResult = $link->query($query);
	// 				}

	// 				if ($query) {

	// 					echo "<div class='alert alert-success'>
	// 						Attendance Taken Successfully.
	// 						</div>";
	// 				}
	// 			}
	// 		}
	// 	}
	// }
	function delete_enrollment()
	{
		extract($_POST);
		$del = $this->conn->query("DELETE FROM `enrollment_list` where id = '{$id}'");
		if ($del) {
			$resp['status'] = 'success';
			$this->settings->set_flashdata('success', "Enrollment has been deleted successfully.");
		} else {
			$resp['status'] = 'failed';
			$resp['error'] = $this->conn->error;
		}
		return json_encode($resp);
	}
	function update_status()
	{
		extract($_POST);
		$update = $this->conn->query("UPDATE `Enrollment_list` set status  = '{$status}' where id = '{$id}'");
		if ($update) {
			$resp['status'] = 'success';
			$resp['msg'] = "Enrollment Status has successfully updated.";
		} else {
			$resp['status'] = 'failed';
			$resp['msg'] = "An error occurred. Error: " . $this->conn->error;
		}
		if ($resp['status'] == 'success')
			$this->settings->set_flashdata('success', $resp['msg']);
		return json_encode($resp);
	}

	function occupied_status()
	{

		extract($_POST);
		// $update = $this->conn->query("UPDATE babysitter_list INNER JOIN enrollment_list ON babysitter_list.id = enrollment_list.babysitter_id SET 
		// occupied_status = '{$occupied_status}'");


		$update = $this->conn->query("UPDATE `babysitter_list` set occupied_status  = '{$occupied_status}' where id = '{$id}'");
		if ($update) {
			$resp['status'] = 'success';
			$resp['msg'] = "Enrollment Status has successfully updated.";
		} else {
			$resp['status'] = 'failed';
			$resp['msg'] = "An error occurred. Error: " . $this->conn->error;
		}
		if ($resp['status'] == 'success') {
			$this->settings->set_flashdata('success', $resp['msg']);
			return json_encode($resp);
		}
	}
	function user_occupied_status()
	{

		extract($_POST);
		// $update = $this->conn->query("UPDATE babysitter_list INNER JOIN enrollment_list ON babysitter_list.id = enrollment_list.babysitter_id SET 
		// occupied_status = '{$occupied_status}'");


		$update = $this->conn->query("UPDATE `users` set occupied_status  = '{$occupied_status}' where id = '{$id}'");
		if ($update) {
			$resp['status'] = 'success';
			$resp['msg'] = "Enrollment Status has successfully updated.";
		} else {
			$resp['status'] = 'failed';
			$resp['msg'] = "An error occurred. Error: " . $this->conn->error;
		}
		if ($resp['status'] == 'success') {
			$this->settings->set_flashdata('success', $resp['msg']);
			return json_encode($resp);
		}
	}
}

//=========   All the Functions Switch Case   =============///////


$Master = new Master();
$action = !isset($_GET['f']) ? 'none' : strtolower($_GET['f']);
$sysset = new SystemSettings();
switch ($action) {
	case 'save_service':
		echo $Master->save_service();
		break;
	case 'delete_service':
		echo $Master->delete_service();
		break;
	case 'save_babysitter':
		echo $Master->save_babysitter();
		break;
	case 'delete_babysitter':
		echo $Master->delete_babysitter();
		break;
	case 'save_enrollment':
		echo $Master->save_enrollment();
		break;
	case 'delete_enrollment':
		echo $Master->delete_enrollment();
		break;
	case 'update_status':
		echo $Master->update_status();
		break;

	case 'occupied_status':
		echo $Master->occupied_status();
		break;
	case 'babysitter_enrollment':
		echo $Master->babysitter_enrollment();
		break;
	case 'babysitter_enrollment_update':
		echo $Master->babysitter_enrollment_update();
		break;

	case 'user_occupied_status':
		echo $Master->user_occupied_status();
		break;
	case 'attendance':
		echo $Master->attendance();
		break;
	case 'attendance':
		echo $Master->attendance_update();
		break;
		// case 'take_attendance':
		// 	echo $Master->take_attendance();
	default:
		// echo $sysset->index();
		break;
}
