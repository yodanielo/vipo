<?php

/**
 * Description of login
 *
 * @author daniel
 */
class user extends Padre {

    function login() {
        $this->load->model("modAplicacion");
        $appurl = $this->uri->segment(1);
        if (!isset($_SESSION[$appurl]["appData"])) {
            $res = $this->modAplicacion->getApplication($appurl);
            if ($res[0]->respuesta == RPT_ERROR) {
                $this->error_404();
            } else {
                $_SESSION[$appurl]["appData"] = $res[0]->resultado;
            }
        }
        $this->params["css_after"][] = site_url('less/index/login.less');
        $this->params["appname"] = $appurl;
        $this->load->library("Token");
        $this->loadHTML("user/login", "shared/EmptyHeader", "shared/EmptyFooter");
    }

    function enter() {
        $params = $this->input->post();
        $this->load->model("modUsuario");
        $request = array(
            "username" => $params["usuario"],
            "password" => $params["password"],
            "idapp" => $_SESSION[$this->appname]["appData"]->idduenio
        );
        $response = $this->modUsuario->login($request);
        if ($response[0]->respuesta == RPT_SATISFACTORIO) {
            $_SESSION[$this->appname]["usuario"] = $response[0]->resultado;
            echo json_encode(array(
                "mensaje" => $response[0]->mensaje,
                "exito"=>RPT_SATISFACTORIO
            ));
        } else {
            echo json_encode(array(
                "mensaje" => $response[0]->mensaje,
                "exito"=>RPT_ERROR
            ));
        }
    }
    
    function recuperar_contrasena(){
        $this->loadHTML("user/recuperar_contrasena", "shared/EmptyHeader", "shared/EmptyFooter");
    }
}
