<?php
    $title = "Realfood Market | Carrito";
    include "./php/header.php";
    
?>

<main class="main__container">
    <section class="cart box-container container">
        <h1 class="h1 bold">CARRITO</h1>
        <div class="cart box-content">
            <div class="cart box-subcontent-header">
                <div class="cart box-titles">
                    <span></span>
                    <div class="cart box-titles-text">
                        <p class="h6 bold">Producto</p>
                        <p class="h6 bold">Precio</p>
                    </div>
                    <span></span>
                </div>
            </div>
            <div class="cart box-subcontent-items">
            <!-- Productos desde BD -->
            </div>
            <div class="cart box-subcontent-total">
                <p class="h6 bold">Total (impuestos incl.)</p>
                <p class="h6 bold" id="totalCart"></p>
            </div>
            <div class="cart box-subcontent-button">
                <a href="" class="button btn" id="cartBtn">COMPRAR</a>
            </div>
        </div>
    </section>
</main>

<?php
    include "./php/footer.html";
?>