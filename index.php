<?php
    $title = "Realfood Market";
    include "./php/header.php";
?>

<main class="main__home-container">
    <!----------------------- SECTION 1 ----------------------->
    <section class="s1">
        <img src="./assets/images/img_home/pimientos_market.png" alt="Pimientos de colores" class="s1__img">
        <div class="s1__box-container">
            <h1 class="s1__h1 h1 bold">REALFOOD MARKET</h1>
            <a href="./product_list_page.php" class="s1__btn btn button">VER PRODUCTOS</a>
        </div>
    </section>
    <!----------------------- SECTION 2 ----------------------->
    <section class="s2">
        <div class="s2 box-container container">
            <h2 class="h2 bold s2 title">PRODUCTOS NUEVOS</h2>
            <div class="s2 box-content">
                <!-- Productos desde BD -->
            </div>
        </div>
    </section>
    <!----------------------- SECTION 3 ----------------------->
    <section class="s3">
        <div class="s3__box-container container">
            <img src="./assets/images/img_home/realfood_market.png" alt="Realfood Market" class="s3__img">
            <div class="s3__box-content">
                <h3 class="h3 bold">El cambio que estabas esperando</h3>
                <p class="text1">Todos el equipo Realfooding trabaja con una misión muy clara: combinar los mejores ingredientes con tecnología puntera para ofrecerte la mejor versión de los productos que más te gustan.</p>
            </div>
        </div>
    </section>
    <!----------------------- SECTION 4 ----------------------->
    <section class="s4">
        <div class="s4 box-container container">
            <h2 class="h2 bold s4 title">RECETAS</h2>
            <div class="s4 box-content">
                <!-- Recetas desde BD -->
            </div>
        </div>
    </section>
    <!----------------------- SECTION 5 ----------------------->
    <section class="s5">
        <div class="s5 box-container container">
            <h3 class="h3 bold">Los pilares de los productos Realfooding</h3>
            <div class="s5__box-content">
                <div class="s5__content-icon">
                    <img src="./assets/icons/icono_salud.svg" alt="Icono Salud" class="s5__icon-img">
                    <h6 class="h6 reg">Salud como valor prioritario</h6>
                </div>
                <div class="s5__content-icon">
                    <img src="./assets/icons/icono_sostenibilidad.svg" alt="Icono Sostenibilidad" class="s5__icon-img">
                    <h6 class="h6 reg">Sostenibilidad como reto social</h6>
                </div>
                <div class="s5__content-icon">
                    <img src="./assets/icons/icono_productores.svg" alt="Icono Productores" class="s5__icon-img">
                    <h6 class="h6 reg">Apoyo a productores de comida real</h6>
                </div>
                <div class="s5__content-icon">
                    <img src="./assets/icons/icono_innovacion.svg" alt="Icono Innovacion" class="s5__icon-img">
                    <h6 class="h6 reg">Innovación para transformar el sistema</h6>
                </div>
            </div>
        </div>
    </section>
</main>

<?php
    include "./php/footer.html";
?>

