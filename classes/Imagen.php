<?PHP

class Imagen
{
    private $error;


    /**
     * Método que sube una imagen al servidor
     * @param string $rutaGuardado ruta donde se guardará la imagen
     * @param array $fileData datos de la imagen
     * @return string nombre de la imagen subida
     */
    public function subirImagen($rutaGuardado, $fileData, $imagen_actual): string
    {


        if (!empty($fileData['tmp_name'])) {
            $imgNombreOriginal = explode(".", $fileData['name']); //separo el nombre de la imagen de su extensión
            $extension = end($imgNombreOriginal); //obtengo la extensión de la imagen

            //fecha para darle un nombre único a la imagen
            $imgNombreNuevo = time() . "." . $extension; //concateno la fecha con la extensión de la imagen

            $imagenSubida = move_uploaded_file($fileData['tmp_name'], "$rutaGuardado/$imgNombreNuevo"); //muevo la imagen a la carpeta de imagenes

            if (!$imagenSubida) {
                // throw new Exception("No se pudo subir la imagen");
                // (new Alerta())->add_alerta('danger', "No se pudo cargar la imagen");
                header('Location: ../index.php?sec=admin_disciplinas');
            } else {
                return $imgNombreNuevo;
            }
        }
        // Si no hay archivo para subir, también puedes devolver un valor por defecto o lanzar una excepción según tus necesidades
        return $imagen_actual;
    }

    /**
     * Get the value of error
     */
    public function getError()
    {
        return $this->error;
    }
}