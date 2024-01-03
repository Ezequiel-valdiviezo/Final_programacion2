<?PHP
$id = $_GET['id'] ?? FALSE;
$producto = (new Producto())->producto_x_id($id);
?>


<div class="row p-5 d-flex align-items-center">
<h2 class="text-center mb-5 fw-bold">¿Está seguro que desea eliminar este producto?</h2>
	<div class="col-6 m-auto text-center">
		
        
            <h3 class="fs-6">Producto:</h3>
			<p><?= $producto->getNombre() ?></p>
        

			<a href="actions/delete_producto_acc.php?id=<?= $producto->getId() ?>" role="button" class="d-block btn btn-sm btn-dark mt-4 mb-3">Eliminar</a>
	</div>

	

</div>