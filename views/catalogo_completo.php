<?php
$catalogoProductos = new Producto();
$productosCompleto = $catalogoProductos->catalogo_completo();
$productosPrecioAsc = $catalogoProductos->catalogo_completoPrecioAsc();
$productosPrecioDesc = $catalogoProductos->catalogo_completoPrecioDesc();
// $productosGeneros = $catalogoProductos->catalogo_x_genero($id);

// Verificar si se envió un formulario
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['mostrarCatalogoCompleto'])) {
        $productos = $productosCompleto;
    } elseif (isset($_POST['mostrarCatalogoPrecioAsc'])) {
        $productos = $productosPrecioAsc;
    } elseif (isset($_POST['catalogoCompletoPrecioDesc'])) {
        $productos = $productosPrecioDesc;
    } elseif (isset($_POST['catalogoCompletoMasc'])) {
        $productos = $catalogoProductos->catalogo_x_genero(2);
    } elseif (isset($_POST['catalogoCompletoFem'])) {
        $productos = $catalogoProductos->catalogo_x_genero(1);
    }
} else {
    // Establecer el catálogo predeterminado
    $productos = $productosCompleto;
}
?>

<div>
    <h2 class="m-5">Nuestros productos de Nike</h2>

    <form class="text-center mb-5" method="post">
        <button class="btn btn-sm btn-dark mt-4" type="submit" name="mostrarCatalogoCompleto">Todos</button>
        <button class="btn btn-sm btn-dark mt-4" type="submit" name="mostrarCatalogoPrecioAsc">Más baratos</button>
        <button class="btn btn-sm btn-dark mt-4" type="submit" name="catalogoCompletoPrecioDesc">Más caros</button>
        <button class="btn btn-sm btn-dark mt-4" type="submit" name="catalogoCompletoMasc">Hombres</button>
        <button class="btn btn-sm btn-dark mt-4" type="submit" name="catalogoCompletoFem">Mujeres</button>
    </form>

    <div class="container d-flex">
        <div class="row justify-content-around">
            <?php foreach ($productos as $producto) { ?>
                <div class="card col-12 col-sm-4  col-md-3 col-lg-3 mt-2 me-2">
                                <img src="img/webp_productos/<?= $producto->getImagen() ?>" class="card-img-top" alt="<?= $producto->getNombre() ?>">
                                <div class="card-body">
                                    <h3 class="card-title"><?= $producto->getNombre() ?></h3>
                                    <p class="card-text"><?= $producto->descripcion_reducida(20) ?></p>
                                </div>
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item">Lanzamiento: <?= $producto->getLanzamiento() ?></li>
                                    <li class="list-group-item">Precio: $<?=$producto->getPrecio() ?> </li>
                                    <li class="list-group-item">Envio: <?= $producto->getEnvio() ?></li>
                                </ul>
                                <div class="card-body m-auto">
                                <a href="index.php?sec=producto&id=<?= $producto->getId() ?>" type="button" class="btn btn-outline-danger anularE">Ver más</a>
                                </div>
                            </div> 
            <?php } ?>
        </div>
    </div>
</div>
