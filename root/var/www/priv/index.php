<?php
/**
 * Action-handler.
 */

$pass = getenv("MYSQL_PASS");
$host = getenv("MYSQL_HOST");
$host = "172.18.0.3:3306";

$db = new \PDO("mysql:host=$host;dbname=payproxy_test;charset=utf8mb4", "root", $pass, array());

exit;
require_once __DIR__ . "/../vendor/mpdroog/core/init-browser.php";

$req = core\Taint::getField("req", ["slug"]);
if ($req === false) {
	user_error("Arg req-invalid or missing.");
}
$path = ROOT . sprintf("cmp/%s/index.php", $req);
if (! file_exists($path)) {
	user_error("Arg req has non-existing cmp=$req");	
}

require $path;
