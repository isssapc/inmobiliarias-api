<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Inmobiliarias extends MY_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model("inmobiliaria");
    }

    public function index_get() {
        $datos = $this->inmobiliaria->get_all();
        $this->response($datos);
    }

    public function get_inmobiliaria_get($id) {
        $datos = $this->inmobiliaria->get_one($id);
        $this->response($datos);
    }

    public function del_inmobiliaria_post($id) {
        $datos = $this->inmobiliaria->del_one($id);
        $this->response($datos);
    }

    public function del_inmobiliarias_post() {
        $ids = $this->post("id_inmobiliarias");
        $datos = $this->inmobiliaria->del_many($ids);
        $this->response($datos);
    }

    public function create_inmobiliaria_post() {
        $inmobiliaria = $this->post("inmobiliaria");
        $datos = $this->inmobiliaria->create_one($inmobiliaria);
        $this->response($datos);
    }

    public function update_inmobiliaria_post() {
        $inmobiliaria = $this->post("inmobiliaria");
        $datos = $this->inmobiliaria->update_one($inmobiliaria);
        $this->response($datos);
    }

}
