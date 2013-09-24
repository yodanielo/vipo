<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Booking extends padre {

	public function index()
	{
            $this->loadHTML("booking");
            //prueba de que funciona
            //$this->load->view('booking');
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */