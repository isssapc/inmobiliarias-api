<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Documentos extends MY_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model("documento");
    }

    public function index_get() {
        $datos = $this->documento->get_all();
        $this->response($datos);
    }

    public function get_documento_get($id) {
        $datos = $this->documento->get_one($id);
        $this->response($datos);
    }

    public function del_documento_post($id) {
        $datos = $this->documento->del_one($id);
        $this->response($datos);
    }

    public function del_documentos_post() {
        $ids = $this->post("id_documentos");
        $datos = $this->documento->del_many($ids);
        $this->response($datos);
    }

    public function create_documento_post() {
        $documento = $this->post("documento");
        $datos = $this->documento->create_one($documento);
        $this->response($datos);
    }

    public function update_documento_post() {
        $documento = $this->post("documento");
        $datos = $this->documento->update_one($documento);
        $this->response($datos);
    }

}
