<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Tareas extends MY_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model("tarea");
    }

    public function usuario_get($id_usuario) {
        $recibidos = $this->tarea->get_tareas_recibidos_usuario($id_usuario);
        $enviados = $this->tarea->get_tareas_enviados_usuario($id_usuario);
        $this->response(array('recibidos' => $recibidos, 'enviados' => $enviados));
    }

    public function del_tareas_usuario_post($id_usuario) {
        $count = $this->tarea->del_tareas_usuario($id_usuario);
        $this->response(array('count' => $datos));
    }

    public function get_tarea_get($id) {
        $datos = $this->tarea->get_one($id);
        $this->response($datos);
    }

//    
//    
//    public function search_tarea_get($nombre) {
//        $datos = $this->tarea->search_by_nombre($nombre);
//        $this->response($datos);
//    }

    public function del_tarea_post($id) {
        $count = $this->tarea->del_one($id);
        $this->response(array("count" => $count));
    }

    public function create_tarea_post() {
        $tarea = $this->post("tarea");
        $datos = $this->tarea->create_one($tarea);
        $this->response($datos);
    }

    public function update_tarea_post($id) {
        $tarea = $this->post("tarea");
        $datos = $this->tarea->update_one($id, $tarea);
        $this->response($datos);
    }

}
