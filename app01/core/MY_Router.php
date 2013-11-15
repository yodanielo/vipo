<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class MY_Router extends CI_Router {

    var $error_controller = 'error';
    var $error_method_404 = 'error_404';
    public $appname = "";

    function My_Router() {
        parent::__construct();
    }

    // this is just the same method as in Router.php, with show_404() replaced by $this->error_404();
    function _validate_request($segments) {
        $exonerados = array("less");
        if (array_search($segments[0], $exonerados) === FALSE) {
            if (count($segments) > 0) {
                //validando nombre de aplicacion
                $this->MyRest->
                //setando appname
                $this->config->set_item("appname", $segments[0]);
                $segments = array_slice($segments, 1);
                if (count($segments) == 0) {
                    $segments[0] = $this->routes["default_controller"];
                }
                return parent::_validate_request($segments);
            } else {
                return $this->error_404();
            }
        }
        else
            return parent::_validate_request($segments);
    }

    function error_404() {
        if (!empty($this->routes['404_override'])) {
            $x = explode('/', $this->routes['404_override']);

            //$this->set_directory('');
            $segments[0] = $x[0];
            $segments[1] = (isset($x[1]) ? $x[1] : 'index');

            return $x;
        } else {
            show_404($this->fetch_directory() . $segments[0]);
            return array();
        }
    }

}
