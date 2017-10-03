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

    public function get_one($id) {

        $sql = "SELECT c.*
                FROM propietario p
                WHERE c.id_propietario= $id LIMIT 1";
        $query = $this->db->query($sql);
        return $query->row_array();
    }

    public function search_by_nombre($nombre) {
        $sql = "SELECT *
                FROM propietario p 
                WHERE c.nombre like '%$nombre%'";
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
