<?php
$appdata = $_SESSION[$params["appname"]]["appData"];
?>
<div id="wraplogin">
    <div id="floatlogin">
        <div id="cuadrologin">
            <form id="frmLogin" action="#" method="post">
                <img src="<?= site_url("img/vipo-login-default-logo.png") ?>" id="logologin" alt="<?=$appdata->titulo?>"/>
                <div id="logtitulo"><?= $appdata->titulo ?></div>
                <input type="text" class="form-control input-lg" id="txtusername" placeholder="Usuario" />
                <input type="password" class="form-control input-lg" id="txtpassword" placeholder="Contraseña" />
                <input type="submit" class="btn btn-primary btn-lg" id="btnlogin" />
                <input type="hidden" id="txtidduenio" value="<?= $appdata->idduenio ?>" />
                <a id="lnkforgot" href="#">¿Olvidaste tu contraseña?</a>
                <?=$this->token->protectForm()?>
            </form>
        </div>
    </div>
</div>