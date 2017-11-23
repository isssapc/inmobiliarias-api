<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Mensajes extends MY_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model("mensaje");
    }

    public function usuario_get($id_usuario) {
        $datos = $this->mensaje->get_mensajes_usuario($id_usuario);
        $this->response($datos);
    }

    public function del_mensajes_usuario_post($id_usuario) {
        $count = $this->mensaje->del_mensajes_usuario($id_usuario);
        $this->response(array('count' => $datos));
    }

    public function get_mensaje_get($id) {
        $datos = $this->mensaje->get_one($id);
        $this->response($datos);
    }
//    
//    
//    public function search_mensaje_get($nombre) {
//        $datos = $this->mensaje->search_by_nombre($nombre);
//        $this->response($datos);
//    }

    public function del_mensaje_post($id) {
        $count = $this->mensaje->del_one($id);
        $this->response(array("count" => $count));
    }

    public function create_mensaje_post() {
        $mensaje = $this->post("mensaje");
        $datos = $this->mensaje->create_one($mensaje);
        $this->response($datos);
    }

    public function update_mensaje_post($id) {
        $mensaje = $this->post("mensaje");
        $datos = $this->mensaje->update_one($id, $mensaje);
        $this->response($datos);
    }

}
