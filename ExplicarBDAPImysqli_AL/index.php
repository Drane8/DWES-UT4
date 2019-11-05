<?php
require_once 'modelo/conexion.php';
include "helper/utilidades.php";
// se ha hecho click en el enlace Listar
if (isset($_GET['opcion']) && $_GET['opcion'] == 'listar') {
    $sql = 'SELECT * FROM personas';
    $personas = obtenerRegistros($conexion, $sql);
    include "vistas/vista_listar.php";
    exit();
}

$sql = 'SELECT nombre, apellido FROM personas';
$personas = obtenerRegistros($conexion, $sql);

include "vistas/vista_inicio.php";
