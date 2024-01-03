<?PHP
require_once "../../functions/autoload.php";

$id = $_GET['id'] ?? FALSE;
$q = $_GET['q'] ?? 1;

if($id){
    (new Carrito())->agregar_prod($id, $q);
    header('location: ../../index.php?sec=carrito');
}