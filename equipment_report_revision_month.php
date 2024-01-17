<?php include 'db_connect.php' ?>

<?php


function getInforme($fecha_inicial,$fecha_final,$conn){

   $sql="SELECT
   r.id as 'revision_id',
   e.id AS equipo_id,
   e.name,
   e.brand,
   e.model,
   e.serie,
   e.number_inventory AS inventario,
   r.date_revision as date_revision
	FROM equipments e join equipment_delivery d on d.equipment_id = e.id
	inner join equipment_revision r on r.equipment_id=e.id
	where r.date_revision>='$fecha_inicial' and r.date_revision<='$fecha_final'";
	$qry=$conn->query($sql);

	if($qry->num_rows>0){
		return $qry;
	}
	else{
		return "";
	}



}
$fecha_inicial=isset($_GET['fecha_inicial'])?$_GET['fecha_inicial']:date('Y-m-01');
$fecha_final=isset($_GET['fecha_final'])?$_GET['fecha_final']:date('Y-m-t',strtotime($fecha_inicial));

$informe=getInforme($fecha_inicial,$fecha_final,$conn);
if($informe->num_rows>0){
	$equipos=$informe;
}else{
	$equipos=false;
}

?>

<div class="col-lg-12">
	<div class="card">
		<div class="card-body">
			<div>
				<form action="index.php?page=equipment_report_revision_month">
				<input type="hidden" name="page" value="equipment_report_revision_month">
				<div class="form-group col-md-3 float-left">
					<label for="" class="control-label">Fecha Inicial</label>
					<input type="date" name="fecha_inicial" class="form-control form-control-sm" required value="<?php echo isset($fecha_inicial) ? date('Y-m-d',strtotime($fecha_inicial)) : '' ?>">
				</div>

				<div class="form-group col-md-3 float-left">
					<label for="" class="control-label">Fecha Final</label>
					<input type="date" name="fecha_final" class="form-control form-control-sm" required value="<?php echo isset($fecha_final) ? date('Y-m-d',strtotime($fecha_final)) : '' ?>">
				</div>
				<div class="form-group col-md-3 float-left">
					<label>&nbsp;</label><br/>
					<button type="submit" class="btn btn-success">Enviar	</button>
				</div>
				</form>
			</div>

			<table class="table tabe-hover table-bordered" id="list">
				<thead>
					<tr>
						<th>#</th>
						<th>Equipo</th>
						<th>Marca</th>
						<th>Modelo</th>
						<th>Serie</th>
						<th>Nro Inventario</th>
						<th>Fecha</th>
						<th>Reporte</th>
						
					</tr>
				</thead>
				<tbody>
					<?php
					$i = 1;
					while ($equipos && $row = @$equipos->fetch_object()) :
					?>
						<tr>
							<td class="text-center"><?php echo $row->equipo_id ?></td>
							<td><?php echo $row->name ?></td>
							<td><?php echo $row->brand ?></td>
							<td><?php echo $row->model ?></td>
							<td><?php echo $row->serie ?></td>
							<td><?php echo $row->inventario ?></td>
							<td><?php echo $row->date_revision ?></td>
							<td><?php echo $row->revision_id ?></td>
					
						</tr>
					<?php endwhile; ?>
				</tbody>
			</table>
		</div>
	</div>
</div>
<script>
	$(document).ready(function() {
		
	})

</script>