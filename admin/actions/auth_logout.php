<?PHP
require_once "../../functions/autoload.php";
$ref = $_GET['ref'] ?? FALSE;

(new Autenticacion())->log_out();
if($ref){
    header('location: ../../index.php?sec=login');
} else{
    header('location: ../index.php?sec=login');
}
