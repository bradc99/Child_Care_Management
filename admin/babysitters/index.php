<style>
	.img-avatar {
		width: 45px;
		height: 45px;
		object-fit: cover;
		object-position: center center;
		border-radius: 100%;
	}
</style>
<div class="card card-outline card-info rounded-0">
	<div class="card-header">
		<h3 class="card-title">List of Baby Sitters</h3>
		<div class="card-tools">
			<a href="./?page=user/manage_user" class="btn btn-flat btn-primary btn-sm"><i class="fa fa-plus"></i> Add New</a>
		</div>
	</div>
	<div class="card-body">
		<div class="container-fluid">
			<div class="container-fluid">
				<table class="table table-hover table-striped">
					<!-- <colgroup>
					<col width="5%">
					<col width="10%">
					<col width="20%">
					<col width="20%">
					<col width="15%">
					<col width="15%">
					<col width="10%">
				</colgroup> -->
					<thead>
						<tr>
							<th>#</th>
							<th>Avatar</th>
							<th>Firstname</th>
				
		
							<th>Username</th>
						</tr>
					</thead>
					<tbody>
						<?php
						$i = 1;
						$qry = $conn->query("select * from users where type=3 and status=1 order by firstname asc ");
						while ($row = $qry->fetch_assoc()) :
						?>
							<tr>
								<td style="width:15%" class="center"><?php echo $i++; ?></td>
								<td style="width:15%" class="center"><img src="<?php echo validate_image(isset($row['id']) ? "uploads/{$row['id']}.png" : "") . (isset($row['date_updated']) ? "?v=" . strtotime($row['date_updated']) : "") ?>" class="img-avatar img-thumbnail p-0 border-2" alt="user_avatar"></td>
								<td style="width:15%" ><?php echo ucwords($row['firstname']) ?></td>
								<td style="width:15%" ><?php echo ucwords($row['username']) ?></td>
								<!-- <td style="width:15%"  class="center">
									<?php if ($row['status'] == 1) : ?>
										<span class="badge badge-pill badge-success">Active</span>
									<?php else : ?>
										<span class="badge badge-pill badge-primary">Inactive</span>
									<?php endif; ?>
								</td> -->

						<!-- 		<td style="width:20%"  class="center">
									<?php if ($row['occupied_status'] == "not_occupied") : ?>
										<span class="badge badge-pill badge-success">NOT OCCUPIED</span>
									<?php else : ?>
										<span class="badge badge-pill badge-primary">OCCUPIED</span>
									<?php endif; ?>
								</td> -->
								<!-- <td style="width:20%"  align="text-center">
									<button type="button" class="btn btn-flat btn-default btn-sm dropdown-toggle dropdown-icon" data-toggle="dropdown">
										Action
										<span class="sr-only">Toggle Dropdown</span>
									</button>
									<div class="dropdown-menu" role="menu">
										<a class="dropdown-item view_details" href="javascript:void(0)" data-id="<?php echo $row['id'] ?>"><span class="fa fa-eye text-dark"></span> View</a>
										<div class="dropdown-divider"></div>
									
										<a class="dropdown-item user_occupied_status" href="javascript:void(0)" data-id="<?php echo $row['id'] ?>" data-status="<?php echo $row['occupied_status'] ?>" data-code="<?php echo $row['firstname'] ?>"><span class="fa fa-check text-dark"></span> Update Status</a>
											<div class="dropdown-divider"></div>
										<a class="dropdown-item" href="./?page=user/manage_user&id=<?= $row['id'] ?>" data-id="<?php echo $row['id'] ?>"><span class="fa fa-edit text-primary"></span> Edit</a>
										<div class="dropdown-divider"></div>
										<a class="dropdown-item delete_data" href="javascript:void(0)" data-id="<?php echo $row['id'] ?>" data-name="<?= $row['code'] ?>"><span class="fa fa-trash text-danger"></span> Delete</a>
									</div>
								</td> -->
							</tr>
						<?php endwhile; ?>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<script>
	$(document).ready(function() {
		$('.delete_data').click(function() {
			_conf("Are you sure to delete <b>" + $(this).attr('data-name') + "</b> from babysitter List permanently?", "delete_babysitter", [$(this).attr('data-id')])
		})
		$('.user_occupied_status').click(function() {
			uni_modal("Update <b>" + $(this).attr('data-code') + "\'s</b> Occupied Status", "babysitters/user_occupied_status.php?id=" + $(this).attr('data-id') + "&occupied_status=" + $(this).attr('data-status'))
		})

		$('.table td,.table th').addClass('py-1 px-2 align-middle')
		$('.verify_user').click(function() {
			_conf("Are you sure to verify <b>" + $(this).attr('data-name') + "<b/>?", "verify_user", [$(this).attr('data-id')])
		})
		$('.view_details').click(function() {
			uni_modal('Babysitter Details', "babysitters/view_details.php?id=" + $(this).attr('data-id'), 'mid-large')
		})
		$('.table').dataTable();

	})

	function delete_babysitter($id) {
		start_loader();
		$.ajax({
			url: _base_url_ + "classes/Master.php?f=delete_babysitter",
			method: "POST",
			data: {
				id: $id
			},
			dataType: "json",
			error: err => {
				console.log(err)
				alert_toast("An error occured.", 'error');
				end_loader();
			},
			success: function(resp) {
				if (typeof resp == 'object' && resp.status == 'success') {
					location.reload();
				} else {
					alert_toast("An error occured.", 'error');
					end_loader();
				}
			}
		})
	}

	function verify_user($id) {
		start_loader();
		$.ajax({
			url: _base_url_ + "classes/Users.php?f=verify_babysitter",
			method: "POST",
			data: {
				id: $id
			},
			dataType: "json",
			error: err => {
				console.log(err)
				alert_toast("An error occured.", 'error');
				end_loader();
			},
			success: function(resp) {
				if (typeof resp == 'object' && resp.status == 'success') {
					location.reload();
				} else {
					alert_toast("An error occured.", 'error');
					end_loader();
				}
			}
		})
	}
</script>