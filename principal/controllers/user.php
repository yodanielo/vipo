<?php
/**
 * Description of login
 *
 * @author daniel
 */
class user extends Padre {
    function login(){
        $this->loadHTML("login", $params, "shared/EmptyHeader", "shared/EmptyFooter");
    }
}
