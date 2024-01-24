  <aside class="main-sidebar sidebar-clear-warning
   elevation-4">
    <div class="dropdown">
      <a href="javascript:void(0)" class="brand-link dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
        <span class="brand-image img-circle elevation-3 d-flex justify-content-center align-items-center bg-primary text-white font-weight-500" style="width: 38px;height:50px"><?php echo strtoupper(substr($_SESSION['login_firstname'], 0, 1) . substr($_SESSION['login_lastname'], 0, 1)) ?></span>
        <span class="brand-text font-weight-light"><?php echo ucwords($_SESSION['login_firstname'] . ' ' . $_SESSION['login_lastname']) ?></span>

      </a>
      <div class="dropdown-menu" style="">
        <a class="dropdown-item manage_account" href="javascript:void(0)" data-id="<?php echo $_SESSION['login_id'] ?>">Gestionar Cuenta</a>
        <div class="dropdown-divider"></div>
        <a class="dropdown-item" href="ajax.php?action=logout">Cerrar Sesión</a>
      </div>
    </div>
    <div class="sidebar">
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column nav-flat" data-widget="treeview" role="menu" data-accordion="false">
          <li class="nav-item dropdown">
            <a href="./" class="nav-link nav-home">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                Dashboard
              </p>
            </a>

          </li>

            <li class="nav-item">
              <a href="#" class="nav-link nav-edit_customer">
                <i class="nav-icon fas fa-users"></i>
                <p>
                  Cliente
                  <i class="right fas fa-angle-left"></i>
                </p>
              </a>
              <ul class="nav nav-treeview">
                <li class="nav-item">
                  <a href="./index.php?page=new_customer" class="nav-link nav-new_customer tree-item">
                    <i class="fas fa-angle-right nav-icon"></i>
                    <p>Agregar</p>
                  </a>
                </li>
                <li class="nav-item">
                  <a href="./index.php?page=customer_list" class="nav-link nav-customer_list tree-item">
                    <i class="fas fa-angle-right nav-icon"></i>
                    <p>Clientes</p>
                  </a>
                </li>
              </ul>
            </li>

              <li class="nav-item">
              <a href="#" class="nav-link nav-edit_staff">
                <i class="nav-icon fas fa-user"></i>
                <p>
                  Staff
                  <i class="right fas fa-angle-left"></i>
                </p>
              </a>
              <ul class="nav nav-treeview">
                <li class="nav-item">
                  <a href="./index.php?page=new_staff" class="nav-link nav-new_staff tree-item">
                    <i class="fas fa-angle-right nav-icon"></i>
                    <p>Agregar</p>
                  </a>
                </li>
                <li class="nav-item">
                  <a href="./index.php?page=staff_list" class="nav-link nav-staff_list tree-item">
                    <i class="fas fa-angle-right nav-icon"></i>
                    <p>Empleados</p>
                  </a>
                </li>
              </ul>
            </li>
            <li class="nav-item">
              <a href="./index.php?page=department_list" class="nav-link nav-department_list">
                <i class="nav-icon fas fa-columns"></i>
                <p>
                  Departmentos
                </p>
              </a>
            </li>

          <?php if ($_SESSION['login_type'] == 1) : ?>
         
          
          <?php endif; ?>
          <li class="nav-item">
            <a href="#" class="nav-link nav-edit_ticket nav-view_ticket">
              <i class="nav-icon fas fa-ticket-alt"></i>
              <p>
                Ticket
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">

              <li class="nav-item">
                <a href="./index.php?page=new_ticket" class="nav-link nav-new_ticket tree-item">
                  <i class="fas fa-angle-right nav-icon"></i>
                  <p>Agregar</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="./index.php?page=ticket_list" class="nav-link nav-ticket_list tree-item">
                  <i class="fas fa-angle-right nav-icon"></i>
                  <p>Listar Tickets</p>
                </a>
              </li>
            </ul>
          </li>

          <li class="nav-item">
            <a href="#" class="nav-link nav-edit_ticket nav-view_ticket">
              <i class="nav-icon fas fa-ticket-alt"></i>
              <p>
                Servicios
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">

              <li class="nav-item">
                <a href="index.php?page=manage_category" class="nav-link nav-new_ticket tree-item">
                  <i class="fas fa-angle-right nav-icon"></i>
                  <p>Nueva Categoria</p>
                </a>
              </li>

              <li class="nav-item">
                <a href="index.php?page=category" class="nav-link nav-new_ticket tree-item">
                  <i class="fas fa-angle-right nav-icon"></i>
                  <p>Listas Categorias</p>
                </a>
              </li>

              <li class="nav-item">
                <a href="index.php?page=manage_services" class="nav-link nav-new_ticket tree-item">
                  <i class="fas fa-angle-right nav-icon"></i>
                  <p>Crear Servicios</p>
                </a>
              </li>

              <li class="nav-item">
                <a href="index.php?page=service_list" class="nav-link nav-new_ticket tree-item">
                  <i class="fas fa-angle-right nav-icon"></i>
                  <p>Lista Servicios</p>
                </a>
              </li>

               <li class="nav-item">
                <a href="tickets/admin/?page=quote" class="nav-link nav-new_ticket tree-item">
                  <i class="fas fa-angle-right nav-icon"></i>
                  <p>Requerimientos</p>
                </a>
              </li>
             
            </ul>
          </li>


          <li class="nav-item">
            <a href="#" class="nav-link nav-edit_ticket nav-view_ticket">
              <i class="nav-icon fas fa-ticket-alt"></i>
              <p>
                Maintenance
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="index.php?page=create_user" class="nav-link nav-new_ticket tree-item">
                  <i class="fas fa-angle-right nav-icon"></i>
                  <p>Crear Usuario</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="index.php?page=user_list" class="nav-link nav-new_ticket tree-item">
                  <i class="fas fa-angle-right nav-icon"></i>
                  <p>Lista de Usuarios</p>
                </a>
              </li>

        
            </ul>
          </li>



          <li class="nav-item">
            <a href="#" class="nav-link nav-edit_ticket nav-view_ticket">
              <i class="nav-icon fas fa-ticket-alt"></i>
              <p>
                Equipos
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="index.php?page=new_equipment" class="nav-link nav-new_ticket tree-item">
                  <i class="fas fa-angle-right nav-icon"></i>
                  <p>Ingresar Equipo</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="index.php?page=equipment_list" class="nav-link nav-new_ticket tree-item">
                  <i class="fas fa-angle-right nav-icon"></i>
                  <p>Listar Equipos</p>
                </a>
              </li>

              <li class="nav-item">
                <a href="index.php?page=equipment_report" class="nav-link nav-new_ticket tree-item">
                  <i class="fas fa-angle-right nav-icon"></i>
                  <p>Informe Equipos</p>
                </a>
              </li>

              <li class="nav-item">
                <a href="index.php?page=equipment_report_sistem_list" class="nav-link nav-new_ticket tree-item">
                  <i class="fas fa-angle-right nav-icon"></i>
                  <p>Reprote de Sistemas</p>
                </a>
              </li>

               <li class="nav-item">
                <a href="index.php?page=equipment_report_revision_month" class="nav-link nav-new_ticket tree-item">
                  <i class="fas fa-angle-right nav-icon"></i>
                  <p>Informe Revisiones Mensual</p>
                </a>
              </li>
        
            </ul>
          </li>




        </ul>
      </nav>
    </div>
  </aside>
  <script>
    $(document).ready(function() {
      var page = '<?php echo isset($_GET['page']) ? $_GET['page'] : 'home' ?>';
      if ($('.nav-link.nav-' + page).length > 0) {
        $('.nav-link.nav-' + page).addClass('active')
        console.log($('.nav-link.nav-' + page).hasClass('tree-item'))
        if ($('.nav-link.nav-' + page).hasClass('tree-item') == true) {
          $('.nav-link.nav-' + page).closest('.nav-treeview').siblings('a').addClass('active')
          $('.nav-link.nav-' + page).closest('.nav-treeview').parent().addClass('menu-open')
        }
      }
      $('.manage_account').click(function() {
        uni_modal('Gestionar Cuenta', 'manage_user.php?id=' + $(this).attr('data-id'))
      })
    })
  </script>