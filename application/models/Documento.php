<?php

class Documento extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    public function get_all() {

        $sql = "SELECT *
                FROM documento";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    public function get_one($id) {

        $sql = "SELECT d.*
                FROM documento d
                WHERE d.id_documento= $id";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    public function del_one($id) {

        $sql = "SELECT d.*
                FROM documento d
                WHERE d.id_documento= $id";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    public function del_many($ids) {

        $sql = "SELECT d.*
                FROM documento d
                WHERE d.id_documento= $id";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    public function create_one($documento) {

        $sql = "SELECT d.*
                FROM documento d
                WHERE d.id_documento= $id";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    public function update_one($documento) {

        $sql = "SELECT d.*
                FROM documento d
                WHERE d.id_documento= $id";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

}
