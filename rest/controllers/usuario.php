<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';

class usuario extends REST_Controller {

	public function index()
	{
            //$this->loadHTML("booking");
            //$this->load->view('booking');
	}
	public function login_post()
	{
		$mivar=$this->post();		
		
		$this->db->select('aplicacionregistrada.*');
		$this->db->from('aplicacionregistrada');
		$this->db->join('usuario','usuario.IdPersona = aplicacionregistrada.Usuario_IdPersona');
		$this->db->join('aplicacion','aplicacion.IdAplicacion = aplicacionregistrada.Aplicacion_IdAplicacion');
		$this->db->where('usuario.NombreUsuario',$mivar[0]["username"]);
		$this->db->where('usuario.Contrasena',$mivar[0]["password"]);
		$this->db->where('aplicacion.IdAplicacion',$mivar[0]["idapp"]);
		$query=$this->db->get()->result();
		//print_r($query);

		if (count($query) == 0) {
			//print_r('No se encontraron resultados.');
			$this->response(null,200);
		}
		else
		{
			$this->response($query,200);
		}
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */