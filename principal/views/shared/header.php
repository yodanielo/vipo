<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://www.facebook.com/2008/fbml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title><?php echo ($params["pagetitle"] ? $params["pagetitle"] . " | " : "") . $params["sitename"]; ?></title>
        <meta name="Description" content="<?php echo $params["sitedescription"]; ?>" />
        <meta name="author" content="<?php echo $params["author"]; ?>" />
        <meta name="owner" content="<?php echo $params["owner"]; ?>" />
        <meta name="robots" content="index, follow" />
        <link rel="icon" href="" type="image/x-icon" />
        <link rel="stylesheet" type="text/css" href="<?= site_url("principal/paquetes/bootstrap/css/bootstrap.min.css") ?>" />
        <link rel="stylesheet" type="text/css" href="<?= site_url("principal/paquetes/jquery-ui/css/vipo-theme/jquery-ui-1.10.3.custom.min.css") ?>" />
        <?php
        if (count($params["css"]) > 0) {
            foreach ($params["css"] as $key => $sc) {
                if (substr($sc, 0, 7) == "http://" || substr($sc, 0, 8) == "https://")
                    echo '<link rel="stylesheet" type="text/css" href="' . $sc . '" />' . "\n";
                else
                    echo '<link rel="stylesheet" type="text/css" href="' . site_url('principal/css/' . $sc) . '" />' . "\n";
            }
        }
        ?>
        <link rel="stylesheet" type="text/css" href="<?= site_url("less/index/nav.less") ?>" />
        <script type="text/javascript">siteurl="<?= site_url() ?>";</script>
        <script type="text/javascript" src="<?= site_url("principal/paquetes/jquery-ui/js/jquery-ui-1.10.3.custom.min.js") ?>"></script>
        <?php
        if (count($params["scripts"]) > 0) {
            foreach ($params["scripts"] as $key => $sc) {
                if (substr($sc, 0, 7) == "http://" || substr($sc, 0, 8) == "https://")
                    echo '<script type="text/javascript" src="' . $sc . '"></script>' . "\n";
                else
                    echo '<script type="text/javascript" src="' . site_url('principal/js/' . $sc) . '"></script>' . "\n";
            }
        }
        ?>

        <script type="text/javascript" src="<?= site_url("principal/js/general.js") ?>"></script>
    </head>
    <body>
        <div class="wrapper" id="cuerpototal">
            <header class="navbar" id="navbar_principal">
                <div class="navbar-inner">
                    <a class="brand" href="#">Title</a>
                    <ul class="nav">
                        <li class="active"><a href="#">Home</a></li>
                        <li><a href="#">Link</a></li>
                        <li><a href="#">Link</a></li>
                    </ul>
                </div>
            </header>
            <div id="cuerpopag">

