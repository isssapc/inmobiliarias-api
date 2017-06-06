<?php

class Inmobiliaria extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    public function get_all() {

        $sql = "SELECT *
                FROM inmobiliaria";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    public function get_one($id) {

        $sql = "SELECT i.*
                FROM inmobiliaria i
                WHERE i.id_inmobiliaria= $id";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    public function del_one($id) {

        $sql = "SELECT i.*
                FROM inmobiliaria i
                WHERE i.id_inmobiliaria= $id";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    public function del_many($ids) {

        $sql = "SELECT i.*
                FROM inmobiliaria i
                WHERE i.id_inmobiliaria= $id";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    public function create_one($inmobiliaria) {

        $sql = "SELECT i.*
                FROM inmobiliaria i
                WHERE i.id_inmobiliaria= $id";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    public function update_one($inmobiliaria) {

        $sql = "SELECT i.*
                FROM inmobiliaria i
                WHERE i.id_inmobiliaria= $id";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

}
