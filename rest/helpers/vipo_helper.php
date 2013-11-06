<?php

const RPT_SATISFACTORIO = "1";
const RPT_ERROR = "0";

/*
 * 20131105 Daniel Pomalaza
 */
if (!function_exists('respuesta')) {
    function respuesta($resultado, $tipo, $mensaje) {
        $rpt=array(
            "resultado"=>$resultado,
            "respuesta"=>$tipo,
            "mensaje"=>$mensaje
        );
        return array($rpt);
    }
}