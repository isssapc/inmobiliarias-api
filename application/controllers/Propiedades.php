<?php

defined('BASEPATH') OR exit('No direct script access allowed');

define('FPDF_FONTPATH', APPPATH . 'libraries/fpdf181/font/');
require_once APPPATH . 'libraries/fpdf181/fpdf.php';

//require_once APPPATH . 'libraries/fpdi/fpdi.php';

class Propiedades extends MY_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model("propiedad");
        $this->load->model("propietario");
    }

    public function index_get() {
        $datos = $this->propiedad->get_all();
        $this->response($datos);
    }

    public function con_portada_get() {
        $datos = $this->propiedad->get_all_con_portada();
        $this->response($datos);
    }

    public function get_propiedad_get($id) {
        $propiedad = $this->propiedad->get_one($id);
        $imagenes = $this->propiedad->get_imagenes_propiedad($id);
        $this->response(["propiedad" => $propiedad, "imagenes" => $imagenes]);
    }

    public function get_propiedad_and_propietario_get($id) {
        $propiedad = $this->propiedad->get_one($id);
        $imagenes = $this->propiedad->get_imagenes_propiedad($id);
        if (isset($propiedad["id_propietario"])) {
            $propietario = $this->propietario->get_one($propiedad["id_propietario"]);
        } else {
            $propietario = null;
        }
        $this->response(["propiedad" => $propiedad, "imagenes" => $imagenes, "propietario" => $propietario]);
    }

    public function get_tipos_get() {
        $datos = $this->propiedad->get_tipos();
        $this->response($datos);
    }

    public function get_imagenes_propiedad_get($id_propiedad) {
        $datos = $this->propiedad->get_imagenes_propiedad($id_propiedad);
        $this->response($datos);
    }

    public function del_propiedad_post($id) {
        $datos = $this->propiedad->del_one($id);
        $this->response($datos);
    }

    public function del_propiedades_post() {
        $ids = $this->post("id_propiedades");
        $datos = $this->propiedad->del_many($ids);
        $this->response($datos);
    }

    public function create_propiedad_post() {
        $propiedad = $this->post("propiedad");
        $datos = $this->propiedad->create_one($propiedad);
        $this->response($datos);
    }

    public function update_propiedad_post($id) {
        $propiedad = $this->post("propiedad");
        $datos = $this->propiedad->update_one($id, $propiedad);
        $this->response($datos);
    }

    public function set_imagen_portada_post($id_propiedad) {
        $id_propiedad_imagen = $this->post("id_propiedad_imagen");
        $datos = $this->propiedad->set_imagen_portada($id_propiedad, $id_propiedad_imagen);
        $this->response($datos);
    }

    public function set_propietario_post($id_propiedad) {
        $id_propietario = $this->post("id_propietario");
        $datos = $this->propiedad->set_propietario($id_propiedad, $id_propietario);
        $this->response($datos);
    }

    public function unset_propietario_get($id_propiedad) {

        $datos = $this->propiedad->unset_propietario($id_propiedad);
        $this->response($datos);
    }

    public function upload_imagen_post() {

        $id_propiedad = $this->post('id_propiedad');
        $descripcion = $this->post('descripcion');
        $es_portada = $this->post('es_portada');



        $path = "./upload/propiedades/" . $id_propiedad . "/";

        if (ENVIRONMENT === 'production') {
            //asi funciona en produccion y con api afuera de la carpeta de inmobiliaria
            $webpath = "api/upload/propiedades/" . $id_propiedad . "/";
        } else {
            //asi funciona en pruebas
            $webpath = "http://localhost:8080/inmobiliaria/api/upload/propiedades/" . $id_propiedad . "/";
        }



        if (!file_exists($path)) {
            mkdir($path, 0777, TRUE);
        }

        $config['upload_path'] = $path;
        $config['allowed_types'] = 'png|jpg|jpeg';
        $config['max_size'] = 4096; //4MB 1024*4
        $config['overwrite'] = FALSE;
        $config['file_ext_tolower'] = TRUE;
        $config['remove_spaces'] = TRUE;

        $this->load->library('upload', $config);

        $file = 'file';
        if (!$this->upload->do_upload($file)) {
            $error = $this->upload->error_msg;
            $this->response(["error" => $error], REST_Controller::HTTP_BAD_REQUEST);
        } else {
            $data = $this->upload->data();

            $imagen = $this->propiedad->add_imagen($id_propiedad, $descripcion, $webpath, $data['raw_name'], $data['file_ext'], $es_portada);

            // ini resize ------------------------------------------------

            $config['image_library'] = 'gd2';
            $config['source_image'] = $path . $data['file_name'];
            //$config['create_thumb'] = TRUE;
            $config['maintain_ratio'] = TRUE;
            $config['quality'] = "80%";
            $config['width'] = 1024; //1000
            //$config['height'] = 900;
            $this->load->library('image_lib', $config);
            $this->image_lib->resize();

            // fin resize ------------------------------------------------


            $this->response(["imagen" => $imagen, "data" => $data]);
        }
    }

    public function filtrar_post() {
        $filtro = $this->post("filtro");
        $datos = $this->propiedad->filtrar($filtro);
        $this->response($datos);
    }

    public function pdf_get($id_propiedad) {

        $propiedad = $this->propiedad->get_one($id_propiedad);
        $imagenes = $this->propiedad->get_imagenes_propiedad($id_propiedad);

        $pdf = new FPDF("P", "mm", "Letter");
        $pdf->AddPage();
        $pdf->SetFont('Arial', '', 14);
        $hl = 6;
        //$pdf->Cell(0, 10, "REALTY WORLD", 0, 1, 'C');
        //título del anuncio
        $pdf->Cell(0, 10, iconv('utf-8', 'iso-8859-1', $propiedad["titulo"]), 0, 1, 'L');





        if ($propiedad["en_venta"] === "1") {
            //$pdf->Cell(0, $hl, $propiedad["precio_venta"] . " EN VENTA", 0, 1, 'L');
            $pdf->SetFont('Arial', '', 14);
            $pdf->Write($hl, "$ " . number_format($propiedad["precio_venta"], 2));
            $pdf->SetFont('Arial', '', 8);
            $pdf->Write($hl, " EN VENTA");
            $pdf->Ln();
        }


        if ($propiedad["en_renta"] === "1") {
            //$pdf->Cell(0, $hl, number_format($propiedad["precio_renta"], 2) . " EN RENTA", 0, 1, 'L');
            $pdf->SetFont('Arial', '', 14);
            $pdf->Write($hl, "$ " . number_format($propiedad["precio_renta"], 2));
            $pdf->SetFont('Arial', '', 8);
            $pdf->Write($hl, " EN RENTA");
            $pdf->Ln();
        }

        if ($propiedad["en_renta_temporal"] === "1") {

            if (isset($propiedad["tarifa_diaria"])) {
                //$pdf->Cell(0, $hl, $propiedad["tarifa_diaria"] . "TARIFA DIARIA", 0, 1, 'L');
                $pdf->SetFont('Arial', '', 14);
                $pdf->Write($hl, "$ " . number_format($propiedad["tarifa_diaria"], 2));
                $pdf->SetFont('Arial', '', 8);
                $pdf->Write($hl, " TARIFA DIARIA");
                $pdf->Ln();
            }

            if (isset($propiedad["tarifa_semanal"])) {
                //$pdf->Cell(0, $hl, $propiedad["tarifa_semanal"] . "TARIFA SEMANAL", 0, 1, 'L');
                $pdf->SetFont('Arial', '', 14);
                $pdf->Write($hl, "$ " . number_format($propiedad["tarifa_semanal"], 2));
                $pdf->SetFont('Arial', '', 8);
                $pdf->Write($hl, " TARIFA SEMANAL");
                $pdf->Ln();
            }

            if (isset($propiedad["tarifa_mensual"])) {
                //$pdf->Cell(0, $hl, $propiedad["tarifa_mensual"] . "TARIFA MENSUAL", 0, 1, 'L');
                $pdf->SetFont('Arial', '', 14);
                $pdf->Write($hl, "$ " . number_format($propiedad["tarifa_mensual"], 2));
                $pdf->SetFont('Arial', '', 8);
                $pdf->Write($hl, " TARIFA MENSUAL");
                $pdf->Ln();
            }
        }

        $pdf->SetFont('Arial', '', 10);
        $pdf->MultiCell(0, $hl, iconv('utf-8', 'iso-8859-1', $propiedad["descripcion"]), 0, 'L', false);
        $pdf->Ln();

        //para php >=5.6
        //$array_portada = array_filter($imagenes, function($v, $k) {
        //    return $v["es_portada"] === "1";
        //}, ARRAY_FILTER_USE_BOTH);

        $array_portada = array_filter($imagenes, function($v) {
            return $v["es_portada"] === "1";
        });

        if (count($array_portada) === 1) {
            // no sabemos cual es la $key del $value por eso lo obtenemos dentro de un foreach
            foreach ($array_portada as $value) {
                $portada = $value;
            }
        } else {
            //suponemos que hay alguna foto
            $portada = $imagenes[0];
        }

        //$pdf->Cell(0, $hl, $imagenes[0]["src"], 0, 1, 'C');
        $yImg = $pdf->GetY();
        // file, x ,y, w, h   
        if (ENVIRONMENT === "production") {
            $pdf->Image("../" . $portada["src"], null, null, 120, 0);
        } else {
            $pdf->Image($portada["src"], null, null, 120, 0);
        }




        //asesor
        //$pdf->Cell(0, $hl, "Asesor: " . $propiedad["usuario"], 0, 1, 'L');
        //$pdf->Cell(0, $hl, "cel: 961 110 2236 " . "email: ramiro@ejemplo.com", 0, 1, 'L');
        //características

        $pdf->Ln();
        //$pdf->SetFont('Arial', '', 14);
        //$pdf->Cell(0, $hl, iconv('utf-8', 'iso-8859-1', "Características"), 0, 1, 'C');

        /*
          $pdf->SetFont('Arial', '', 14);
          $pdf->Cell(0, $hl, iconv('utf-8', 'iso-8859-1', "Ubicación"), 0, 1, 'L');
          $pdf->SetFont('Arial', '', 10);


          $pdf->Cell(0, $hl, iconv('utf-8', 'iso-8859-1', $propiedad["calle"] . " " . $propiedad["num_exterior"] . " " . $propiedad["num_interior"]), 0, 1, 'L');
          $pdf->Cell(0, $hl, iconv('utf-8', 'iso-8859-1', "Esquina con: " . $propiedad["esquina"]), 0, 1, 'L');
          $pdf->Cell(0, $hl, iconv('utf-8', 'iso-8859-1', "Colonia: " . $propiedad["colonia"]), 0, 1, 'L');
          $pdf->Cell(0, $hl, iconv('utf-8', 'iso-8859-1', $propiedad["municipio"] . ", " . $propiedad["estado"]), 0, 1, 'L');
          $pdf->Cell(0, $hl, iconv('utf-8', 'iso-8859-1', "CP: " . $propiedad["cp"]), 0, 1, 'L');
         */



        $yCar = $pdf->GetY();
        $wCol = 50;
        $pdf->SetFont('Arial', 'B', 10);
        $pdf->Cell($wCol, $hl, iconv('utf-8', 'iso-8859-1', "Exterior"), 0, 1, 'L');
        $pdf->SetFont('Arial', '', 10);

        if ($propiedad["exterior_balcon"] === '1') {
            $pdf->Cell($wCol, $hl, iconv('utf-8', 'iso-8859-1', "Balcón"), 0, 1, 'L');
        }
        if ($propiedad["exterior_cisterna"] === '1') {
            $pdf->Cell($wCol, $hl, "Cisterna", 0, 1, 'L');
        }
        if ($propiedad["exterior_estacionamiento"] === '1') {
            $pdf->Cell($wCol, $hl, "Estacionamiento techado", 0, 1, 'L');
        }
        if ($propiedad["exterior_facil_estacionarse"] === '1') {
            $pdf->Cell($wCol, $hl, "Facilidad de estacionarse", 0, 1, 'L');
        }
        if ($propiedad["exterior_garaje"] === '1') {
            $pdf->Cell($wCol, $hl, "Garaje", 0, 1, 'L');
        }
        if ($propiedad["exterior_jardin"] === '1') {
            $pdf->Cell($wCol, $hl, iconv('utf-8', 'iso-8859-1', "Jardín"), 0, 1, 'L');
        }
        if ($propiedad["exterior_parrilla"] === '1') {
            $pdf->Cell($wCol, $hl, "Parrilla", 0, 1, 'L');
        }
        if ($propiedad["exterior_patio"] === '1') {
            $pdf->Cell($wCol, $hl, "Patio", 0, 1, 'L');
        }
        if ($propiedad["exterior_roof"] === '1') {
            $pdf->Cell($wCol, $hl, "Roof garden", 0, 1, 'L');
        }
        if ($propiedad["exterior_terraza"] === '1') {
            $pdf->Cell($wCol, $hl, "Terraza", 0, 1, 'L');
        }


        $xCol2 = $wCol + 5;
        $pdf->SetXY($xCol2, $yCar);
        $pdf->SetFont('Arial', 'B', 10);
        $pdf->Cell($wCol, $hl, iconv('utf-8', 'iso-8859-1', "General"), 0, 1, 'L');
        $pdf->SetFont('Arial', '', 10);

        if ($propiedad["general_acceso_adultos"] === '1') {
            $pdf->SetX($xCol2);
            $pdf->Cell($wCol, $hl, "Accesibilidad adultos mayores", 0, 1, 'L');
        }

        if ($propiedad["general_acceso_discapacitados"] === '1') {
            $pdf->SetX($xCol2);
            $pdf->Cell($wCol, $hl, "Accesibilidad discapacitados", 0, 1, 'L');
        }

        if ($propiedad["general_aire"] === '1') {
            $pdf->SetX($xCol2);
            $pdf->Cell($wCol, $hl, "Aire acondicionado", 0, 1, 'L');
        }

        if ($propiedad["general_amueblado"] === '1') {
            $pdf->SetX($xCol2);
            $pdf->Cell($wCol, $hl, "Amueblado", 0, 1, 'L');
        }

        if ($propiedad["general_bodega"] === '1') {
            $pdf->SetX($xCol2);
            $pdf->Cell($wCol, $hl, "Bodega", 0, 1, 'L');
        }

        if ($propiedad["general_chimenea"] === '1') {
            $pdf->SetX($xCol2);
            $pdf->Cell($wCol, $hl, "Chimenea", 0, 1, 'L');
        }

        if ($propiedad["general_circuito"] === '1') {
            $pdf->SetX($xCol2);
            $pdf->Cell($wCol, $hl, "Circuito cerrado", 0, 1, 'L');
        }

        if ($propiedad["general_cocina_equipada"] === '1') {
            $pdf->SetX($xCol2);
            $pdf->Cell($wCol, $hl, "Cocina equipada", 0, 1, 'L');
        }

        if ($propiedad["general_cocina_integral"] === '1') {
            $pdf->SetX($xCol2);
            $pdf->Cell($wCol, $hl, "Cocina integral", 0, 1, 'L');
        }

        if ($propiedad["general_cuarto_servicio"] === '1') {
            $pdf->SetX($xCol2);
            $pdf->Cell($wCol, $hl, "Cuarto de servicio", 0, 1, 'L');
        }

        if ($propiedad["general_elevador"] === '1') {
            $pdf->SetX($xCol2);
            $pdf->Cell($wCol, $hl, "Elevador", 0, 1, 'L');
        }

        if ($propiedad["general_fraccionamiento_privado"] === '1') {
            $pdf->SetX($xCol2);
            $pdf->Cell($wCol, $hl, "Fraccionamiento privado", 0, 1, 'L');
        }

        if ($propiedad["general_planta"] === '1') {
            $pdf->SetX($xCol2);
            $pdf->Cell($wCol, $hl, iconv('utf-8', 'iso-8859-1', "Planta eléctrica"), 0, 1, 'L');
        }

        if ($propiedad["general_portero"] === '1') {
            $pdf->SetX($xCol2);
            $pdf->Cell($wCol, $hl, "Portero", 0, 1, 'L');
        }

        if ($propiedad["general_seguridad_completo"] === '1') {
            $pdf->SetX($xCol2);
            $pdf->Cell($wCol, $hl, "Seguridad 24 horas", 0, 1, 'L');
        }

        if ($propiedad["general_seguridad_medio"] === '1') {
            $pdf->SetX($xCol2);
            $pdf->Cell($wCol, $hl, "Seguridad 12 horas", 0, 1, 'L');
        }

        $xCol3 = ($wCol + 5) * 2;
        $pdf->SetXY($xCol3, $yCar);
        $pdf->SetFont('Arial', 'B', 10);
        $pdf->Cell($wCol, $hl, iconv('utf-8', 'iso-8859-1', "Recreación"), 0, 1, 'L');
        $pdf->SetFont('Arial', '', 10);

        if ($propiedad["recreacion_alberca"] === '1') {
            $pdf->SetX($xCol3);
            $pdf->Cell($wCol, $hl, "Alberca", 0, 1, 'L');
        }
        if ($propiedad["recreacion_infantil"] === '1') {
            $pdf->SetX($xCol3);
            $pdf->Cell($wCol, $hl, iconv('utf-8', 'iso-8859-1', "Área de juegos infantiles"), 0, 1, 'L');
        }
        if ($propiedad["recreacion_tenis"] === '1') {
            $pdf->SetX($xCol3);
            $pdf->Cell($wCol, $hl, "Cancha de tenis", 0, 1, 'L');
        }
        if ($propiedad["recreacion_gimnasio"] === '1') {
            $pdf->SetX($xCol3);
            $pdf->Cell($wCol, $hl, "Gimnasio", 0, 1, 'L');
        }
        if ($propiedad["recreacion_jacuzzi"] === '1') {
            $pdf->SetX($xCol3);
            $pdf->Cell($wCol, $hl, "Jacuzzi", 0, 1, 'L');
        }
        if ($propiedad["recreacion_usos_multiples"] === '1') {
            $pdf->SetX($xCol3);
            $pdf->Cell($wCol, $hl, iconv('utf-8', 'iso-8859-1', "Salón de usos múltiples"), 0, 1, 'L');
        }

        $xCol4 = ($wCol + 5) * 3;
        $pdf->SetXY($xCol4, $yCar);
        $pdf->SetFont('Arial', 'B', 10);
        $pdf->Cell(0, $hl, iconv('utf-8', 'iso-8859-1', "Restricciones"), 0, 1, 'L');
        $pdf->SetFont('Arial', '', 10);

        if ($propiedad["restricciones_mascotas"] === '1') {
            $pdf->SetX($xCol4);
            $pdf->Cell($wCol, $hl, "Mascotas permitidas", 0, 1, 'L');
        }
        if ($propiedad["restricciones_no_mascotas"] === '1') {
            $pdf->SetX($xCol4);
            $pdf->Cell($wCol, $hl, "No se aceptan mascotas", 0, 1, 'L');
        }
        if ($propiedad["restricciones_fumar"] === '1') {
            $pdf->SetX($xCol4);
            $pdf->Cell($wCol, $hl, "Permitido fumar", 0, 1, 'L');
        }
        if ($propiedad["restricciones_no_fumar"] === '1') {
            $pdf->SetX($xCol4);
            $pdf->Cell($wCol, $hl, "Prohibido fumar", 0, 1, 'L');
        }




        //Detalles
        $xImg = 140;
        $pdf->SetXY($xImg, $yImg);
        $pdf->SetFont('Arial', 'B', 10);
        $pdf->Cell(0, $hl, iconv('utf-8', 'iso-8859-1', "Detalles"), 0, 1, 'L');
        $pdf->SetFont('Arial', '', 10);
        if (isset($propiedad["num_dormitorios"])) {
            $pdf->SetX($xImg);
            $pdf->Cell(0, $hl, $propiedad["num_dormitorios"] . iconv('utf-8', 'iso-8859-1', " recámaras"), 0, 1, 'L');
        }

        if (isset($propiedad["num_banos"])) {
            $pdf->SetX($xImg);
            $pdf->Cell(0, $hl, $propiedad["num_banos"] . iconv('utf-8', 'iso-8859-1', " baños"), 0, 1, 'L');
        }

        if (isset($propiedad["num_medios_banos"])) {
            $pdf->SetX($xImg);
            $pdf->Cell(0, $hl, $propiedad["num_medios_banos"] . iconv('utf-8', 'iso-8859-1', " medios baños"), 0, 1, 'L');
        }

        if (isset($propiedad["num_estacionamientos"])) {
            $pdf->SetX($xImg);
            $pdf->Cell(0, $hl, $propiedad["num_estacionamientos"] . " estacionamientos", 0, 1, 'L');
        }

        if (isset($propiedad["m2_construccion"])) {
            $pdf->SetX($xImg);
            $pdf->Cell(0, $hl, $propiedad["m2_construccion"] . iconv('utf-8', 'iso-8859-1', " m" . html_entity_decode("&#178;") . " de construcción"), 0, 1, 'L');
        }

        if (isset($propiedad["m2_terreno"])) {
            $pdf->SetX($xImg);
            $pdf->Cell(0, $hl, $propiedad["m2_terreno"] . " " . iconv('utf-8', 'iso-8859-1', $propiedad["unidad_medida_terreno"]) . " de terreno", 0, 1, 'L');
        }

        if (isset($propiedad["largo_terreno"])) {
            $pdf->SetX($xImg);
            $pdf->Cell(0, $hl, $propiedad["largo_terreno"] . " m de largo", 0, 1, 'L');
        }

        if (isset($propiedad["frente_terreno"])) {
            $pdf->SetX($xImg);
            $pdf->Cell(0, $hl, $propiedad["frente_terreno"] . " m de frente", 0, 1, 'L');
        }


        if (isset($propiedad["piso"])) {
            $pdf->SetX($xImg);
            $pdf->Cell(0, $hl, "Nivel: " . $propiedad["piso"], 0, 1, 'L');
        }


        if (isset($propiedad["pisos"])) {
            $pdf->SetX($xImg);
            $pdf->Cell(0, $hl, "Cantidad de pisos del edificio: " . $propiedad["pisos"], 0, 1, 'L');
        }


        if (isset($propiedad["mantenimiento_mensual"])) {
            $pdf->SetX($xImg);
            $pdf->Cell(0, $hl, "Mantenimiento mensual: " . $propiedad["mantenimiento_mensual"], 0, 1, 'L');
        }


        if ($propiedad["antiguedad"] === "1") {
            $pdf->SetX($xImg);
            $pdf->Cell(0, $hl, iconv('utf-8', 'iso-8859-1', "Año de construcción: ") . $propiedad["fecha_construccion"], 0, 1, 'L');
        }

        if ($propiedad["antiguedad"] === "2") {
            $pdf->SetX($xImg);
            $pdf->Cell(0, $hl, "A estrenar", 0, 1, 'L');
        }

        if ($propiedad["antiguedad"] === "3") {
            $pdf->SetX($xImg);
            $pdf->Cell(0, $hl, iconv('utf-8', 'iso-8859-1', "En construcción"), 0, 1, 'L');
        }


        //$this->response($array_portada["es_portada"]);

        $pdf->Output("F", "upload/hola.pdf");



        $image = new Imagick();
        $ppp = 200;
        $image->setResolution($ppp, $ppp);
        //$image->setbackgroundcolor("blue");


        $image->readImage(realpath("upload/hola.pdf") . '[0]');

        //puede usarse con $image->setbackgroundcolor("blue"); para cambiar el color de fondo
        $image = $image->mergeimagelayers(Imagick::LAYERMETHOD_FLATTEN);

        $image->setImageFormat("png");

        // Send headers and output the image //
        header("Content-Type: image/{$image->getImageFormat()}");
        echo $image->getImageBlob();
    }

}
