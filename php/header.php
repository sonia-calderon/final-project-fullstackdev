<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Realfood Market. Productos Realfooding Online.">
	<meta name="author" content="Sonia Calderón Ruiz">
    <meta name="robots" content="noindex, nofollow">
    <title><?php echo $title; ?></title>
    <link rel="stylesheet" href="./css/normalize.css">
    <link rel="stylesheet" href="./css/style.css">
    <link rel="icon" href="./assets/images/favicon/realfooding_favicon_32x32.png" type="image/x-icon">
</head>
<body id="body">
    <!--------------- HEADER --------------->
    <header class="header">
        <div class="header__container container">
            <a href="./index.php"><img src="./assets/images/logo/realfooding_logo_green.png" alt="Realfooding Logo" class="header__logo"></a>
            <!--------------- NAV --------------->
            <nav class="nav">
               <ul class="nav__container">
                   <div class="nav__text">
                        <li><a href="./product_list_page.php" class="text1">PRODUCTOS</a></li>
                        <li><a href="./recipe_list_page.php" class="text1">RECETAS</a></li>
                   </div>
                   <div class="nav__icons">
                       <li><a href="#" class="search"><img src="./assets/icons/icono_buscar.svg" alt="Icono Buscar"></a></li>
                       <li><a href="./login.php"><img src="./assets/icons/icono_usuario.svg" alt="Icono Usuario"></a></li>
                       <li><a href="./cart.php"><img src="./assets/icons/icono_carrito.svg" alt="Icono Carrito"></a></li>
                       <li><a href="#"><img src="./assets/icons/icono_hamburguesa.svg" alt="Icono Hamburguesa" class="nav__icon-hamburger"></a></li>
                   </div>
                   <a href="" class="nav__icon-close"><img src="./assets/icons/icono_cerrar.svg" alt="Icono Cerrar"></a>
               </ul>
            </nav>
        </div>
    </header>
    <!--------------- BUSCADOR --------------->
    <div id="myModal">
        <img src="./assets/icons/icono_cerrar.svg" alt="Icono Cerrar" id="close">
        <div id="modalInput">
            <input type="text" id="inputSearch" value="" placeholder="Buscar productos">
            <input type="submit" value="BUSCAR" class="button btn" id="inputSearchSubmit">
        </div>
    </div>
 