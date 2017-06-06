<?php

class Usuario extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    public function get_all() {

        $sql = "SELECT *
                FROM usuario";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    public function get_one($id) {

        $sql = "SELECT u.*
                FROM usuario u
                WHERE u.id_usuario= $id";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    public function del_one($id) {

        $sql = "SELECT u.*
                FROM usuario u
                WHERE u.id_usuario= $id";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    public function del_many($ids) {

        $sql = "SELECT u.*
                FROM usuario u
                WHERE u.id_usuario= $id";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    public function create_one($usuario) {

        $sql = "SELECT u.*
                FROM usuario u
                WHERE u.id_usuario= $id";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    public function update_one($usuario) {

        $sql = "SELECT u.*
                FROM usuario u
                WHERE u.id_usuario= $id";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

}
