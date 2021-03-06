<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Mensajes extends MY_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model("mensaje");
    }

    public function usuario_get($id_usuario) {
        $recibidos = $this->mensaje->get_mensajes_recibidos_usuario($id_usuario);
        $enviados = $this->mensaje->get_mensajes_enviados_usuario($id_usuario);
        $this->response(array('recibidos' => $recibidos, 'enviados' => $enviados));
    }

    public function count_no_leidos_usuario_get($id_usuario) {
        $count = $this->mensaje->count_no_leidos_usuario($id_usuario);
        $this->response(array('count' => $count));
    }

    public function del_mensajes_usuario_post($id_usuario) {
        $count = $this->mensaje->del_mensajes_usuario($id_usuario);
        $this->response(array('count' => $count));
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

    public function del_mensajes_post() {
        $ids = $this->post("ids");
        $count = $this->mensaje->del_many($ids);
        $this->response(array("count" => $count));
    }

    public function create_mensaje_post() {
        $mensaje = $this->post("mensaje");
        $datos = $this->mensaje->create_one($mensaje);
        $bandeja_origen=$this->mensaje->create_mensaje_bandeja($datos['id_usuario_origen'],$datos['id_mensaje']);
        $bandeja_destino=$this->mensaje->create_mensaje_bandeja($datos['id_usuario_destino'],$datos['id_mensaje']);
        $this->response($datos);
    }

    public function update_mensaje_post($id) {
        $mensaje = $this->post("mensaje");
        $datos = $this->mensaje->update_one($id, $mensaje);
        $this->response($datos);
    }
    

}
