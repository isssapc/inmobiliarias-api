<?php

class Tarea extends CI_Model {

    public function __construct() {
        parent::__construct();
        $timezone = "America/Mexico_City";
        date_default_timezone_set($timezone);
    }

    public function get_tareas_enviados_usuario($id_usuario) {

        $sql = "SELECT m.*, d.nombre AS usuario_destino
                FROM tarea m
                JOIN usuario d ON d.id_usuario= m.id_usuario_destino
                WHERE m.id_usuario_origen=$id_usuario";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    public function get_tareas_recibidos_usuario($id_usuario) {

        $sql = "SELECT m.*, o.nombre AS usuario_origen
                FROM tarea m
                JOIN usuario o ON o.id_usuario= m.id_usuario_origen
                WHERE m.id_usuario_destino=$id_usuario";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    public function get_one($id) {

        $sql = "SELECT m.*,d.nombre AS usuario_destino,o.nombre AS usuario_origen
                FROM tarea m
                JOIN usuario d ON d.id_usuario= m.id_usuario_destino
                JOIN usuario o ON o.id_usuario= m.id_usuario_origen
                WHERE m.id_tarea= $id LIMIT 1";
        $query = $this->db->query($sql);
        return $query->row_array();
    }

    public function del_one($id) {

        $this->db->where('id_tarea', $id);
        $this->db->delete('tarea');
        $count = $this->db->affected_rows();
        return $count;
    }

    public function del_tareas_usuario($id_usuario) {

        $this->db->where('id_usuario_origen', $id_usuario);
        $this->db->delete('tarea');
        $count = $this->db->affected_rows();
        return $count;
    }

    public function create_one($tarea) {

        //$seguimiento["fecha"] = date("Y-m-d H:i:s");

        $this->db->insert('tarea', $tarea);
        $id_tarea = $this->db->insert_id();

        $tarea = $this->get_one($id_tarea);
        return $tarea;
    }

    public function update_one($id, $props) {

        $where = "id_tarea = $id";
        $sql = $this->db->update_string('tarea', $props, $where);
        $this->db->query($sql);

        $tarea = $this->get_one($id);
        return $tarea;
    }

}
