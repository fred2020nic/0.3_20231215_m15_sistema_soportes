<?php include 'db_connect.php' ?>
<div class="col-lg-12">
	<div class="card">
		<div class="card-body">
			<table class="table tabe-hover table-bordered" id="list">
				<thead>
					<tr>
						<th>#</th>
						<th>Fecha Creación</th>
						<th># Inventario</th>
						<th>Equipo</th>
						<th>Marca</th>
						<th>Modelo</th>
						<th>Revision Si/No</th>
						<th>Acción</th>
					</tr>
				</thead>
				<tbody>
					<?php
					$i = 1;
					$qry = $conn->query("SELECT * FROM equipments order by id desc");
					while ($row = $qry->fetch_assoc()) :
					?>
						<tr>
							<th class="text-center"><?php echo $i++ ?></th>
							<td><b><?php echo ($row['date_created']) ?></b></td>
							<td><b><?php echo ($row['number_inventory']) ?></b></td>
							<td><b><?php echo $row['name'] ?></b></td>
							<td><b><?php echo $row['brand'] ?></b></td>
							<td><b><?php echo $row['model'] ?></b></td>
							<td>
								<?php if($row['revision']==1):?>
								<b>Si</b>
								<?php else:?>
								<b>No</b>
								<?php endif ?>
							</td>

							<td class="text-center">
								<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
									Acción
								</button>
								<div class="dropdown-menu" style="">
									<a class="dropdown-item" href="./index.php?page=edit_equipment&id=<?php echo $row['id'] ?>">Editar</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="./index.php?page=equipment_unsubscribe&id=<?php echo $row['id'] ?>">Dar de Baja</a>
									<div class="dropdown-divider"></div>
									
									<a class="dropdown-item" href="./index.php?page=equipment_new_revision&id=<?php echo $row['id'] ?>">Nueva Revisión</a>
									<div class="dropdown-divider"></div>

									<a class="dropdown-item" href="./index.php?page=equipment_report_responsible&id=<?php echo $row['id'] ?>">Informe Responsiva Equipo</a>
									<div class="dropdown-divider"></div>

									<!-- Reportes de sistemas-->

									<a class="dropdown-item" href="./index.php?page=equipment_report_sistem&id=<?php echo $row['id'] ?>">Reporte de Sistemas</a>
									<div class="dropdown-divider"></div>


									<a class="dropdown-item delete" href="javascript:void(0)" data-id="<?php echo $row['id'] ?>">Eliminar</a>
								</div>
							</td>
						</tr>
					<?php endwhile; ?>
				</tbody>
			</table>
		</div>
	</div>
</div>
<script>
	$(document).ready(function() {
		$('#list').dataTable()
		$('.delete').click(function(e) {
			e.preventDefault();
			//alert('Deseas eliminar este equipo?');
			_conf("Deseas eliminar este equipo?", "delete_equipment", [$(this).attr('data-id')])
		})
	})

	function delete_equipment($id) {
		start_load()
		$.ajax({
			url: 'ajax.php?action=delete_equipment',
			method: 'POST',
			data: {
				id: $id
			},
			success: function(resp) {
				if (resp == 1) {
					alert_toast("Datos eliminados correctamente", 'success')
					setTimeout(function() {
						location.reload()
					}, 1500)

				}
			}
		})
	}
</script>