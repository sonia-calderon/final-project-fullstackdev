////////////// HAMBURGER MENU
//declaración de variables relativas al menú hamburguesa
const hamburgerBtn = document.querySelector(".nav__icon-hamburger");
const header = document.querySelector(".header");
const headerContainer = document.querySelector(".header__container");
const headerLogo = document.querySelector(".header__logo");
const navContainer = document.querySelector(".nav__container");
const navText = document.querySelector(".nav__text");
const navIcons = document.querySelector(".nav__icons");
const navIconClose = document.querySelector(".nav__icon-close");
const footer = document.querySelector(".footer");
const main = document.querySelector("main");

// comportamiento cuando se hace click en el menú hamburguesa
hamburgerBtn.addEventListener("click", () => {
    header.classList.toggle("nav__open");
    headerContainer.classList.toggle("nav__open");
    headerLogo.classList.toggle("nav__close");
    navContainer.classList.toggle("nav__open");
    navText.classList.toggle("nav__open");
    navIcons.classList.toggle("nav__close");
    navIconClose.classList.toggle("nav__open");
    footer.classList.toggle("nav__close");
    main.classList.toggle("nav__close");
})

////////////// DROP-DOWN LOGIN CHECKOUT
// declaración de variables relativas al desplegable de login del checkout
const loginDropDownClick = document.querySelector("#checkoutLoginDropdownClick");
const loginDropDown = document.querySelector("#checkoutLoginDropdown");

// comportamiento drop-down checkout
if(loginDropDownClick){
    loginDropDownClick.addEventListener("click", () => {
        loginDropDown.classList.toggle("dropdown");
    });
}

////////////// MY ACCOUNT TABS
// declaración de variables relativas a la página de mi cuenta
const myAccountInfoClick = document.querySelector("#myAccountInfoClick");
const myAccountOrdersClick = document.querySelector("#myAccountOrdersClick");
const myAccountInfo = document.querySelector("#myAccountInfo");
const myAccountOrders = document.querySelector("#myAccountOrders");

// método para realizar el comportamiento de los tabs, cuando se abre un elemento se cierra el otro
function openTab(elementOpen, elementClose){
  elementOpen.style.display = "block";
  elementClose.style.display = "none";
}

// ejecutar el método para ver la opción de ver la información de la cuenta
if(myAccountInfoClick){
  myAccountInfoClick.addEventListener("click", function(){
    openTab(myAccountInfo, myAccountOrders)
  });
}

// ejecutar el método para ver la opción de ver la información del pedido
if(myAccountOrdersClick){
  myAccountOrdersClick.addEventListener("click", function(){
    openTab(myAccountOrders, myAccountInfo)
  });
}

////////////// SEARCH BAR
// declaración de variables relativas al buscador
const myModal = document.querySelector("#myModal");
const closeModal = document.querySelector("#close");
const searchBtn = document.querySelector(".search");

// comportamiento para que se abra la ventana modal al hacer click en el icono de buscar
if(searchBtn){
  searchBtn.addEventListener("click", () => {
    myModal.style.display = "block";
  })
}

// comportamiento para cerrar la ventana modal al hacer click en el icono de cerrar
if(closeModal){
  closeModal.addEventListener("click", () => {
    myModal.style.display = "none";
  })
}