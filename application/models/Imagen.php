<?php

class Imagen extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    /*
     * obtiene solo las propiedades de la imagen que nos interesa y
     * devuelve el src concatenado
     */

    public function get_one($id) {

        $sql = "SELECT 
                p.id_propiedad_imagen,               
                p.descripcion,
                p.es_portada,
                CONCAT(p.file_path, p.file_name, IF(p.timestamp is null, '', p.timestamp), p.file_ext) AS src
                FROM propiedad_imagen p
                WHERE p.id_propiedad_imagen= $id LIMIT 1";
        $query = $this->db->query($sql);
        return $query->row_array();
    }

    /*
     * obtiene solo las propiedades de la tabla propiedad-imagen
     */

    public function get_imagen($id) {

        $sql = "SELECT 
                p.*
                FROM propiedad_imagen p
                WHERE p.id_propiedad_imagen= $id LIMIT 1";
        $query = $this->db->query($sql);
        return $query->row_array();
    }

    public function rotate($id_imagen, $grados) {

        $imagen = $this->get_imagen($id_imagen);

        $path = "./upload/propiedades/" . $imagen['id_propiedad'] . "/" .
                $imagen['file_name'] . $imagen['timestamp'] . $imagen['file_ext'];

        $timestamp = time();


        $path_timestamp = "./upload/propiedades/" . $imagen['id_propiedad'] . "/" .
                $imagen['file_name'] . $timestamp . $imagen['file_ext'];

        $config['image_library'] = 'gd2';
        $config['source_image'] = $path;
        $config['new_image'] = $path_timestamp;
        $config['rotation_angle'] = $grados;

        $this->load->library('image_lib', $config);
        if (!$this->image_lib->rotate()) {
            $error = $this->image_lib->display_errors("", "");
            //devolvemos el error
            return array("error" => true, "msg" => $error);
        } else {


            // borramos el archivo anterior
            $path = realpath($path);
            if (file_exists($path)) {
                unlink($path);
            }


            //actualizamos el timestamp
            $where = "id_propiedad_imagen = $id_imagen";
            $props = array("timestamp" => $timestamp);
            $sql = $this->db->update_string('propiedad_imagen', $props, $where);
            $this->db->query($sql);
            //devolvemos la imagen con el timestamp actualizado
            return $this->get_one($id_imagen);
        }
    }

    public function del_one($id) {

        //obtenemos los datos de la imagen antes de borrarla
        $imagen = $this->get_imagen($id);

        //borramos de la BD
        $sql = "DELETE FROM propiedad_imagen WHERE id_propiedad_imagen=$id LIMIT 1";
        $this->db->query($sql);
        $count = $this->db->affected_rows();

        //si se borró de la BD entonces borramos el archivo
        if ($count == 1) {


            $path = "./upload/propiedades/" . $imagen['id_propiedad'] . "/" .
                    $imagen['file_name'] . $imagen['timestamp'] . $imagen['file_ext'];
            $path = realpath($path);
            if (file_exists($path)) {
                unlink($path);
            }
        }


        return $count;
    }

    /*
      public function get_all() {

      $sql = "SELECT u.*, r.nombre AS rol
      FROM imagen u
      JOIN rol r ON r.id_rol=u.id_rol";
      $query = $this->db->query($sql);
      return $query->result_array();
      }


      public function get_one($id) {

      $sql = "SELECT u.*, r.nombre AS rol
      FROM imagen u
      JOIN rol r ON r.id_rol= u.id_rol
      WHERE u.id_imagen= $id LIMIT 1";
      $query = $this->db->query($sql);
      return $query->row_array();
      }





      public function del_many($ids) {

      $this->db->where_in('id_imagen', $ids);
      $this->db->delete('imagen');
      $count = $this->db->affected_rows();
      return $count;
      }

      public function create_one($imagen) {

      $this->db->insert('imagen', $imagen);
      $id_imagen = $this->db->insert_id();

      $imagen = $this->get_one($id_imagen);
      return $imagen;
      }

      public function update_one($id, $props) {

      $where = "id_imagen = $id";
      $sql = $this->db->update_string('imagen', $props, $where);
      $this->db->query($sql);

      $imagen = $this->get_one($id);
      return $imagen;
      }
     */
}
