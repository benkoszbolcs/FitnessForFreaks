<?php
declare(strict_types=1);

// Include environment
require_once("../../common/php/environment.php");

// Set SQL command
$query =  "SELECT `forumido` AS 'Fórumidő', 
                  `felhasznalo`.`felhNev` AS 'Felhasználónév',
                  `tapasztalat` AS 'Tapasztalat' 
             FROM `forum`
             JOIN `felhasznalo` ON
                  `felhasznalo`.`felhid` = `forum`.`felhid`
         ORDER BY `forumido` DESC;";

// Connect to MySQL server
$db = new Database();

// Execute SQL command
$result = $db->execute($query);

// Close connection
$db = null;

// Ser response
Util::setResponse($result);