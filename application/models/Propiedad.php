<?php

class Propiedad extends CI_Model {

    public function __construct() {
        parent::__construct();
        $timezone = "America/Mexico_City";
        date_default_timezone_set($timezone);
    }

    public function get_all() {

        $sql = "SELECT p.*, u.nombre AS usuario
                FROM propiedad p
                JOIN usuario u ON u.id_usuario=p.id_usuario";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    public function get_one($id) {

        $sql = "SELECT p.*, u.nombre AS usuario
                FROM propiedad p
                JOIN usuario u ON u.id_usuario=p.id_usuario
                WHERE p.id_propiedad= $id LIMIT 1";
        $query = $this->db->query($sql);
        return $query->row_array();
    }

    public function get_tipos() {
        $sql = "SELECT *
                FROM tipo_propiedad";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    public function del_one($id) {

        $sql = "SELECT p.*
                FROM propiedad p
                WHERE p.id_propiedad= $id";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    public function del_many($ids) {

        $sql = "SELECT p.*
                FROM propiedad p
                WHERE p.id_propiedad= $id";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    public function create_one($propiedad) {
        $propiedad["fecha_creacion"] = date("Y-m-d");
        $this->db->insert("propiedad", $propiedad);
        $id = $this->db->insert_id();
        $data = $this->get_one($id);
        return $data;
    }

    public function update_one($id, $props) {

        $where = "id_propiedad = $id";
        $sql = $this->db->update_string('propiedad', $props, $where);
        $this->db->query($sql);

        $propiedad = $this->get_one($id);
        return $propiedad;
    }

    public function add_imagen($id_propiedad, $descripcion, $filename, $es_portada = 0) {
        $datos = array(
            "id_producto" => $id_propiedad,
            "filename" => $filename,
            "descripcion" => $descripcion,
            "es_portada" => $es_portada
        );

        $this->db->insert("propiedad_imagen", $datos);
        $id = $this->db->insert_id();

        $data = $this->get_imagen($id);
        return $data;
    }

    public function get_imagen($id) {

        $sql = "SELECT p.*
                FROM propiedad_imagen p
                WHERE p.id_propiedad_imagen= $id LIMIT 1";
        $query = $this->db->query($sql);
        return $query->row_array();
    }

    public function get_imagenes_propiedad($id_propiedad) {

        $sql = "SELECT p.*
                FROM propiedad_imagen p
                WHERE p.id_propiedad= $id_propiedad LIMIT 1";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

}
