<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class hola extends padre {

	public function index()
	{

            //$this->loadHTML("booking");
            //$this->load->view('booking');
	}
	public function mundo($nombre,$apellido)
	{
		$this->loadHTML('holamundo',array(
		"nombre"=> $nombre, "apellido"=> $apellido),"shared/header","shared/footer");

        //$this->loadHTML("booking");
        //$this->load->view('booking');
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */