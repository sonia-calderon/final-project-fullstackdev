<?php
    $title = "Realfood Market | Mi Cuenta";
    include "./php/header.php";
?>

<main class="main__container">
    <section class="myaccount box-container container">
        <h1 class="h1 bold">MI CUENTA</h1>
        <div class="myaccount box-content-container">
            <div class="myaccount box-content">
                <div class="myaccount box-subcontent">
                    <div class="myaccount resume-items">
                        <p class="h6 reg tablinks"  id="myAccountInfoClick">Información</p>
                    </div>
                    <div class="myaccount resume-items">
                        <p class="h6 reg tablinks" id="myAccountOrdersClick">Pedidos realizados</p>
                    </div>
                    <div class="myaccount resume-items">
                        <p class="h6 reg">Cerrar sesión</p>
                    </div>
                </div>
                <!-- Opción Información -->
                <div class="myaccount box-subcontent data tabcontent" id="myAccountInfo">
                    <p class="h5 bold">Sus datos personales</p>
                    <form action="">
                        <div class="myaccount form-data">
                            <label for="" class="text1">Nombre</label>
                            <input type="text" name="" id="" class="input">
                        </div>
                        <div class="myaccount form-data">
                            <label for="" class="text1">Apellidos</label>
                            <input type="text" name="" id="" class="input">
                        </div>
                        <div class="myaccount form-data">
                            <label for="" class="text1">Email</label>
                            <input type="email" name="" id="" class="input">
                        </div>
                        <div class="myaccount form-data">
                            <label for="" class="text1">Contraseña</label>
                            <input type="password" name="" id="" class="input">
                        </div>
                        <input type="submit" value="GUARDAR" class="button btn input">
                    </form>
                </div>
                <!-- Opción Pedidos Realizados -->
                <div class="myaccount box-subcontent orders tabcontent" id="myAccountOrders">
                    <p class="h5 bold">Pedidos Realizados</p>
                    <div class="myaccount box-subcontent-resume">
                        <div class="myaccount resume-order">
                            <p class="h6 reg">Resumen Pedido XXXXXX</p>
                            <div class="myaccount resume-items">
                                <p class="text1">Crema de Cacao</p>
                                <p class="text1">2.99€</p>
                            </div>
                            <div class="myaccount resume-items">
                                <p class="text1">Crema de Cacao</p>
                                <p class="text1">2.99€</p>
                            </div>
                            <div class="myaccount resume-total">
                                <p class="text1 bold">TOTAL</p>
                                <p class="text1 bold">2.99€</p>
                            </div>
                        </div>
                    </div>
                    <div class="myaccount box-subcontent-resume">
                        <div class="myaccount resume-order">
                            <p class="h6 reg">Resumen Pedido XXXXXX</p>
                            <div class="myaccount resume-items">
                                <p class="text1">Crema de Cacao</p>
                                <p class="text1">2.99€</p>
                            </div>
                            <div class="myaccount resume-items">
                                <p class="text1">Crema de Cacao</p>
                                <p class="text1">2.99€</p>
                            </div>
                            <div class="myaccount resume-total">
                                <p class="text1 bold">TOTAL</p>
                                <p class="text1 bold">2.99€</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>

<?php
    include "./php/footer.html";
?>