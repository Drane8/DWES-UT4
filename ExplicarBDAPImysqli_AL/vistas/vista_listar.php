<?php
include "cabecera.php";
echo "<table border ='1'><tr><th>Nombre</th><th>Apellido</th><th>Edad</th><th>Est.
civil</th><th>Género</th></tr>";
foreach ($personas as $persona) {
    echo "<tr>";
    echo "<td>" . htmlspecialchars($persona['nombre']) . "</td>";
    echo "<td>" . htmlspecialchars($persona['apellido']) . "</td>";
    echo "<td>{$persona['edad']}</td>";
    echo "<td>{$persona['estadoC']}</td>";
    echo "<td>{$persona['sexo']}</td>";
    echo "</tr>";
}
echo "</table>";
include "pie.php";
