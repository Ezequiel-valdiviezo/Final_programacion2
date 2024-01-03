<div class="container mt-5">
    <div class="row justify-content-center">
        <h2>Finalize su compra de productos en nike</h2>
        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <h3 class="card-title text-center mb-4">Datos de la Tarjeta</h3>
                    
                    <!-- Formulario -->
                    <form class="needs-validation" novalidate action="procesar_compra.php" method="post">

                        <!-- Nombre del Titular -->
                        <div class="m-4 form-group">
                            <label for="titular">Nombre del Titular</label>
                            <input type="text" class="form-control" id="titular" name="titular" required>
                        </div>

                        <!-- Número de Tarjeta -->
                        <div class="m-4 form-group">
                            <label for="numero">Número de Tarjeta</label>
                            <input type="text" class="form-control" id="numero" name="numero" required>
                        </div>

                        <!-- Fecha de Vencimiento -->
                        <div class="d-flex form-row m-4">
                            <div class="form-group col-md-6 mb-2 pa-2">
                                <label for="mes">Mes de Vencimiento</label>
                                <select class="form-control" id="mes" name="mes" required>
                                    <option value="">Selecciona el Mes</option>
                                    <option value="Enero">Enero</option>
                                    <option value="Febrero">Febrero</option>
                                    <option value="Marzo">Marzo</option>
                                    <option value="Abril">Abril</option>
                                    <option value="Mayo">Mayo</option>
                                    <option value="Junio">Junio</option>
                                    <option value="Julio">Julio</option>
                                    <option value="Agosto">Agosto</option>
                                    <option value="Septiembre">Septiembre</option>
                                    <option value="Octubre">Octubre</option>
                                    <option value="Noviembre">Noviembre</option>
                                    <option value="Diciembre">Diciembre</option>
                                </select>
                            </div>
                            <div class="form-group col-md-6 mb-2 pa-2">
                                <label for="anio">Año de Vencimiento</label>
                                <select class="form-control" id="anio" name="anio" required>
                                    <option value="">Selecciona el Año</option>
                                    <option value="2024">2024</option>
                                    <option value="2025">2025</option>
                                    <option value="2026">2026</option>
                                    <option value="2027">2027</option>
                                    <option value="2028">2028</option>
                                    <option value="2029">2029</option>
                                    <option value="2030">2030</option>
                                </select>
                            </div>
                        </div>

                        <!-- Código de Seguridad (CVV) -->
                        <div class="m-4 form-group">
                            <label for="cvv">Código de Seguridad (CVV)</label>
                            <input type="text" class="form-control" id="cvv" name="cvv" required>
                        </div>

                        <!-- Botón de Pago -->
                        <a href="admin/actions/checkout_acc.php" role="button" class="btn btn-primary w-100">Pagar</a>
                        
                        
                        <!-- <?PHP
                        echo "<pre>";
                        print_r($_SESSION['loggedIn']);
                        echo "</pre>";
                        ?> -->


                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

