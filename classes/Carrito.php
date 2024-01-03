<?PHP

class Carrito
{

    /**
     * Agrega un item al carrito de compras
     * @param int $productoID El ID del producto que se va a agregar.
     * @param int $cantidad La cantidad de unidades del producto que se van a agregar
     */
    public function agregar_prod(int $productoID, int $cantidad)
    {
        $itemData = (new Producto)->producto_x_id($productoID);
        if ($itemData) {
            $_SESSION['carrito'][$productoID] = [
                'producto' => $itemData->getNombre(),
                'categoria' => $itemData->getCategoria(),
                'portada' => $itemData->getImagen(),
                'precio' => $itemData->getPrecio(),
                'cantidad' => $cantidad
            ];
        }
    }

    /**
     * Elimina un item del carrito de compras
     * @param int $productoID El id del producto a elminar
     */
    public function quitar_prod(int $productoID)
    {
        if (isset($_SESSION['carrito'][$productoID])) {
            unset($_SESSION['carrito'][$productoID]);
        }
    }

    /**
     * Vacia el carrito de compras
     */
    public function clear_items()
    {
        $_SESSION['carrito'] = [];
    }


    /**
     * devuelve el contenido del carrito de compras actual
     */
    public function get_carrito(): array
    {
        if (!empty($_SESSION['carrito'])) {
            return $_SESSION['carrito'];
        } else {
            return [];
        }
    }


    /**
     * Actualiza las cantidades de los ids provistos
     * @param array $cantidades Array asociativo con las cantidades de cada ID
     */
    public function actualizar_cantidades(array $cantidades)
    {
        foreach ($cantidades as $key => $value) {
            if (isset($_SESSION['carrito'][$key])) {
                $_SESSION['carrito'][$key]['cantidad'] = $value;
            }
        }
    }

    /**
     * Devuelve el precio total actual del carrito de compras
     */
    public function precio_total()
    {
        $total = 0;
        if (!empty($_SESSION['carrito'])) {
            foreach ($_SESSION['carrito'] as $item) {
                $total += $item['precio'] * $item['cantidad'];
            }
        }
        return $total;
    }

    /**
     * Inserta los datos de una compra en la base de datos
     */
    public function insert_checkout_data(array $checkoutData, array $detallesData)
    {
        $conexion = Conexion::getConexion();
        $query = "INSERT INTO compras VALUES (NULL, :id_usuario, :fecha, :importe)";

        $PDOStatement = $conexion->prepare($query);
        $PDOStatement->execute(
            [
                'id_usuario' => $checkoutData['id_usuario'],
                'fecha' => $checkoutData['fecha'],
                'importe' => $checkoutData['importe'],
            ]
        );

        // Tengo el ultimo id que se inserto
        $insertId = $conexion->lastInsertId();

        foreach ($detallesData as $key => $value){
            $query = "INSERT INTO item_x_compra VALUES (NULL, :compra_id, :item_id, :cantidad)";

            $PDOStatement = $conexion->prepare($query);
            $PDOStatement->execute(
            [
                'compra_id' => $insertId,
                'item_id' => $key,
                'cantidad' => $value,
            ]
        );
        }
    }    

    public function compras_x_usuario(int $id_usuario): array 
    {
        $comprasRealizadas = [];

        $conexion = Conexion::getConexion();
        $query = "SELECT
        compras.id AS compra_id,
        compras.fecha,
        usuarios.id AS usuario_id,
        usuarios.nombre_usuario,
        usuarios.nombre_completo,
        productos.nombre AS nombre_producto,
        productos.precio,
        productos.envio,
        productos.descripcion,
        item_x_compra.cantidad
        FROM compras
        JOIN usuarios ON compras.id_usuario = usuarios.id
        JOIN item_x_compra ON compras.id = item_x_compra.compra_id
        JOIN productos ON item_x_compra.item_id = productos.id
        WHERE usuarios.id = :id_usuario;";

        $PDOStatement = $conexion->prepare($query);
        $PDOStatement->setFetchMode(PDO::FETCH_ASSOC);
        $PDOStatement->execute(
            [':id_usuario' => $id_usuario,]
        );

        while ($result = $PDOStatement->fetch()) {
            $comprasRealizadas[] = $result;
        }

        return $comprasRealizadas;
    }


}

