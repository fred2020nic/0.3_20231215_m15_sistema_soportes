<?php include 'db_connect.php' ?>

<?php
error_reporting(0);
/*
f7dc6f Amarillo
5499c7 Azul
a569bd morado
2ecc71 verde
b2babb gris
e74c3c rojo
*/
function getColores(){

	return $colores=['f7dc6f','5499c7', 'a569bd','2ecc71','b2babb','e74c3c'];
}


function getMes($mes,$inventario,$color,$conn){

	$colores=getColores();
	$fecha_inicial=date("Y-$mes-01");
	$fecha_final=date("Y-m-t", strtotime($fecha_inicial));


	$sql="select number_inventory from equipments where `date_created`>='$fecha_inicial 00:00:00' and date_created<='$fecha_final 23:59:59' and number_inventory=$inventario and revision=1";

	$qry=$conn->query($sql);

	if($qry->num_rows>0 && $inventario!=""){
		return '#'.$colores[$color];
	}
	else{
		return "";
	}

}

function getFrecuencia($inventario,$conn) {

$sql="select count(e.number_inventory)as total_year,year(e.date_created) as year,e.`number_inventory`,min(`date_created`) as fecha_inicial, max(date_created) as fecha_final,
(DATEDIFF(max(date_created),min(e.date_created))) as resta_dias
from `equipments` e 
where e.`number_inventory`=$inventario
and e.revision=1
group by e.number_inventory, year(e.date_created),e.number_inventory";

	
$rowsql=$conn->query($sql);
$frecuencia='Anual';
$resta_dias=365;
$total_year=1;

if($rowsql->num_rows>0){
	$row=$rowsql->fetch_object();
	$total_year=$row->total_year;
	$resta_dias=$row->resta_dias;
}

if ($resta_dias>360){
	if($total_year=1)  $frecuencia='Anual';
	if($total_year==2) $frecuencia='Semestral';
	if($total_year==3) $frecuencia='Cuatrimestral';
	if($total_year==4) $frecuencia='Trimestral';
	if($total_year>4 && $total_year<=6) $frecuencia='Bimensual';
	if($total_year>6) $frecuencia="Mensual";
		
}
	

if ($resta_dias>=180 && $resta_dias<=360){
	if($total_year==1)  $frecuencia='Anual';
	if($total_year==2) $frecuencia='Semestral';
	if($total_year==3) $frecuencia='Trimestral';
	if($total_year>3 && $total_year<=5) $frecuencia='Bimensual';
	if($total_year>=6) $frecuencia="Mensual";
}
	

if ($resta_dias>=60  && $resta_dias<180){
	if($total_year==1)  $frecuencia='Anual';
	if($total_year==2) $frecuencia='Trimestral';
	if($total_year>2) $frecuencia='Bimensual';
	if($total_year>=4) $frecuencia="Mensual";
} 
	

if ($resta_dias<=60 ){
	if($total_year==1) $frecuencia='Anual';
	if($total_year==2) $frecuencia='Bimensual';
	if($total_year==3) $frecuencia='Trimestral';
	if($total_year>=4)  $frecuencia='Semestral';
}

return $frecuencia;

}

$colores=getColores();

?>

<div class="col-lg-12">
	<div class="card">
		<div class="card-body">
			<table class="table tabe-hover table-bordered" id="list">
				<thead>
					<tr>
						<th>#</th>
						<th>Disciplina</th>
						<th>Encargado</th>
						<th>Marca</th>
						<th>Caracteristicas</th>
						<th>Nro Inventario</th>
						<th>Frecuencia</th>
						<th>Ene</th>
						<th>Feb</th>
						<th>Marz</th>
						<th>Abr</th>
						<th>May</th>
						<th>Jun</th>
						<th>Jul</th>
						<th>Ago</th>
						<th>Sep</th>
						<th>Oct</th>
						<th>Nov</th>
						<th>Dic</th>
					</tr>
				</thead>
				<tbody>
					<?php
					$i = 1;
					
					$qry = $conn->query("SELECT * FROM reporte_frecuencia_anual group by inventario  order by inventario asc ");
					while ($row = $qry->fetch_object()) :
					$contmes=0;
					$color = array_rand($colores, 1);
					
					?>
						<tr>
							<th class="text-center"><?php echo $row->equipo_id ?></th>
							<td><?php echo $row->disciplina ?></td>
							<td><?php echo $row->encargado ?></td>
							<td><?php echo $row->marca ?></td>
							<td><?php echo $row->caracteristicas ?></td>
							<td><?php echo $row->inventario ?></td>
							<td><?php echo getFrecuencia($row->inventario,$conn) ?></td>
							<?php for($k=1;$k<=12;$k++):?>
							<?php 
								$colmes=getMes($k,$row->inventario,$color,$conn);
							?>	
							<td style="background-color:<?php echo $colmes  ?>" >
								&nbsp;
							</td>
							<?php endfor;?>

					
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