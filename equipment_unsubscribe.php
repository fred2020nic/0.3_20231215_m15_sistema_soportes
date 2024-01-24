<?php
include 'db_connect.php';
error_reporting(E_ALL & ~E_WARNING & ~E_NOTICE);


$qry = $conn->query("SELECT * FROM equipments where id = ".$_GET['id'])->fetch_array();
foreach($qry as $k => $v){
	$$k = $v;
}
$qry = $conn->query("SELECT * FROM equipment_unsubscribe where equipment_id = ".$_GET['id'])->fetch_array();
foreach($qry as $k => $v){
	$$k = $v;
}

$causas = $conn->query("SELECT * FROM equipment_withdrawal_reason");
$reasons=json_decode(($withdrawal_reason));

$id=$_GET['id'];

?>

<div class="col-lg-12">
	<div class="card">
		<div class="card-body">
			<form action="" id="manage_equipment">
				<input type="hidden" name="id" value="<?php echo isset($id) ? $id : '' ?>">
				<div class="row">
					<div class="col-md-12 border-right">
						<b class="text-muted">Dar de Baja Equipo</b>
						<br/><br/>
						<div class="form-group float-left col-md-3">
							<label for="" class="control-label">Fecha</label>
							<input type="date" name="date" class="form-control form-control-sm" required value="<?php echo isset($date) ? $date : '' ?>">
						</div>

						<div class="form-group float-left col-md-3">
							<label for="" class="control-label">Nro Inventario </label>
							<input type="text" name="number_inventory" class="form-control form-control-sm solonumeros" required value="<?php echo isset($number_inventory) ? $number_inventory : '' ?>" disabled="true" >
						</div>

						<div class="form-group float-left col-md-3">
							<label for="" class="control-label">Serie </label>
							<input type="text" name="serie" class="form-control form-control-sm alfanumerico" required value="<?php echo isset($serie) ? $serie : '' ?>" disabled="true" >
						</div>


						<div class="form-group float-left col-md-3">
							<label for="" class="control-label">Fecha Ingreso </label>
							<input type="date" name="date_created" class="form-control form-control-sm" required value="<?php echo isset($date_created) ? date('Y-m-d',strtotime($date_created)) : '' ?>" disabled="true">
						</div>

					
						<div class="form-group float-left col-md-3">
							<label for="" class="control-label">Equipo</label>
							<input type="text" name="name" class="form-control form-control-sm" required value="<?php echo isset($name) ? $name : '' ?>" disabled="true" >
						</div>
						<div class="form-group float-left col-md-3">
							<label for="" class="control-label">Marca</label>
							<input type="text" name="brand" class="form-control form-control-sm" value="<?php echo isset($brand) ? $brand : '' ?>" disabled="true" >
						</div>
						<div class="form-group float-left col-md-3">
							<label for="" class="control-label">Modelo</label>
							<input type="text" name="model" class="form-control form-control-sm" required value="<?php echo isset($model) ? $model : '' ?>" disabled="true" >
						</div>
						<div class="form-group float-left col-md-3">
							<label for="" class="control-label">Tipo De Adquisición</label>
							<select name="acquisition_type" class="custom-select custom-select-sm select2" disabled="true">
								<option value="1">Compra</option>
							</select>
						</div>
					</div>

					<div class="col-md-12 border-right">
						<div class="form-group">
							<label for="" class="control-label">Descripción Estado Funcional Equipo.</label><br/>
							<textarea name="description" cols="15" rows="3" style="width: 100%" required="true"><?php echo isset($description) ? $description : '' ?></textarea>
						</div>
					</div>
					
						
				</div>
				<hr/>
	
				
				
				<div class="row">
					<div class="col-md-12 border-right">
						<b class="text-muted">Causas de Retiro</b>
						<br/><br/>
						<?php $cont=0;?>
						<?php while ($row = $causas->fetch_object()) :?>
						<div class="form-group col-md-6 float-left">
						<label>
							<?php if(in_array($row->id, $reasons)){
								$checked='checked=true';
							}else{
								$checked="";
							}
							?>
							<?php echo $row->name;?>
							&nbsp;&nbsp;
							<input type="checkbox" name="withdrawal_reason[]" value="<?php echo $row->id;?>" 
							<?php echo $checked ?>
							>
						</label>
						</div>
						<?php $cont++;?>
						<?php endwhile; ?>
					</div>
						

				</div>
				<hr>
				<div class="row">
					<div class="col-md-12 border-right">
						<b class="text-muted">Dictamen</b>
						<br/><br/>
						<div class="form-group col-md-2 float-left ">
							<label>Funcional&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="opinion" required="true" value="1" <?php if ($opinion==1): ?> checked="true" <?php endif;?> ></label><br/>
							<label>Disfuncional&nbsp;&nbsp;
							<input type="radio" name="opinion" required="true" value="0" <?php if ($opinion==0): ?> checked="true" <?php endif;?> ></label>
						</div>
						<div class="col-md-1 float-left">
							<label for="" class="control-label">Comentarios</label>
						</div>
						<div class="col-md-8 float-left">
							<textarea name="comments" required="true"  style="margin-left: 20px; width: 100%;height:120px" ><?php echo isset($comments) ? $comments : '' ?></textarea>
						</div>
					</div>
				</div>
				
				<hr>
				<div class="row">
					<div class="col-md-12 border-right">
						
						<div class="form-group col-md-3 float-left ">
							<b class="text-muted">Responsable de la evaluación</b>
							<br/><br/>
							<label>Ingeniero Sistemas&nbsp;&nbsp;
							<input type="radio" name="responsible" value="1" <?php if ($responsible==1): ?> checked="true" <?php endif;?> ></label><br/>
							<label>Proveedor Externo&nbsp;&nbsp;
							<input type="radio" name="responsible" value="2" <?php if ($responsible==2): ?> checked="true" <?php endif;?> ></label>
						</div>

						<div class="form-group col-md-9 float-left ">
							<b class="text-muted">Destino del equipo de baja</b>
							<br/><br/>
							<label>Guardar en bodega&nbsp;&nbsp;
							<input type="radio" name="destination" required="true" value="1" <?php if ($destination==1): ?> checked="true" <?php endif;?> > </label>
							&nbsp;&nbsp;<label>Devolución Al Proveedor&nbsp;&nbsp;
							<input type="radio" name="destination" required="true" value="2" <?php if ($destination==2): ?> checked="true" <?php endif;?> ></label><br/><br/>
							&nbsp;&nbsp;<label>Donar&nbsp;&nbsp;
							<input type="radio" name="destination" required="true" value="3" <?php if ($destination==3): ?> checked="true" <?php endif;?> ></label>
							&nbsp;&nbsp;<label>Venta&nbsp;&nbsp;
							<input type="radio" name="destination" required="true" value="4" <?php if ($destination==4): ?> checked="true" <?php endif;?> ></label>
							&nbsp;&nbsp;<label>Basura&nbsp;&nbsp;
							<input type="radio" name="destination" required="true" value="5" <?php if ($destination==5): ?> checked="true" <?php endif;?> ></label>
						</div>

					</div>
				</div>

				<div class="col-lg-12 text-right justify-content-center d-flex">
					<button class="btn btn-primary mr-2">Guardar</button>
					<button class="btn btn-secondary" type="reset">Resetear</button>
				</div>
			</form>
		</div>
	</div>
</div>
<script>
	

	$('.solonumeros').on('input', function () { 
            this.value = this.value.replace(/[^0-9]/g,'');
    });
    
	$('.alfanumerico').on('input',function(e){
		var alfanumerico = /^[a-zA-Z0-9]+$/;
		this.value = this.value.replace(/[^a-zA-Z0-9]/g,'');

	})
	
	$('#manage_equipment').submit(function(e) {
		e.preventDefault()
		start_load();

		var postData=new FormData($(this)[0]);
		/*
		$( ".file" ).each(function( index ) {
		  var file=$(this)[0].files[0];
		  var nameFile=$(this).attr('name');
		  postData.append(nameFile,file);
		});
		*/

	
		$.ajax({
			url: 'ajax.php?action=save_equipment_unsubscribe',
			data: postData,
			cache: false,
			dataType: 'text',
			contentType: false,
			processData: false,
			enctype: 'multipart/form-data',
			method: 'POST',
			type: 'POST',
			success: function(resp) {
				if (resp == 1) {
					end_load();
					alert_toast('Datos guardados correctamente', "success");
					setTimeout(function() {
						location.replace('index.php?page=equipment_list')
					}, 750)
				} else if (resp == 2) {
					$('#msg').html("<div class='alert alert-danger'>Error al tratar de guardar el equipo.</div>");
					$('[name="email"]').addClass("border-danger")
					end_load()
				}
			}
		})
	})
</script>