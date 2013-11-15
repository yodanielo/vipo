<?php
class modAplicacion extends CI_Model{
    private $URL_APLICACION;
    function __construct(){
        parent::__construct();
        $this->URL_APLICACION="aplicacion/";
    }
    function getApplication(){
        
    }
}