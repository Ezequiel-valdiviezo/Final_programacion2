<?PHP 
require_once "../../functions/autoload.php";

$postData = $_POST;
$id = $_GET['id'] ?? FALSE;
$fileData = $_FILES['imagen'] ?? FALSE;
$imagen_actual = $_POST['imagen_actual'];
try {

    $imagen = (new Imagen())->subirImagen(__DIR__ . "/../../img/webp_productos", $fileData, $imagen_actual);

    $producto = (new Producto())->producto_x_id($id);

    $producto->edit(
        $postData['nombre'],
        $postData['descripcion'],
        $postData['categoria_id'],
        $postData['genero_id'],
        $postData['disciplinas_id'],
        $postData['talles'],
        $postData['fecha_lanzamiento'],
        $postData['color'],
        $imagen,
        $postData['envio'],
        $postData['precio'],
    );
    (new Alerta())->add_alerta('primary', "Se edito exitosamente el producto");
    header('Location: ../index.php?sec=admin_producto');
    
} catch (Exception $e) {
    echo "Error: " . $e->getMessage() . " Data: " . print_r($postData, true);
    (new Alerta())->add_alerta('danger', "No se pudo editar el producto");
    //header('Location: ../index.php?sec=admin_producto');
}