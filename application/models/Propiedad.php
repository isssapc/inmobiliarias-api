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

    public function get_all_con_portada() {

        $sql = "SELECT p.*, u.nombre AS usuario, pi.src AS img_src
                FROM propiedad p
                JOIN usuario u ON u.id_usuario=p.id_usuario
                LEFT JOIN (
                    SELECT i.id_propiedad, i.file_name, i.es_portada,CONCAT(i.file_path, i.file_name,IF(i.timestamp is null, '', i.timestamp), i.file_ext) AS src
                    FROM propiedad_imagen i
                    JOIN (
                    SELECT pi.id_propiedad, max(pi.es_portada) AS es_portada
                    FROM propiedad_imagen pi group BY pi.id_propiedad) i2
                    ON i.id_propiedad=i2.id_propiedad AND i.es_portada= i2.es_portada
                ) pi ON pi.id_propiedad=p.id_propiedad";
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

    public function set_imagen_portada($id_propiedad, $id_propiedad_imagen) {

        //actualizamos todas a 0
        $where = "id_propiedad = $id_propiedad";
        $props = array("es_portada" => 0);
        $sql = $this->db->update_string('propiedad_imagen', $props, $where);
        $this->db->query($sql);

        //asignamos la imagen deseada a 1
        $where = "id_propiedad_imagen = $id_propiedad_imagen";
        $props = array("es_portada" => 1);
        $sql = $this->db->update_string('propiedad_imagen', $props, $where);
        $this->db->query($sql);



        $imagen = $this->get_imagen($id_propiedad_imagen);
        return $imagen;
    }

    public function add_imagen($id_propiedad, $descripcion, $file_path, $file_name, $file_ext, $es_portada = 0) {
        $datos = array(
            "id_propiedad" => $id_propiedad,
            "file_path" => $file_path,
            "file_name" => $file_name,
            "file_ext" => $file_ext,
            "descripcion" => $descripcion,
            "es_portada" => $es_portada
        );

        $this->db->insert("propiedad_imagen", $datos);
        $id = $this->db->insert_id();

        $data = $this->get_imagen($id);
        return $data;
    }

    public function get_imagen($id) {

        $sql = "SELECT 
                p.id_propiedad_imagen,
                p.descripcion,
                p.es_portada,
                CONCAT(p.file_path, p.file_name,IF(p.timestamp is null, '', p.timestamp), p.file_ext) AS src
                FROM propiedad_imagen p
                WHERE p.id_propiedad_imagen= $id LIMIT 1";
        $query = $this->db->query($sql);
        return $query->row_array();
    }

    public function get_imagenes_propiedad($id_propiedad) {

        $sql = "SELECT 
                p.id_propiedad_imagen,
                p.descripcion,
                p.es_portada, 
                CONCAT(p.file_path, p.file_name,IF(p.timestamp is null, '', p.timestamp), p.file_ext) AS src
                FROM propiedad_imagen p
                WHERE p.id_propiedad= $id_propiedad";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

}
