<?php

class Prospecto extends CI_Model {

    public function __construct() {
        parent::__construct();
        $timezone = "America/Mexico_City";
        date_default_timezone_set($timezone);
    }

    //ok
    public function get_all() {

        $sql = "SELECT *
                FROM prospecto";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    //ok
    public function get_one($id) {

        $sql = "SELECT p.*
                FROM prospecto p
                WHERE p.id_prospecto= $id LIMIT 1";
        $query = $this->db->query($sql);
        return $query->row_array();
    }

    public function search_by_nombre($nombre) {
        $sql = "SELECT *
                FROM prospecto p 
                WHERE p.nombre like '%$nombre%'";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    public function del_one($id) {

        $this->db->where('id_prospecto', $id);
        $this->db->delete('prospecto');
        $count = $this->db->affected_rows();
        return $count;
    }

    /*
     * 
     * TODO
     */

    public function del_many($ids) {

        $sql = "SELECT c.*
                FROM prospecto p
                WHERE c.id_prospecto= $ids";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    //ok
    public function create_one($prospecto) {

        $this->db->insert('prospecto', $prospecto);
        $id_prospecto = $this->db->insert_id();

        $prospecto = $this->get_one($id_prospecto);
        return $prospecto;
    }

    //ok
    public function update_one($id, $props) {

        $where = "id_prospecto = $id";
        $sql = $this->db->update_string('prospecto', $props, $where);
        $this->db->query($sql);

        $prospecto = $this->get_one($id);
        return $prospecto;
    }

    public function add_mensaje_seguimiento($seguimiento) {
        $seguimiento["fecha"] = date("Y-m-d H:i:s");
        $this->db->insert("prospecto_seguimiento", $seguimiento);
        $id = $this->db->insert_id();
        $data = $this->get_mensaje_seguimiento($id);
        return $data;
    }

    public function get_mensaje_seguimiento($id) {

        $sql = "SELECT s.*, u.nombre AS usuario
                FROM prospecto_seguimiento s
                JOIN usuario u ON u.id_usuario=s.id_usuario
                WHERE s.id = $id LIMIT 1";
        $query = $this->db->query($sql);
        return $query->row_array();
    }

    public function get_seguimiento($id_prospecto) {

        $sql = "SELECT s.*, u.nombre AS usuario
                FROM prospecto_seguimiento s
                JOIN usuario u ON u.id_usuario=s.id_usuario
                WHERE s.id_propiedad = $id_prospecto
                ORDER BY s.fecha DESC";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

}
