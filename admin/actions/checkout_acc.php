<?PHP 
require_once "../../functions/autoload.php";

$items = (new Carrito())->get_carrito();
$userId = $_SESSION['loggedIn']['id'] ?? FALSE;
// echo "<pre>";
// print_r($items);
// echo "</pre>";

try {

    if($userId){

        $datosCompra = [
            "id_usuario" => $userId,
            "fecha" => date("Y-m-d",time()),
            "importe" => (new Carrito())->precio_total(),

        ];

        $detalleCompra = [];

        foreach ($items as $key => $value) {
            $detalleCompra[$key] = $value['cantidad'];
        }

        (new Carrito())->insert_checkout_data($datosCompra, $detalleCompra);

        (new Alerta())->add_alerta('primary', "Compra realizada con exito"); 
        header('location: ../../index.php?sec=panel_usuario'); //redirect panel de usuario
    }


} catch (Exception $e) {
    echo "<pre>";
    print_r($items);
    echo "</pre>";
    (new Alerta())->add_alerta('warning', "No se pudo finalizar la compra");
}