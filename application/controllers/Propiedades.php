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

    public function con_portada_get() {
        $datos = $this->propiedad->get_all_con_portada();
        $this->response($datos);
    }

    public function get_propiedad_get($id) {
        $propiedad = $this->propiedad->get_one($id);
        $imagenes = $this->propiedad->get_imagenes_propiedad($id);
        $this->response(["propiedad" => $propiedad, "imagenes" => $imagenes]);
    }

    public function get_tipos_get() {
        $datos = $this->propiedad->get_tipos();
        $this->response($datos);
    }

    public function get_imagenes_propiedad_get($id_propiedad) {
        $datos = $this->propiedad->get_imagenes_propiedad($id_propiedad);
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

    public function update_propiedad_post($id) {
        $propiedad = $this->post("propiedad");
        $datos = $this->propiedad->update_one($id, $propiedad);
        $this->response($datos);
    }

    public function set_imagen_portada_post($id_propiedad) {
        $id_propiedad_imagen = $this->post("id_propiedad_imagen");
        $datos = $this->propiedad->set_imagen_portada($id_propiedad, $id_propiedad_imagen);
        $this->response($datos);
    }

    public function upload_imagen_post() {

        $id_propiedad = $this->post('id_propiedad');
        $descripcion = $this->post('descripcion');
        $es_portada = $this->post('es_portada');



        $path = "./upload/propiedades/" . $id_propiedad . "/";
        //asi funciona en produccion y con inmobiliaria-api afuera de la carpeta de inmobiliaria
        //$webpath = "../inmobiliaria-api/upload/propiedades/" . $id_propiedad . "/";
        //asi funciona en pruebas
        $webpath = "http://localhost:8080/inmobiliaria-api/upload/propiedades/" . $id_propiedad . "/";

        if (!file_exists($path)) {
            mkdir($path, 0777, TRUE);
        }

        $config['upload_path'] = $path;
        $config['allowed_types'] = 'png|jpg|jpeg';
        $config['max_size'] = 4096; //4MB 1024*4
        $config['overwrite'] = FALSE;
        $config['file_ext_tolower'] = TRUE;
        $config['remove_spaces'] = TRUE;

        $this->load->library('upload', $config);

        $file = 'file';
        if (!$this->upload->do_upload($file)) {
            $error = $this->upload->error_msg;
            $this->response(["error" => $error], REST_Controller::HTTP_BAD_REQUEST);
        } else {
            $data = $this->upload->data();

            $imagen = $this->propiedad->add_imagen($id_propiedad, $descripcion, $webpath, $data['raw_name'], $data['file_ext'], $es_portada);

            // ini resize ------------------------------------------------
            /*
              $config['image_library'] = 'gd2';
              $config['source_image'] = $path . $filename;
              //$config['create_thumb'] = TRUE;
              $config['maintain_ratio'] = TRUE;
              $config['width'] = 1200; //1000
              //$config['height'] = 900;
              $this->load->library('image_lib', $config);
              $this->image_lib->resize();
             */
            // fin resize ------------------------------------------------


            $this->response(["imagen" => $imagen, "data" => $data]);
        }
    }

}
