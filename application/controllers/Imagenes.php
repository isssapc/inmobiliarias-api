<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Imagenes extends MY_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model("imagen");
    }

    /*
      public function get_imagen_get($id) {
      $datos = $this->imagen->get_one($id);
      $this->response($datos);
      }
     * 
     */

    public function rotate_left_get($id) {
        $datos = $this->imagen->rotate($id, 90);
        $this->response($datos);
    }

    public function rotate_right_get($id) {
        $datos = $this->imagen->rotate($id, 270);
        $this->response($datos);
    }

    public function del_imagen_get($id) {
        $count = $this->imagen->del_one($id);
        $this->response(array("count" => $count));
    }

    /*
      public function index_get() {
      $datos = $this->imagen->get_all();
      $this->response($datos);
      }





      public function del_imagen_post($id) {
      $count = $this->imagen->del_one($id);
      $this->response(array("count" => $count));
      }

      public function del_imagens_post() {
      $ids = $this->post("id_imagens");
      $datos = $this->imagen->del_many($ids);
      $this->response($datos);
      }

      public function create_imagen_post() {
      $imagen = $this->post("imagen");
      $datos = $this->imagen->create_one($imagen);
      $this->response($datos);
      }

      public function update_imagen_post($id) {
      $imagen = $this->post("imagen");
      $datos = $this->imagen->update_one($id, $imagen);
      $this->response($datos);
      }
     */
}
