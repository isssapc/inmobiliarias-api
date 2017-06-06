<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Propiedades extends MY_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model("propiedad");
    }

    public function index_get() {
        $datos = $this->propiedad->get_all();
        $this->response($datos);
    }

    public function get_propiedad_get($id) {
        $datos = $this->propiedad->get_one($id);
        $this->response($datos);
    }

    public function del_propiedad_post($id) {
        $datos = $this->propiedad->del_one($id);
        $this->response($datos);
    }

    public function del_propiedades_post() {
        $ids = $this->post("id_propiedades");
        $datos = $this->propiedad->del_many($ids);
        $this->response($datos);
    }

    public function create_propiedad_post() {
        $propiedad = $this->post("propiedad");
        $datos = $this->propiedad->create_one($propiedad);
        $this->response($datos);
    }

    public function update_propiedad_post() {
        $propiedad = $this->post("propiedad");
        $datos = $this->propiedad->update_one($propiedad);
        $this->response($datos);
    }

}
