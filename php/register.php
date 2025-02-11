<?php
declare(strict_types=1);

// Beleértve a környezeti beállításokat
require_once("../../common/php/environment.php");

// Bemeneti adatok lekérése
$args = Util::getArgs();

// Új adatbázis kapcsolat létrehozása
$db = new Database();

// Lekérdezzük, hogy az email cím már létezik-e
$query = "SELECT `felhid` 
          FROM `felhasznalo` 
          WHERE `email` = ? 
          LIMIT 1";

// Végrehajtás
$result = $db->execute($query, $args['email']);

// Ha létezik már ilyen email, hibát jelez
if ($result) {
    Util::setError("Ez az email cím már regisztrálva van!");
}

$query = $db->preparateInsert('felhasznalo', $args);

$result = $db->execute($query, array_values($args));

// Kapcsolat bezárása
$db = null;

if (!$result["affectedRows"]) {
    Util::setError("Sikertelen regisztráció!");
}

// Ser response
Util::setResponse($result["lastInsertId"]);