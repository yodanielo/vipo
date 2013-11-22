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
            print_r($_SESSION);
            if ($res[0]->respuesta == RPT_ERROR) {
                $this->error_404();
            } else {
                $_SESSION[$appurl]["appData"] = $res[0]->resultado;
            }
        }
        $this->loadHTML("login", null, "shared/EmptyHeader", "shared/EmptyFooter");
    }

}
