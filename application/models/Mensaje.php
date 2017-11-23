<?php

class Mensaje extends CI_Model {

    public function __construct() {
        parent::__construct();
        $timezone = "America/Mexico_City";
        date_default_timezone_set($timezone);
    }

    public function get_mensajes_usuario($id_usuario) {

        $sql = "SELECT *
                FROM mensaje
                WHERE id_usuario=$id_usuario";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    public function get_one($id) {

        $sql = "SELECT m.*
                FROM mensaje m
                WHERE m.id_mensaje= $id LIMIT 1";
        $query = $this->db->query($sql);
        return $query->row_array();
    }

    public function del_one($id) {

        $this->db->where('id_mensaje', $id);
        $this->db->delete('mensaje');
        $count = $this->db->affected_rows();
        return $count;
    }

    public function del_mensajes_usuario($id_usuario) {

        $this->db->where('id_usuario', $id_usuario);
        $this->db->delete('mensaje');
        $count = $this->db->affected_rows();
        return $count;
    }

    public function create_one($mensaje) {

        //$seguimiento["fecha"] = date("Y-m-d H:i:s");

        $this->db->insert('mensaje', $mensaje);
        $id_mensaje = $this->db->insert_id();

        $mensaje = $this->get_one($id_mensaje);
        return $mensaje;
    }

    public function update_one($id, $props) {

        $where = "id_mensaje = $id";
        $sql = $this->db->update_string('mensaje', $props, $where);
        $this->db->query($sql);

        $mensaje = $this->get_one($id);
        return $mensaje;
    }

}
