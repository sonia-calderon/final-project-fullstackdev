<?php
    $title = "Realfood Market | Checkout";
    include "./php/header.php";
?>

<main class="main__container">
    <section class="checkout box-container container">
        <h1 class="h1 bold">CHECKOUT</h1>
        <div class="checkout box-content-container">
            <div class="checkout box-content">
                <div class="checkout box-subcontent login">
                    <!-- Desplegable para iniciar sesión -->
                    <p class="h6 reg">¿Ya tiene cuenta? <a href="#" id="checkoutLoginDropdownClick">Inicie sesión</a></p>
                    <form id="checkoutLoginDropdown">
                        <input type="email" name="" id="loginEmailCheckout" placeholder="Email" class="input">
                        <input type="password" name="" id="loginPassCheckout" placeholder="Contraseña" class="input">
                        <input type="submit" value="INICIAR SESIÓN" class="button btn input">
                    </form>
                </div>
                <div class="checkout box-subcontent data">
                    <p class="h3 bold">Datos de Envío</p>
                    <!-- Formulario -->
                    <form action="">
                        <div class="checkout checkout-data">
                            <label for="checkoutName" class="text1">Nombre</label>
                            <input type="text" name="checkoutName" id="checkoutName" class="input">
                        </div>
                        <div class="checkout checkout-data">
                            <label for="checkoutSurname" class="text1">Apellidos</label>
                            <input type="text" name="checkoutSurname" id="checkoutSurname" class="input">
                        </div>
                        <div class="checkout checkout-data">
                            <label for="checkoutEmail" class="text1">Email</label>
                            <input type="email" name="checkoutEmail" id="checkoutEmail" class="input">
                        </div>
                        <div class="checkout checkout-data">
                            <label for="checkoutAddress" class="text1">Dirección</label>
                            <input type="text" name="checkoutAddress" id="checkoutAddress" class="input">
                        </div>
                        <div class="checkout checkout-data">
                            <label for="checkoutCity" class="text1">Ciudad</label>
                            <input type="text" name="checkoutCity" id="checkoutCity" class="input">
                        </div>
                        <div class="checkout checkout-data">
                            <label for="checkoutShipping" class="text1">Método Envío</label>
                            <div class="checkout options-radio">
                                <div class="checkout input-radio">
                                    <input type="radio" name="checkoutStandardShipping" id="checkoutStandardShipping">
                                    <label for="checkoutStandardShipping" class="text1">Envío Estándar</label>
                                </div>
                                <div class="checkout input-radio">
                                    <input type="radio" name="checkoutFastShipping" id="checkoutFastShipping">
                                    <label for="checkoutFastShipping" class="text1">Envío Rápido</label>
                                </div>
                            </div>
                        </div>
                        <input type="submit" value="COMPRAR" class="button btn input">
                    </form>
                </div>
            </div>
            <div class="checkout box-content order-resume-box">
                <p class="h3 bold">Resumen del pedido</p>
                <div class="checkout box-subcontent resume">
                    <!-- Resumen de compra desde BD -->
                </div>
            </div>
        </div>
    </section>
</main>

<?php
    include "./php/footer.html";
?>