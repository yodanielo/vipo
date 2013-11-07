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
            'usuarioaplicacion.aplicacionregistrada_idaplicacionregistrada',
            "usuarioaplicacion.idusuarioaplicacion"
        ));
        $db->from('usuario');
        $db->join('usuarioaplicacion', 'usuario.IdPersona = usuarioaplicacion.Usuario_IdPersona');
        $db->where('usuario.NombreUsuario', $mivar["username"]);
        $db->where('usuario.Contrasena', $mivar["password"]);
        $db->where('usuarioaplicacion.aplicacionregistrada_idaplicacionregistrada', $mivar["idapp"]);
        $query = $this->db->get()->result();
        if (count($query) == 0) {//el usuario no se encuentra
            $this->response(respuesta(NULL, RPT_ERROR, "El usuario no está registrado para ésta aplicación"), 200);
        } else {
            //usuario encontrado, ahora registro su acceso y retorno le idusuarioaplicacion
            $db->set("fecha","CURDATE()",FALSE);
            $db->set("ip",$this->terminal->ipreal());
            $db->set("usaproxy",$this->terminal->usaProxy());
            $db->set("user_inserted",$query[0]->idusuarioaplicacion);
            $db->set("date_inserted","CURDATE()",FALSE);
            $db->set("estadoregistro",1);
            $db->set("UsuarioAplicacion_IdUsuarioAplicacion",$query[0]->aplicacionregistrada_idaplicacionregistrada);
            $db->insert("acceso");
            $this->response(respuesta(array(
                "idusuarioapp"=>$query[0]->idusuarioaplicacion
            ), RPT_SATISFACTORIO, ""), 200);
        }
    }
    
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */