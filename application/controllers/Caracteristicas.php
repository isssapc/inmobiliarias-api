<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Caracteristicas extends MY_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model("caracteristica");
    }

    public function index_get() {
        $datos = $this->caracteristica->get_all();
        $this->response($datos);
    }

    public function get_caracteristica_get($id) {
        $datos = $this->caracteristica->get_one($id);
        $this->response($datos);
    }

    public function del_caracteristica_post($id) {
        $datos = $this->caracteristica->del_one($id);
        $this->response($datos);
    }

    public function del_caracteristicas_post() {
        $ids = $this->post("id_caracteristicas");
        $datos = $this->caracteristica->del_many($ids);
        $this->response($datos);
    }

    public function create_caracteristica_post() {
        $caracteristica = $this->post("caracteristica");
        $datos = $this->caracteristica->create_one($caracteristica);
        $this->response($datos);
    }

    public function update_caracteristica_post() {
        $caracteristica = $this->post("caracteristica");
        $datos = $this->caracteristica->update_one($caracteristica);
        $this->response($datos);
    }

}
