<?php

$host = $_SERVER['HTTP_HOST'];
//  var_dump($host);

/// webhook

if ($host === 'localhost') {

$conn = new mysqli('localhost', 'root', '', 'soporte-tecnico_2024-01-15') or die("Could not connect to mysql" . mysqli_error($con));

mysqli_query($conn, "SET SESSION sql_mode = ''");

} else {

    $conn = new mysqli('localhost', 'u363832898_m15_sistema', '#1234Abcd..#', 'u363832898_m15_sistema') or die("Could not connect to mysql" . mysqli_error($con));

    mysqli_query($conn, "SET SESSION sql_mode = ''");


}

?>
