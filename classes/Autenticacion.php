<?PHP

class Autenticacion
{

    /**
     * Verifica las credenciales del usuario, y si es correcta, guarda los datos en la sesión
     * @param string $username El nombre de usuario provisto
     * @param string $password El password provisto
     * @return bool Devuelve TRUE en caso que las credenciales sean correctas, FALSE en caso de que no lo sean
     */
    public function log_in(string $usuario, string $password): mixed
    {
        
        // echo "<p>VAMOS A INTENTAR AUTENTICAR UN USUARIO</p>";
        // echo "<p>El nombre de usuario provisto es: $usuario</p>";
        // echo "<p>El password provisto es: $password</p>";
        
        $datosUsuario = (new Usuario())->usuario_x_username($usuario);

        if ($datosUsuario) {

            if (password_verify($password, $datosUsuario->getPassword())) {
                //echo "<p>EL PASSWORD ES CORRECTO! LOGUEAR!</p>";
                $datosLogin['username'] = $datosUsuario->getNombre_usuario();
                $datosLogin['nombre_completo'] = $datosUsuario->getNombre_completo();
                $datosLogin['id'] = $datosUsuario->getId();
                $datosLogin['rol'] = $datosUsuario->getRol();
                $_SESSION['loggedIn'] = $datosLogin;            
                return  $datosLogin['rol'];
            } else {
                //echo "<p>EL PASSWORD NO ES CORRECTO! INTRUSO! >=0 </p>";
                (new Alerta())->add_alerta('danger', "El password ingresado no es correcto.");
                return FALSE;
            }

        }else{
            (new Alerta())->add_alerta('warning', "El usuario ingresado no se encontró en nuestra base de datos.");
            return NULL;
        }
        
        /**/
    }


    public function log_out()
    {
        
        if (isset($_SESSION['loggedIn'])) {
            unset($_SESSION['loggedIn']);
        };
    }

    /**
     * Verifica el rol del usuario, si es admin o usuario.
     */
    public function verify($admin = TRUE): bool
    {
        
        if (isset($_SESSION['loggedIn'])) {
            if($admin){
                if($_SESSION['loggedIn']['rol'] != "usuario" ){
                    return TRUE;
                } else {
                    (new Alerta())->add_alerta('warning', "El usuario ingresado no tiene permisos para ingresar a esta área.");
                    header('location: index.php?sec=login');
                }
            } else {
                return TRUE;
            }

        } else {
            header('location: index.php?sec=login');
        }
    }
}
