<?php
    $title = "Realfood Market | Crear Cuenta";
    include "./php/header.php";
?>

<main class="main__container">
    <section class="login box-container container">
        <h1 class="h1 bold">CREAR CUENTA</h1>
        <form class="login box-content">
            <div class="login login-data">
                <label for="registerName" class="text1">Nombre</label>
                <input type="text" name="registerName" id="registerName" class="input">
            </div>
            <div class="login login-data">
                <label for="registerSurname" class="text1">Apellidos</label>
                <input type="text" name="registerSurname" id="registerSurname" class="input">
            </div>
            <div class="login login-data">
                <label for="registerEmail" class="text1">Correo Electrónico</label>
                <input type="email" name="registerEmail" id="registerEmail" class="input">
            </div>
            <div class="login login-data">
                <label for="registerPass" class="text1">Contraseña</label>
                <input type="password" name="registerPass" id="registerPass" class="input">
            </div>
            <input type="submit" value="ENTRAR" class="button btn input">
        </form>
        <div class="login box-content">
            <p class="h6 reg text">¿Tienes una cuenta? <a href="./login.php">Inicia sesión</a></p>
        </div>              
    </section>
</main>

<?php
    include "./php/footer.html";
?>