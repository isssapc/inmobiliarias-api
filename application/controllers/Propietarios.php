<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Propietarios extends MY_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model("propietario");
    }

    public function index_get() {
        $datos = $this->propietario->get_all();
        $this->response($datos);
    }

    public function get_propietario_get($id) {
        $datos = $this->propietario->get_one($id);
        $this->response($datos);
    }

    public function search_propietario_get($nombre) {
        $datos = $this->propietario->search_by_nombre($nombre);
        $this->response($datos);
    }

    public function del_propietario_post($id) {
        $count = $this->propietario->del_one($id);
        $this->response(array("count" => $count));
    }

    public function del_propietarios_post() {
        $ids = $this->post("id_propietarios");
        $datos = $this->propietario->del_many($ids);
        $this->response($datos);
    }

    public function create_propietario_post() {
        $propietario = $this->post("propietario");
        $datos = $this->propietario->create_one($propietario);
        $this->response($datos);
    }

    public function update_propietario_post($id) {
        $propietario = $this->post("propietario");
        $datos = $this->propietario->update_one($id, $propietario);
        $this->response($datos);
    }

}
