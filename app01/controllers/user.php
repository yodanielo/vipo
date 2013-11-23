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
        unset($_SESSION[$appurl]["appData"]);
        if (!isset($_SESSION[$appurl]["appData"])) {
            $res = $this->modAplicacion->getApplication($appurl);
            if ($res[0]->respuesta == RPT_ERROR) {
                $this->error_404();
            } else {
                $_SESSION[$appurl]["appData"] = $res[0]->resultado;
            }
        }
        $this->params["css_after"][]=site_url('less/index/login.less');
        $this->params["appname"]=$appurl;
        $this->load->library("Token");
        $this->loadHTML("login", "shared/EmptyHeader", "shared/EmptyFooter");
    }
    function enter(){
        if($this->token->Check()){
            
        }
        else{
            
        }
    }
}
