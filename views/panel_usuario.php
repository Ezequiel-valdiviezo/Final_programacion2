<?php
// Inicializa variables con valores predeterminados
$nombre_completo = 'No disponible';
$username = 'No disponible';

// Verifica si la sesión está iniciada y si existen los datos del usuario
if (isset($_SESSION['loggedIn']) && is_array($_SESSION['loggedIn'])) {
    // Accede a los datos del usuario
    $nombre_completo = $_SESSION['loggedIn']['nombre_completo'];
    $id = $_SESSION['loggedIn']['id'];
    $username = $_SESSION['loggedIn']['username'];
}

// echo "<pre>";
// print_r($_SESSION['loggedIn']);
// echo "</pre>";

$datos = (new Carrito())->compras_x_usuario($id);
?>

<div class="d-flex justify-content-center p-5">

        <div class="container">

        <div>
			<?= (new Alerta())->get_alertas(); ?>
		</div> 
            <h2 class="text-center mb-5">Panel de usuario</h2>

            <div class="border rounded p-3">

                <div class="d-flex row flex-wrap">

                    <div class="col-md-6 col-12 text-center">
                        <h3>Bienvenido a su panel usuario</h3>

                        <p>Desde este panel usted va a poder ver su username, y nombre completo de usuario. Además que va poder utilizar el carrito y hacer compras ilimitadas de lo que desee.</p>
                        <p>En este panel en un apartado va a poder visualizar las compras realizadas.</p>

                        <a href="index.php?sec=carrito" class="btn btn-primary mt-2 w-50 fw-bold">Ir al carrito</a>
                        <a href="index.php?sec=catalogo_completo" class="btn btn-primary mt-2 w-50 fw-bold">Ir a la tienda</a>

                        <h4 class="mt-3">Información personal:</h4>
                        <p>Nombre: <?php echo $nombre_completo; ?></p>
                        <p>Username: <?php echo $username; ?></p>


                    </div>
                    <div class="col-md-6 col-12">
                        <h3>Compras realizadas</h3>
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th class="p-1">Usuario</th>
                                    <th class="p-1">Fecha</th>
                                    <th class="p-1">Producto</th>
                                    <th class="p-1">Precio</th>
                                    <th class="p-1">Envio</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($datos as $resultado) { ?>
                                    <tr>
                                        <td class="p-1"><?= $resultado['nombre_usuario'] ?></td>
                                        <td class="p-1"><?= $resultado['fecha'] ?></td>
                                        <td class="p-1"><?= $resultado['nombre_producto'] ?></td>
                                        <td class="p-1">$<?= $resultado['precio'] ?></td>
                                        <td class="p-1"><?= $resultado['envio'] ?></td>
                                    </tr>
                                <?php } ?>
                            </tbody>
                        </table>

                    </div>

                </div>

            </div>
        </div>
</div>