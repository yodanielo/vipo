<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://www.facebook.com/2008/fbml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title><?php echo ($params["pagetitle"] ? $params["pagetitle"] . " | " : "") . $params["sitename"]; ?></title>
        <meta name="Description" content="<?php echo $params["sitedescription"]; ?>" />
        <meta name="author" content="<?php echo $params["author"]; ?>" />
        <meta name="owner" content="<?php echo $params["owner"]; ?>" />
        <meta name="robots" content="index, follow" />

        <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

                <link rel="icon" href="" type="image/x-icon" />

                <link href='http://fonts.googleapis.com/css?family=Inconsolata' rel='stylesheet' type='text/css'>
                    <link rel="stylesheet" type="text/css" href="<?= site_url("paquetes/bootstrap/css/bootstrap.min.css") ?>" />
                    <link rel="stylesheet" type="text/css" href="<?= site_url("paquetes/jquery-ui/css/vipo-theme/jquery-ui-1.10.3.custom.min.css") ?>" />
                    <?php
                    if (isset($params["css"]))
                        if (count($params["css"]) > 0) {
                            foreach ($params["css"] as $key => $sc) {
                                if (substr($sc, 0, 7) == "http://" || substr($sc, 0, 8) == "https://")
                                    echo '<link rel="stylesheet" type="text/css" href="' . $sc . '" />' . "\n";
                                else
                                    echo '<link rel="stylesheet" type="text/css" href="' . site_url('css/' . $sc) . '" />' . "\n";
                            }
                        }
                    ?>
                    <link rel="stylesheet" type="text/css" href="<?= site_url("less/index/nav.less") ?>" />
                    <script type="text/javascript">siteurl = "<?= site_url() ?>";</script>
                    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
                    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
                    <script type="text/javascript" src="<?= site_url("paquetes/bootstrap/js/bootstrap.min.js") ?>"></script>
                    <?php
                    if (isset($params["scripts"]))
                        if (count($params["scripts"]) > 0) {
                            foreach ($params["scripts"] as $key => $sc) {
                                if (substr($sc, 0, 7) == "http://" || substr($sc, 0, 8) == "https://")
                                    echo '<script type="text/javascript" src="' . $sc . '"></script>' . "\n";
                                else
                                    echo '<script type="text/javascript" src="' . site_url('js/' . $sc) . '"></script>' . "\n";
                            }
                        }
                    ?>

                    <script type="text/javascript" src="<?= site_url("js/general.js") ?>"></script>
                    </head>
                    <body>
                        <div id="cuerpototal">
                            <header>
                                <section id="menuvipo">
                                    <div class="container">
                                        <div class="row">
                                            <div id="col1welcome" class="col-md-4">
                                                <div id="sistemanombre">VIPO Hotel Management</div>
                                                <div id="usuario">Bienvenido <a href="<?= site_url("user/profile") ?>"><?= $params["username"] ?></a>
                                                </div>
                                            </div>
                                            <div id="col2menu" class="col-md-8">
                                                <nav class="navbar navbar-default" role="navigation">
                                                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                                        <ul class="nav navbar-nav navbar-right">
                                                            <li><a href="<?= site_url("user/profile") ?>">Mi cuenta</a></li>
                                                            <li class="dropdown">
                                                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">Mis Aplicaciones<b class="caret"></b></a>
                                                                <ul class="dropdown-menu">
                                                                    <li><a target="_blank" href="<?= site_url("app/hotel-choque-y-fuga") ?>">Hotel Choque y Fuga</a></li>
                                                                    <li><a target="_blank" href="<?= site_url("app/tienda-choque-y-fuga") ?>">Tienda Choque y Fuga</a></li>
                                                                    <li><a target="_blank" href="<?= site_url("app/servicios-choque-y-fuga") ?>">Servicios Choque y Fuga</a></li>
                                                                    <li class="divider"></li>
                                                                    <li><a target="_blank" href="<?= site_url("vipo/catalogo") ?>">Nueva Aplicacion</a></li>
                                                                </ul>
                                                            </li>
                                                            <li><a>Ayuda</a></li>
                                                            <li><a>Salir</a></li>
                                                        </ul>
                                                    </div>
                                                </nav>


                                            </div>

                                        </div>
                                    </div>
                                </section>
                                <section id="menuapp">
                                    <div class="container"></div>
                                </section>
                            </header>

