<?php
declare(strict_types=1);

// Beleértve a környezeti beállításokat
require_once("./environment.php");

// Bemeneti adatok lekérése
$args = Util::getArgs();

// Ellenőrizzük, hogy minden szükséges mező meg van-e
if (!isset($args['email']) || !isset($args['password']) || !isset($args['first_name']) || !isset($args['last_name'])) {
    echo json_encode(["error" => "Minden mező kitöltése kötelező!"]);
    exit;
}

// Email cím ellenőrzése
if (!filter_var($args['email'], FILTER_VALIDATE_EMAIL)) {
    echo json_encode(["error" => "Érvénytelen email cím!"]);
    exit;
}

// Jelszó ellenőrzése (minimum 6 karakter)
if (strlen($args['password']) < 6) {
    echo json_encode(["error" => "A jelszónak legalább 6 karakter hosszúnak kell lennie!"]);
    exit;
}

// Jelszó titkosítása (hash)
$hashedPassword = password_hash($args['password'], PASSWORD_DEFAULT);

// Új adatbázis kapcsolat létrehozása
$db = new Database();

// Lekérdezzük, hogy az email cím már létezik-e
$query = "SELECT id FROM users WHERE email = ? LIMIT 1";
$result = $db->execute($query, array($args['email']));

// Ha létezik már ilyen email, hibát jelez
if ($result) {
    echo json_encode(["error" => "Ez az email cím már regisztrálva van!"]);
    exit;
}

// Ellenőrizzük, hogy sikerült-e beszúrni az adatokat
if ($insertResult) {
    echo json_encode(["data" => "Sikeres regisztráció!"]);
} else {
    echo json_encode(["error" => "Hiba történt a regisztráció során!"]);
}

// Kapcsolat bezárása
$db = null;