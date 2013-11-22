<?php
class modAplicacion extends CI_Model{
    private $URL_APLICACION;
    function __construct(){
        parent::__construct();
    }
    function getApplication($url){
        $this->load->library("RestClient");
        
        $resp=RestClient::post(REST_URL."aplicacion/getApplication/format/json", array(
            "url"=>$url
        ));
        return json_decode($resp->getResponse());
    }
}