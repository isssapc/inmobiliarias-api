<?php

class Mensaje extends CI_Model {

    public function __construct() {
        parent::__construct();
        $timezone = "America/Mexico_City";
        date_default_timezone_set($timezone);
    }

    public function get_mensajes_enviados_usuario($id_usuario) {

        $sql = "SELECT m.*, d.nombre AS usuario_destino
                FROM mensaje m
                JOIN usuario d ON d.id_usuario= m.id_usuario_destino
                WHERE m.id_usuario_origen=$id_usuario";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    public function get_mensajes_recibidos_usuario($id_usuario) {

        $sql = "SELECT m.*, o.nombre AS usuario_origen
                FROM mensaje m
                JOIN usuario o ON o.id_usuario= m.id_usuario_origen
                WHERE m.id_usuario_destino=$id_usuario";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    public function get_one($id) {

        $sql = "SELECT m.*,d.nombre AS usuario_destino,o.nombre AS usuario_origen
                FROM mensaje m
                JOIN usuario d ON d.id_usuario= m.id_usuario_destino
                JOIN usuario o ON o.id_usuario= m.id_usuario_origen
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

        $this->db->where('id_usuario_origen', $id_usuario);
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
