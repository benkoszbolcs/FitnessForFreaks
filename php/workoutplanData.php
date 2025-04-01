<?php
declare(strict_types=1);

// Include environment
require_once("../../common/php/environment.php");

// Set SQL command
$query= "SELECT `gyakid`,
                `gyakNev`,
                `gyakVideo`,
                `gyakKep`,
                `gyakLeiras` FROM `gyakorlat`";

// Connect to MySQL server
$db = new Database();

// Execute SQL command
$data = $db->execute($query);


// Close connection
$db = null;

// Ser response
Util::setResponse($data);