<?php
    $title = "Realfood Market | Iniciar Sesión";
    include "./php/header.php";
?>

<main class="main__container">
    <section class="login box-container container">
        <h1 class="h1 bold">INICIAR SESIÓN</h1>
        <form class="login box-content">
            <div class="login login-data">
                <label for="loginEmail" class="text1">Correo Electrónico</label>
                <input type="email" name="loginEmail" id="loginEmail" class="input">
            </div>
            <div class="login login-data">
                <label for="loginPass" class="text1">Contraseña</label>
                <input type="password" name="loginPass" id="loginPass" class="input">
            </div>
            <input type="submit" value="ENTRAR" class="button btn input">
        </form>
        <div class="login box-content">
            <p class="h6 reg text">¿No tienes una cuenta? <a href="./create_account.php">Regístrate</a></p>
        </div>              
    </section>
</main>

<?php
    include "./php/footer.html";
?>