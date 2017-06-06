<?php

class Caracteristica extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    public function get_all() {

        $sql = "SELECT *
                FROM caracteristica";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    public function get_one($id) {

        $sql = "SELECT c.*
                FROM caracteristica c
                WHERE c.id_caracteristica= $id";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    public function del_one($id) {

        $sql = "SELECT c.*
                FROM caracteristica c
                WHERE c.id_caracteristica= $id";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    public function del_many($ids) {

        $sql = "SELECT c.*
                FROM caracteristica c
                WHERE c.id_caracteristica= $id";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    public function create_one($caracteristica) {

        $sql = "SELECT c.*
                FROM caracteristica c
                WHERE c.id_caracteristica= $id";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    public function update_one($caracteristica) {

        $sql = "SELECT c.*
                FROM caracteristica c
                WHERE c.id_caracteristica= $id";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

}
