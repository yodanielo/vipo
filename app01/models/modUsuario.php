<?php
/**
 * Proxy de usuario
 *
 * @author Daniel Pomalaza
 */
class modUsuario extends CI_Model{
    function __construct(){
        parent::__construct();
    }
    /**
     * registra el login de un usuario en una aplicacion 
     * @param type $request
     */
    function login($request){
        $this->load->library("RestClient");
        
        $resp=RestClient::post(REST_URL."usuario/login/format/json", $request);
        return json_decode($resp->getResponse());
    }
}
