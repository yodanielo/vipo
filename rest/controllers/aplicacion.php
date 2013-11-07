<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';

class aplicacion extends REST_Controller {
    public function registrarAplicacion_post(){
        
    }
    
    public function getApplication_post(){
        $mivar=$this->post();
        $db=$this->db;
        $res=$db->select(array(
            "aplicacion.nombre",
            "aplicacionregistrada.titulo",
            "aplicacionregistrada.url",
            "aplicacionregistrada.idaplicacionregistrada",
            "aplicacionregistrada.token"
        ))
        ->from("aplicacion")
        ->join("aplicacionregistrada","aplicacion.idaplicacion=aplicacionregistrada.aplicacion_idaplicacion")
        ->where("aplicacionregistrada.url",$mivar["url"])
        ->get()->result();
        if(count($res)>0){//se encontró la aplicacion, retorno
            $this->response(respuesta($res[0], RPT_SATISFACTORIO, ""), 200);
        }
        else{
            $this->response(respuesta(NULL, RPT_ERROR, "Aplicacion no encontrada"), 200);
        }
    }

}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */