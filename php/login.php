<?php
declare(strict_types=1);

// Include environment
require_once("../../common/php/environment.php");

// Get arguments
$args = Util::getArgs();

// Set SQL command
$query =  "SELECT 	`felhid`, 
					`felhNev`, 
					`jelszo`, 
					`nem` 
			FROM `felhasznalo` 
			WHERE `email` = ?
			LIMIT 1";

// Connect to MySQL server
$db = new Database();

// Execute SQL command
$result = $db->execute($query, array($args['email']));

// Close connection
$db = null;

// Check result
if (is_null($result))
	Util::setError("Felhasználó nem létezik ezen az e-mail címen!");

// Simplifying the result
$result = $result[0];

// Check password
if ($result['jelszo'] !== $args['jelszo'])
	Util::setError("Helytelen jelszó!");

// Remove password property
unset($result['jelszo']);

// Ser response
Util::setResponse($result);