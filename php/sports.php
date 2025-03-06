<?php
declare(strict_types=1);

// Include environment
require_once("../../common/php/environment.php");

// Set SQL command
$query= "SELECT `id`,
                `megnevezes`,
                `rovid_leiras`,
                `reszletes_leiras`,
                `kep`,
                `video` FROM `sportok`";

// Connect to MySQL server
$db = new Database();

// Execute SQL command
$result = $db->execute($query);

// Close connection
$db = null;

// Ser response
Util::setResponse($result);