<?PHP
$id = $_GET['id'] ?? FALSE;
$genero = (new Generos())->get_x_id($id);
?>


<div class="row p-5 d-flex align-items-center">
<h2 class="text-center mb-5 fw-bold">¿Está seguro que desea eliminar este genero?</h2>
	<div class="col-6 m-auto text-center">
		

			<h3 class="fs-6">Categoria</h3>
			<p><?= $genero->getGeneros() ?></p>

			<a href="actions/delete_generos_acc.php?id=<?= $genero->getId() ?>" role="button" class="d-block btn btn-sm btn-dark mt-4">Eliminar</a>
	</div>

	

</div>