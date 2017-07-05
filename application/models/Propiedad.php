<?php

class Propiedad extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    public function get_all() {

        $sql = "SELECT *
                FROM propiedad";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    public function get_one($id) {

        $sql = "SELECT p.*
                FROM propiedad p
                WHERE p.id_propiedad= $id";
        $query = $this->db->query($sql);
        return $query->result_array();
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
        $this->db->insert("propiedad", $propiedad);
        $id= $this->db->insert_id();
        $data= $this->get_one($id);
        return $data;
    }

    public function update_one($propiedad) {

        $sql = "SELECT p.*
                FROM propiedad p
                WHERE p.id_propiedad= $id";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

}
