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

// Randomize
shuffle($data);

$restDays = [1, 3, 6];
$data     = array_chunk($data, 6);
$result   = [];
$index    = 0;
for($i = 0; $i < 6; $i++) {
  if (!in_array($i, $restDays)) {
    $result[$i] = $data[$index++];
  }
}

// Close connection
$db = null;

// Ser response
Util::setResponse($result);