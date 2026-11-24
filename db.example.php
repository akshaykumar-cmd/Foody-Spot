<?php
$host = "localhost";
$dbname = "your_database_name";
$username = "your_username";
$password = "your_password";
try {
    $pdo = new PDO(
        "mysql:host=$host;dbname=$dbname;charset=utf8mb4",
        $username,
        $password,
        [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
         PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC]
    );
} catch (PDOException $e) {
    die("Database connection failed. Create/import the foodyspot database first. " . htmlspecialchars($e->getMessage()));
}
if (session_status() === PHP_SESSION_NONE) session_start();

function h($value) {
    return htmlspecialchars((string)$value, ENT_QUOTES, "UTF-8");
}
function cart_count() {
    return array_sum($_SESSION["cart"] ?? []);
}
function require_login() {
    if (empty($_SESSION["user"])) {
        header("Location: login.php");
        exit;
    }
}
