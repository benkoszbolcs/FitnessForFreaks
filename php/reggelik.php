<?php

declare(strict_types=1);

// Include environment
require_once("../../common/php/environment.php");

// Connect to MySQL server
$db = new Database();

// Set SQL command
$query= "SELECT `id`,
                `nev`,
                `kep`,
                `figyelemfelkeltes`,
                `leiras`,
                `hozzavalok`,
                `elkeszites`
          FROM  `reggelik`;";

// Execute SQL command
$result = $db->execute($query);

// Close connection
$db = null;

// Ser response
Util::setResponse($result);