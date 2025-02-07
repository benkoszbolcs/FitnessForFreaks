<?php
declare(strict_types=1);

// Beleértve a környezeti beállításokat
require_once("../../common/php/environment.php");

// Bemeneti adatok lekérése
$args = Util::getArgs();

// Új adatbázis kapcsolat létrehozása
$db = new Database();

// Lekérdezzük, hogy az email cím már létezik-e
$query = "SELECT id FROM users WHERE email = ? LIMIT 1";
$result = $db->execute($query, array($args['email']));

// Ha létezik már ilyen email, hibát jelez
if ($result) {
    Util::setError("Ez az email cím már regisztrálva van!");
}

$query = "INSERT INTO `felhasznalo` (`felhNev`, `email`, `jelszo`, `nem`, `szulEv`) VALUES (?,?,?,?,?) ";

$result = $db->execute($query, array_values($args));

// Kapcsolat bezárása
$db = null;

// Ser response
Util::setResponse($result);