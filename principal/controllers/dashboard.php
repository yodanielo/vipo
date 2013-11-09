<?php

/**
 * Description of dashboard
 *
 * @author Daniel Pomalaza
 * creacion: 20131107
 * controlador para la pantalla del dashboard del sistema
 */
class dashboard extends Padre{
    function index(){
        $params=array("username"=>"Yodanielo");
        $this->loadHTML("dashboard", $params);
    }
}
