<?php
/**
 * Action-handler.
 */

$pass = getenv("MYSQL_PASS");
$host = getenv("MYSQL_HOST");
$host = "db";

require_once __DIR__ . "/../vendor/mpdroog/core/init-browser.php";

$req = core\Taint::getField("req", ["slug"]);
if ($req === false) {
	echo "Arg req-invalid or missing.";
	exit;
}
$path = ROOT . sprintf("cmp/%s/index.php", $req);
if (! file_exists($path)) {
	echo "Arg req has non-existing cmp=$req";
	exit;
}

require $path;
