<?php
declare(strict_types=1);

// Include environment
require_once("./environment.php");

// Set SQL command
$query =  "SELECT `forumido`, 
                  `felhasznalo`.`felhNev`,
                  `tapasztalat` 
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