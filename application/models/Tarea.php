<?php

class Tarea extends CI_Model {

    public function __construct() {
        parent::__construct();
        $timezone = "America/Mexico_City";
        date_default_timezone_set($timezone);
    }

    public function get_tareas_creadas_usuario($id_usuario) {

        $sql = "SELECT t.*, u.nombre AS usuario_asignado
                FROM tarea t
                JOIN usuario u ON u.id_usuario= t.id_usuario_asignado
                WHERE t.id_usuario_creador=$id_usuario";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    public function get_tareas_asignadas_usuario($id_usuario) {

        $sql = "SELECT t.*, u.nombre AS usuario_creador
                FROM tarea t
                JOIN usuario u ON u.id_usuario= t.id_usuario_creador
                WHERE t.id_usuario_asignado=$id_usuario";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    public function get_one($id) {

        $sql = "SELECT t.*,uc.nombre AS usuario_creador,ua.nombre AS usuario_asignado
                FROM tarea t
                JOIN usuario uc ON d.id_usuario= t.id_usuario_creador
                JOIN usuario ua ON o.id_usuario= t.id_usuario_asignado
                WHERE t.id_tarea= $id LIMIT 1";
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

        $tarea["fecha_creacion"] = date("Y-m-d H:i:s");

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
