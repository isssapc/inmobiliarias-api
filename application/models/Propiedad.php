<?php

require_once (APPPATH . 'libraries/Propiedad.php');

class Propiedad extends CI_Model {

    public function __construct() {
        parent::__construct();
        $timezone = "America/Mexico_City";
        date_default_timezone_set($timezone);
    }

    public function get_all() {

        $sql = "SELECT                           
                p.*, 
                u.nombre AS usuario            
                FROM propiedad p
                JOIN usuario u ON u.id_usuario=p.id_usuario
                ORDER BY p.fecha_creacion DESC";
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
                    GROUP BY i.id_propiedad
                ) pi ON pi.id_propiedad=p.id_propiedad 
                ORDER BY p.fecha_creacion DESC";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    public function get_one($id) {

        $sql = "SELECT p.*, u.nombre AS usuario
                FROM propiedad p
                JOIN usuario u ON u.id_usuario=p.id_usuario
                WHERE p.id_propiedad= $id LIMIT 1";
        $query = $this->db->query($sql);
        $row = $query->row_array();
        //$row["en_venta"] = (bool) $row["en_venta"];
        return $row;
        //clase Propiedad definida en application/libraries
        //return $query->custom_row_object(0, 'oPropiedad');
    }

    public function get_tipos() {
        $sql = "SELECT *
                FROM tipo_propiedad";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    public function del_one($id) {
        $this->db->where('id_propiedad', $id);
        $this->db->delete('propiedad');
        $count = $this->db->affected_rows();
        return $count;
    }

    public function del_mensaje_seguimiento($id) {

        $this->db->where('id', $id);
        $this->db->delete('propiedad_seguimiento');
        $count = $this->db->affected_rows();
        return $count;
    }

    public function del_many($ids) {

        $sql = "SELECT p.*
                FROM propiedad p
                WHERE p.id_propiedad= $id";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    public function create_one($propiedad) {
        $propiedad["fecha_creacion"] = date("Y-m-d H:i:s");
        $propiedad['clave'] = date('ymdHis');
        $this->db->insert("propiedad", $propiedad);
        $id = $this->db->insert_id();
        $data = $this->get_one($id);
        return $data;
    }

    public function add_mensaje_seguimiento($seguimiento) {
        $seguimiento["fecha"] = date("Y-m-d H:i:s");
        $this->db->insert("propiedad_seguimiento", $seguimiento);
        $id = $this->db->insert_id();
        $data = $this->get_mensaje_seguimiento($id);
        return $data;
    }

    public function get_mensaje_seguimiento($id) {

        $sql = "SELECT s.*, u.nombre AS usuario
                FROM propiedad_seguimiento s
                JOIN usuario u ON u.id_usuario=s.id_usuario
                WHERE s.id = $id LIMIT 1";
        $query = $this->db->query($sql);
        return $query->row_array();
    }

    public function get_seguimiento($id_propiedad) {

        $sql = "SELECT s.*, u.nombre AS usuario
                FROM propiedad_seguimiento s
                JOIN usuario u ON u.id_usuario=s.id_usuario
                WHERE s.id_propiedad = $id_propiedad
                ORDER BY s.fecha DESC";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    public function update_one($id, $props) {

        $this->escape_numeric_fields($props);


        $where = "id_propiedad = $id";
        $sql = $this->db->update_string('propiedad', $props, $where);
        $this->db->query($sql);

        $propiedad = $this->get_one($id);
        return $propiedad;
    }

    public function update_mensaje_seguimiento($id, $props) {

        $where = "id = $id";
        $sql = $this->db->update_string('propiedad_seguimiento', $props, $where);
        $this->db->query($sql);

        $mensaje = $this->get_mensaje_seguimiento($id);
        return $mensaje;
    }

    public function escape_numeric_fields(&$propiedad) {


        if (isset($propiedad["num_banos"])) {
            $propiedad["num_banos"] = empty($propiedad["num_banos"]) ? NULL : intval($propiedad["num_banos"]);
        }

        if (isset($propiedad["num_medios_banos"])) {
            $propiedad["num_medios_banos"] = empty($propiedad["num_medios_banos"]) ? NULL : intval($propiedad["num_medios_banos"]);
        }

        if (isset($propiedad["num_habitaciones"])) {
            $propiedad["num_habitaciones"] = empty($propiedad["num_habitaciones"]) ? NULL : intval($propiedad["num_habitaciones"]);
        }

        if (isset($propiedad["num_dormitorios"])) {
            $propiedad["num_dormitorios"] = empty($propiedad["num_dormitorios"]) ? NULL : intval($propiedad["num_dormitorios"]);
        }

        if (isset($propiedad["num_estacionamientos"])) {
            $propiedad["num_estacionamientos"] = empty($propiedad["num_estacionamientos"]) ? NULL : intval($propiedad["num_estacionamientos"]);
        }

        if (isset($propiedad["pisos"])) {
            $propiedad["pisos"] = empty($propiedad["pisos"]) ? NULL : intval($propiedad["pisos"]);
        }

        if (isset($propiedad["precio_renta"]) && empty($propiedad["precio_renta"])) {
            $propiedad["precio_renta"] = NULL;
        }

        if (isset($propiedad["precio_venta"]) && empty($propiedad["precio_venta"])) {
            $propiedad["precio_venta"] = NULL;
        }

        if (isset($propiedad["tarifa_diaria"]) && empty($propiedad["tarifa_diaria"])) {
            $propiedad["tarifa_diaria"] = NULL;
        }

        if (isset($propiedad["tarifa_semanal"]) && empty($propiedad["tarifa_semanal"])) {
            $propiedad["tarifa_semanal"] = NULL;
        }

        if (isset($propiedad["tarifa_mensual"]) && empty($propiedad["tarifa_mensual"])) {
            $propiedad["tarifa_mensual"] = NULL;
        }
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

    public function set_propietario($id_propiedad, $id_propietario) {
        $where = "id_propiedad = $id_propiedad";
        $props = array("id_propietario" => $id_propietario);
        $sql = $this->db->update_string('propiedad', $props, $where);
        $this->db->query($sql);


        $propiedad = $this->get_one($id_propiedad);
        return array("id_propietario" => $propiedad["id_propietario"]);
    }

    public function unset_propietario($id_propiedad) {
        $where = "id_propiedad = $id_propiedad";
        $props = array("id_propietario" => null);
        $sql = $this->db->update_string('propiedad', $props, $where);
        $this->db->query($sql);


        $propiedad = $this->get_one($id_propiedad);
        return array("id_propietario" => $propiedad["id_propietario"]);
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

    public function filtrar($filtro) {

        $WHERE = $this->makeFilter($filtro);

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
                    GROUP BY i.id_propiedad
                ) pi ON pi.id_propiedad=p.id_propiedad "
                . $WHERE;

        $query = $this->db->query($sql);
        //return $query->result_array();
        return array("propiedades" => $query->result_array(), "filtro" => $WHERE);
    }

    private function makeFilter($filter) {
        $filtro = "";

        if (isset($filter["tipo_operacion"])) {

            if ($filter["tipo_operacion"] === "venta") {
                $filtro .= " p.en_venta=1 ";
            }

            if ($filter["tipo_operacion"] === "renta") {
                $filtro .= " (p.en_renta=1 OR p.en_renta_temporal=1) ";
            }
        }

        if (isset($filter["id_tipo_propiedad"])) {
            $filtro .= " AND p.id_tipo_propiedad=" . $filter['id_tipo_propiedad'];
        }

        if (isset($filter["precio_min"]) && !empty($filter["precio_min"])) {

            if ($filter["tipo_operacion"] === "venta") {
                $filtro .= " AND p.precio_venta >= " . $filter['precio_min'];
            }

            if ($filter["tipo_operacion"] === "renta") {
                $filtro .= " AND p.precio_renta >= " . $filter['precio_min'];
            }
        }

        if (isset($filter["precio_max"]) && !empty($filter["precio_max"])) {

            if ($filter["tipo_operacion"] === "venta") {
                $filtro .= " AND p.precio_venta <= " . $filter['precio_max'];
            }

            if ($filter["tipo_operacion"] === "renta") {
                $filtro .= " AND p.precio_renta <= " . $filter['precio_max'];
            }
        }

        if (isset($filter["num_dormitorios"])) {
            $filtro .= " AND p.num_dormitorios=" . $filter['num_dormitorios'];
        }

        if (isset($filter["num_banos"])) {
            $filtro .= " AND p.num_banos=" . $filter['num_banos'];
        }

        if (isset($filter["m2_terreno"])) {
            $filtro .= " AND p.m2_terreno=" . $filter['m2_terreno'];
        }

        if (isset($filter["m2_construccion"])) {
            $filtro .= " AND p.m2_construccion=" . $filter['m2_construccion'];
        }

        if (isset($filter["zona"])) {
            $filtro .= " AND CONCAT(p.estado, p.municipio, p.colonia) like %" . $filter['zona'] . "%;";
        }

        if (!empty($filtro)) {

            if (substr($filtro, 0, 4) === " AND") {
                $filtro = substr($filtro, 4, strlen($filtro));
            } else {
                //$filtro = "ramiro";
            }

            $filtro = "WHERE" . $filtro;
        }

        return $filtro;
    }

}
