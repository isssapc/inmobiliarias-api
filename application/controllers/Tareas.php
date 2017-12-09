<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Tareas extends MY_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model("tarea");
    }

    public function get_tareas_usuario_get($id_usuario) {
        $creadas = $this->tarea->get_tareas_creadas_usuario($id_usuario);
        $asignadas = $this->tarea->get_tareas_asignadas_usuario($id_usuario);
        $this->response(array('creadas' => $creadas, 'asignadas' => $asignadas));
    }

    public function del_tareas_usuario_post($id_usuario) {
        $count = $this->tarea->del_tareas_usuario($id_usuario);
        $this->response(array('count' => $datos));
    }

    public function get_tarea_get($id) {
        $datos = $this->tarea->get_one($id);
        $this->response($datos);
    }

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

    public function toggle_value_get($id) {

        $datos = $this->tarea->toggle_value($id);
        $this->response($datos);
    }

}
