<?PHP
require_once "../../functions/autoload.php";

$id = $_GET['id'] ?? FALSE;

if($id){
    (new Carrito())->quitar_prod($id);
    header('location: ../../index.php?sec=carrito');
}