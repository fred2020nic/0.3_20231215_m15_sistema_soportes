<div class="row">
    <div class="col-sm-9">
        <div class="card">
            <div class="card-body">
                <h1 class="card-title">Reporte de Sstemas</h1>


            </div>
        </div>
    </div>
    <div class="col-sm-3">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title col-12">Ordenes de Trabajo</h5>
                <input class="card-text col-12">
            </div>
        </div>
    </div>
</div>

<!-- Segunda  seccion-->

<div class="row">
            <!-- Primera Columna -->
            <div class="col-md-6 p-2 mb-2">
                <h2>Servicios a Realizar</h2>
                <form>
                    <!-- Fila 1 de Radio Buttons -->
                    <div class="row">
                    <div class="form-check form-check-inline col-5">
                        <input class="form-check-input" type="radio" name="opcion1" id="radio1">
                        <label class="form-check-label" for="radio1">Correctivo</label>
                    </div>
                    <div class="form-check form-check-inline col-5">
                        <input class="form-check-input" type="radio" name="opcion1" id="radio2">
                        <label class="form-check-label" for="radio2">Preventivo</label>
                    </div>
                    </div>
                    <div class="row">
                    <!-- Fila 2 de Radio Buttons -->
                    <div class="form-check form-check-inline col-5">
                        <input class="form-check-input" type="radio" name="opcion2" id="radio3">
                        <label class="form-check-label" for="radio3">Capacitacion</label>
                    </div>
                    <div class="form-check form-check-inline col-5">
                        <input class="form-check-input" type="radio" name="opcion2" id="radio4">
                        <label class="form-check-label" for="radio4">Servicio Operativo</label>
                    </div>
                    </div>
                    <div class="row">
                    <!-- Fila 3 de Radio Buttons -->
                    <div class="form-check form-check-inline col-5">
                        <input class="form-check-input" type="radio" name="opcion3" id="radio5">
                        <label class="form-check-label" for="radio5">Servicio Porgramado</label>
                    </div>
                    <div class="form-check form-check-inline col-5">
                        <input class="form-check-input" type="radio" name="opcion3" id="radio6">
                        <label class="form-check-label" for="radio6">Incidencias</label>
                    </div>
                    </div>
                </form>
            </div>

            <hr>
            <!-- Segunda Columna -->
            <div class="col-md-6">
            <h3>Datos del Equipo</h3>
    <table class="table">
        <tbody>
            <tr>
                <th>Nombre del Equipo:</th>
                <td><input type="text" class="form-control" placeholder="Impresora"></td>
            </tr>
            <tr>
                <th>Ubicación del Equipo:</th>
                <td><input type="text" class="form-control" placeholder="PASILLO PROVEEDORES"></td>
            </tr>
            <tr>
                <th>N° de Inventario:</th>
                <td><input type="text" class="form-control" placeholder="HAC-001"></td>
            </tr>
            <tr>
                <th>N° de Serie:</th>
                <td><input type="text" class="form-control" placeholder="VR89434700"></td>
            </tr>
            <tr>
                <th>Modelo:</th>
                <td><input type="text" class="form-control" placeholder="M2040"></td>
            </tr>
            <tr>
                <th>Marca:</th>
                <td><input type="text" class="form-control" placeholder="KYOCERA"></td>
            </tr>
        </tbody>
    </table>
            </div>
        </div>

<hr>

        <!-- Tercera  seccion-->

<div class="row">
            <!-- Primera Columna -->
            <div class="col-md-6 p-2 mb-2 bg.">
            <h3>Tiempos de Servicio</h3>
    <table class="table">
        <thead>
            <tr>
                <th>Fecha</th>
                <th colspan="2">Tiempo</th>
            </tr>
            <tr>
                <th>D</th>
                <th>M</th>
                <th>A</th>
                <th>Inicio</th>
                <th>Término</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><input type="text" class="form-control" placeholder="06"></td>
                <td><input type="text" class="form-control" placeholder="11"></td>
                <td><input type="text" class="form-control" placeholder="23"></td>
                <td><input type="text" class="form-control" placeholder="13:00"></td>
                <td><input type="text" class="form-control" placeholder="13:10"></td>
            </tr>
        </tbody>
    </table>
            </div>

            <!-- Segunda Columna -->
            <div class="col-md-6">
                <h2>Evaluiacion de Riegos</h2>
                <table class="table">
                    <thead>
                        <tr>
                            <th>Evaluación</th>
                            <th>Sí</th>
                            <th>No</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Fila de Ejemplo -->
                        <tr>
                            <td>Elaboracion de Formato de Obra</td>
                            <td><input type="radio" name="eval1" id="eval1-yes"></td>
                            <td><input type="radio" name="eval1" id="eval1-no"></td>
                        </tr>

                        <tr>
                            <td>Elaboracion de formato de elaaluacion de incendio</td>
                            <td><input type="radio" name="eval1" id="eval1-yes"></td>
                            <td><input type="radio" name="eval1" id="eval1-no"></td>
                        </tr>

                        <tr>
                            <td>Delimitacion de Area</td>
                            <td><input type="radio" name="eval1" id="eval1-yes"></td>
                            <td><input type="radio" name="eval1" id="eval1-no"></td>
                        </tr>
                        <!-- Agrega más filas según sea necesario -->
                    </tbody>
                </table>
            </div>
        </div>

<!-- Cuarta seccion-->
<hr>
<div class="container col-12">
    <h3>Descripción Completa del Servicio</h3>
    <div class="form-group">
        <label for="mantenimientoPreventivo">Mantenimiento preventivo:</label>
        <input type="text" class="form-control" id="mantenimientoPreventivo">
    </div>
    <div class="form-group">
        <label for="mantenimientoPreventivo">limpieza de Unidad de Riesgo:</label>
        <input type="text" class="form-control" id="mantenimientoPreventivo">
    </div>
    <div class="form-group">
        <label for="mantenimientoPreventivo">Limpieza de Componetes toner residual:</label>
        <input type="text" class="form-control" id="mantenimientoPreventivo">
    </div>
    <div class="form-group">
        <label for="mantenimientoPreventivo">Extraccion de toner residual:</label>
        <input type="text" class="form-control" id="mantenimientoPreventivo">
    </div>
    <div class="form-group">
        <label for="mantenimientoPreventivo">Impresion prueba:</label>
        <input type="text" class="form-control" id="mantenimientoPreventivo">
    </div>
    <!-- Repite el elemento anterior para cada ítem de servicio que necesites -->
<hr>
    <h3>Condiciones en las que se deja el equipo:</h3>
    <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" name="estadoEquipo" id="funcionando" value="funcionando">
        <label class="form-check-label" for="funcionando">Funcionando</label>
    </div>
    <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" name="estadoEquipo" id="funcionandoParcialmente" value="funcionandoParcialmente">
        <label class="form-check-label" for="funcionandoParcialmente">Funcionando Parcialmente</label>
    </div>
    <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" name="estadoEquipo" id="retirado" value="retirado">
        <label class="form-check-label" for="retirado">Retirado</label>
    </div>
</div>

<!-- Quita seccion-->
<hr>
<div class="container mt-3">
    <h3>Material Utilizado</h3>
    <table class="table">
        <thead>
            <tr>
                <th style="width:10%">Cantidad</th>
                <th>Nombre</th>
               
                <th style="width:10%">Cantidad</th>
                <th>Nombre</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><input type="number" class="form-control" value="1"></td>
                <td><input type="text" class="form-control" placeholder="bolsas para basura"></td>
                <td><input type="text" class="form-control" placeholder=""></td>
                <td><input type="text" class="form-control" placeholder=""></td>
            </tr>
            <tr>
                <td><input type="number" class="form-control" value="1"></td>
                <td><input type="text" class="form-control" placeholder="paño azul de limpieza"></td>
                <td><input type="text" class="form-control" placeholder=""></td>
                <td><input type="text" class="form-control" placeholder=""></td>
            </tr>
            <tr>
                <td><input type="number" class="form-control" value="1"></td>
                <td><input type="text" class="form-control" placeholder="brocha"></td>
                <td><input type="text" class="form-control" placeholder=""></td>
                <td><input type="text" class="form-control" placeholder=""></td>
            </tr>
            <!-- Agrega más filas según sea necesario -->
        </tbody>
    </table>
</div>

<hr>
<!-- Sexta seccion-->

<p class="p-2 mb-2">Observaciones</p>
<textarea name="" id="" cols="150" rows="5"></textarea>
<br><br>
            <hr>
            <label for="">FEHCA DE ENTREGA</label>
            <input type="date"   />
            <hr>
<br>
<br>
<!-- Septima seccion-->
<h3>Datos de control</h3>
<br>
<br>

<table class="table">
        <thead>
            <tr>
                <th>Realizo</th>
                <th>Superviso</th>
                <th>Aceptacion Usuario</th>
                <th>Visto Bueno</th>
               
            </tr>
        </thead>
       
    </table>

