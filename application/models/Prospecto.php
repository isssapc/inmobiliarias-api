<?php

class Prospecto extends CI_Model {

    public function __construct() {
        parent::__construct();
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

}
