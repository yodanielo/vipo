<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';

class usuario extends REST_Controller {

    public function index() {
        //$this->loadHTML("booking");
        //$this->load->view('booking');
    }

    /**
     * registra el login de un usuario en una aplicacion 
     * url: /vipo/vipo/rest/usuario/login/format/json
     */
    public function login_post() {
        $mivar = $this->post();
        $this->load->library("terminal");
        $db=$this->db;
        

        $db->select(array(
             'persona.IdPersona'
            ,'persona.Nombres'
            ,'persona.Apellidos'
            ,'persona.Correo'
            ,'persona.Direccion'
            ,'persona.Telefono1'
            ,'persona.Telefono2'
            ,'persona.idAplicacionregistrada'
            ,'cuenta.usuario'
        ));
        $db->from('cuenta');
        $db->join('persona', 'cuenta.Idcuenta = persona.IdPersona');
        $db->join('aplicacionregistrada', 'persona.IdPersona = aplicacionregistrada.Idduenio');
        $db->join('trabajador', 'persona.IdPersona = trabajador.Idtrabajador');
        $db->where('cuenta.usuario', $mivar["username"]);
        $db->where('cuenta.clave', $mivar["password"]);
        $db->where('aplicacionregistrada.aplicacion_IdAplicacion', $mivar["idapp"]);
        $query = $this->db->get()->result();

        if (count($query) == 0) 
        {
            //el usuario no se encuentra
            $this->response(respuesta(NULL, RPT_ERROR, "Error: Usuario o contraseña equivocados."), 200);
        }
        else 
        {
            //usuario encontrado, ahora registro su acceso
            $db->set("Fecha","CURDATE()",FALSE);
            $db->set("Ip",$this->terminal->ipreal());
            $db->set("usaproxy",$this->terminal->usaProxy());
            $db->set("usuario_Idusuario",$query[0]->IdPersona);
            $db->set("user_inserted",$query[0]->IdPersona);
            $db->set("date_inserted","CURDATE()",FALSE);
            $db->set("estadoregistro",1);
            $db->insert("acceso");

            //Obtengo el/los rol(es) del usuario.
            $db->select(array(
                'rol.idRol'
                ,'rol.Nombre'
            ));
            $db->from('rolasignado');
            $db->join('rol', 'rolasignado.Rol_idRol = rol.idRol');
            $db->where('rolasignado.usuario_Idusuario', $query[0]->IdPersona);
            $query2 = $this->db->get()->result();
            
            $this->response(respuesta(array(
                "exito"=>true
                ,"IdPersona"=>$query[0]->IdPersona
                ,"Nombres"=>$query[0]->Nombres
                ,"Apellidos"=>$query[0]->Apellidos
                ,"Correo"=>$query[0]->Correo
                ,"Direccion"=>$query[0]->Direccion
                ,"Telefono1"=>$query[0]->Telefono1
                ,"Telefono2"=>$query[0]->Telefono2
                ,"Username"=>$query[0]->usuario
                ,"idAplicacionregistrada"=>$query[0]->idAplicacionregistrada
                ,"rol"=>$query2
            ), RPT_SATISFACTORIO, "Bienvenid@ ".$query[0]->usuario), 200);
        }
    }
    
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */