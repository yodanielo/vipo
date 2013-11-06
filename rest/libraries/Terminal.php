<?php

/*
 * Si creaste este archivo, no te olvides de firmarlo
 */

/**
 * Description of Terminal
 *
 * @author Daniel Pomalaza
 */
class Terminal {
    function ipReal() {
        if (isset($_SERVER["HTTP_CLIENT_IP"]))
        {
            return $_SERVER["HTTP_CLIENT_IP"];
        }
        elseif (isset($_SERVER["HTTP_X_FORWARDED_FOR"]))
        {
            return $_SERVER["HTTP_X_FORWARDED_FOR"];
        }
        elseif (isset($_SERVER["HTTP_X_FORWARDED"]))
        {
            return $_SERVER["HTTP_X_FORWARDED"];
        }
        elseif (isset($_SERVER["HTTP_FORWARDED_FOR"]))
        {
            return $_SERVER["HTTP_FORWARDED_FOR"];
        }
        elseif (isset($_SERVER["HTTP_FORWARDED"]))
        {
            return $_SERVER["HTTP_FORWARDED"];
        }
        else
        {
            return $_SERVER["REMOTE_ADDR"];
        }
    }
    function usaProxy(){
        if(isset($_SERVER['HTTP_X_FORWARDED_FOR']) || isset($_SERVER["HTTP_VIA"]))
            return true;
        else
            return false;
    }
}
