<?php

class Propietario extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    public function get_all() {

        $sql = "SELECT *
                FROM propietario";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    public function get_all_con_num_propiedades() {

        $sql = "SELECT 
                p.*,
                IF(c.num_propiedades IS NULL, 0, c.num_propiedades) AS num_propiedades
                FROM propietario p
                LEFT JOIN (
                SELECT COUNT(*) AS num_propiedades, id_propietario
                FROM propiedad
                GROUP BY id_propietario) c ON c.id_propietario=p.id_propietario;";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    public function get_propiedades($id_propietaio) {
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
                WHERE p.id_propietario=$id_propietaio";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    public function get_documentos($id_propietaio) {
        $sql = "SELECT d.*
                FROM documento d                
                WHERE d.id_propietario=$id_propietaio";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    public function get_one($id) {

        $sql = "SELECT p.*
                FROM propietario p
                WHERE p.id_propietario= $id LIMIT 1";
        $query = $this->db->query($sql);
        return $query->row_array();
    }

    public function search_by_nombre($nombre) {
        $sql = "SELECT *
                FROM propietario p 
                WHERE p.nombre like '%$nombre%'";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    public function del_one($id) {

        $this->db->where('id_propietario', $id);
        $this->db->delete('propietario');
        $count = $this->db->affected_rows();
        return $count;
    }

    /*
     * 
     * TODO
     */

    public function del_many($ids) {

        $sql = "SELECT c.*
                FROM propietario p
                WHERE c.id_propietario= $ids";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    //ok
    public function create_one($propietario) {

        $this->db->insert('propietario', $propietario);
        $id_propietario = $this->db->insert_id();

        $propietario = $this->get_one($id_propietario);
        return $propietario;
    }

    public function update_one($id, $props) {

        $where = "id_propietario = $id";
        $sql = $this->db->update_string('propietario', $props, $where);
        $this->db->query($sql);

        $propietario = $this->get_one($id);
        return $propietario;
    }

}
