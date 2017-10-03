<?php

class oPropiedad {

    
    public $generales = [];
    public $restricciones = [];
    public $recreacion = [];
    public $exterior = [];

    public function __set($name, $value) {        

        if (strpos($name, 'general') === 0) {
            if (isset($value)) {
                $this->generales[] = array($name => $value);
            }
        } else if (strpos($name, "exterior") === 0) {
            if (isset($value)) {
                $this->exterior[] = array($name => $value);
            }
        } else if (strpos($name, "recreacion") === 0) {
            if (isset($value)) {
                $this->recreacion[] = array($name => $value);
            }
        } else if (strpos($name, "restricciones") === 0) {
            if (isset($value)) {
                $this->restricciones[] = array($name => $value);
            }
        } else {
            $this->$name = $value;
        }
    }

    public function __get($name) {
        if (isset($this->$name)) {
            return $this->$name;
        }
    }

}
