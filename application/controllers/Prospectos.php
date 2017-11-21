<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Prospectos extends MY_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model("prospecto");
    }

    public function index_get() {
        $datos = $this->prospecto->get_all();
        $this->response($datos);
    }

    public function get_prospecto_get($id) {
        $datos = $this->prospecto->get_one($id);
        $this->response($datos);
    }

    public function search_prospecto_get($nombre) {
        $datos = $this->prospecto->search_by_nombre($nombre);
        $this->response($datos);
    }

    public function del_prospecto_post($id) {
        $count = $this->prospecto->del_one($id);
        $this->response(array("count" => $count));
    }

    public function del_prospectos_post() {
        $ids = $this->post("id_prospectos");
        $datos = $this->prospecto->del_many($ids);
        $this->response($datos);
    }

    public function create_prospecto_post() {
        $prospecto = $this->post("prospecto");
        $datos = $this->prospecto->create_one($prospecto);
        $this->response($datos);
    }

    public function add_mensaje_seguimiento_post() {
        $mensaje = $this->post("mensaje");
        $datos = $this->propiedad->add_mensaje_seguimiento($mensaje);
        $this->response($datos);
    }

    public function update_prospecto_post($id) {
        $prospecto = $this->post("prospecto");
        $datos = $this->prospecto->update_one($id, $prospecto);
        $this->response($datos);
    }

}
