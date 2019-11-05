<?php
 include "cabecera.php";
 foreach ($personas as $persona)
 {
 echo "<div class='persona'>";
 echo "<p> " . htmlspecialchars($persona['nombre']) . " " .
 strtoupper(htmlspecialchars($persona['apellido'])) . "</p>";
 echo "</div>\n";
 }
 include "pie.php";
?>