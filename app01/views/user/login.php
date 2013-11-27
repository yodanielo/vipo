<?php
$appdata = $_SESSION[$params["appname"]]["appData"];
?>
<div id="wraplogin">
    <form id="frmLogin" action="#" method="post">
        <div class="alert alert-success" style="display:none;"></div>
        <div class="alert alert-danger" style="display:none;"></div>
        <div id="floatlogin">
            <div id="cuadrologin">
                <img src="<?= site_url("img/vipo-login-default-logo.png") ?>" id="logologin" alt="<?= $appdata->titulo ?>"/>
                <div id="logtitulo"><?= $appdata->titulo ?></div>
                <input type="text" class="form-control input-lg" id="txtusername" placeholder="Usuario" />
                <input type="password" class="form-control input-lg" id="txtpassword" placeholder="Contraseña" />
                <input type="submit" class="btn btn-primary btn-lg" id="btnlogin" />
                <a id="lnkforgot" href="<?=  site_url("user/recuperar-contrasena")?>">¿Olvidaste tu contraseña?</a>
                <?= $this->token->protectForm() ?>
            </div>
        </div>
    </form>
</div>
<script type="text/javascript">
    loadLogin();
</script>