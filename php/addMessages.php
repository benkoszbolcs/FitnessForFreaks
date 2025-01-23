<?php
declare(strict_types=1);

// Include environment
require_once("./environment.php");

// Get arguments
$args = Util::getArgs();

//$args['forumido'] = date('Y-m-d H:i:s', strtotime(new date()));

// Connect to MySQL server
$db = new Database();

// Set SQL command
$query =  $db->preparateInsert('forum', $args);

// Execute SQL command
$result = $db->execute($query, array_values($args));

// Close connection
$db = null;

// Ser response
Util::setResponse($result);