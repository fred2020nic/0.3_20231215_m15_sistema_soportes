<?php

$conn = new mysqli('localhost', 'root', '', 'soporte-tecnico_2024-01-15') or die("Could not connect to mysql" . mysqli_error($con));

mysqli_query($conn, "SET SESSION sql_mode = ''");
