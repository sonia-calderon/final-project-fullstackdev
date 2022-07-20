// variables relativas al local storage y carrito
const myLocalStorage = window.localStorage;
let cartLocalStorage = JSON.parse(myLocalStorage.getItem('cart'));
let cart = [];
let cartArray = [];
const divCartBoxSubcontentItems = document.querySelector(".cart.box-subcontent-items")
const divCartBoxSubcontentTotal = document.querySelector(".cart.box-subcontent-total");
const divCartBoxSubcontentButton = document.querySelector(".cart.box-subcontent-button");
const totalCart = document.querySelector("#totalCart");
const cartBtn = document.querySelector("#cartBtn");

// variables relativas a los productos y manejo del DOM
const products = [];
const divS2BoxContent = document.querySelector(".s2.box-content");
const divPlpBoxContent = document.querySelector(".plp.box-content");
const sectionPdpBoxContainerContainer = document.querySelector(".pdp.box-container.container");
const divPlpBoxContentResults = document.querySelector(".plp.box-content.results");

// variables relativas a las recetas y manejo del DOM
const recipes = [];
const recipesLabel = [];
const divS4BoxContent = document.querySelector(".s4.box-content");
const divRlpBoxContent = document.querySelector(".rlp.box-content");
const sectionRdpBoxContainerContainer = document.querySelector(".rdp.box-container.container");
const divRdpBoxSubContentLabels = document.querySelector(".rdp.box-subcontent.labels");

// variables relativas al checkout
const divCheckoutBoxSubcontent = document.querySelector(".checkout.box-subcontent.resume");
const totalCheckout = document.querySelector("#totalCheckout");

// extracción de parámetros de la url
const urlSearchParams = new URLSearchParams(window.location.search);
const urlId = urlSearchParams.get("id");
const urlSearch = urlSearchParams.get("search");

// obtener la información del local storage
getCartLocalStorage();

// petición de datos de producto al archivo controller
function getDataFromControllerProduct (){ 
    fetch("./php/controllerProduct.php")
    .then((response) =>  response.json())
    .then((data)=>{
        for(const element of data){
            const productsS2 = products.slice(0, 3);
            products.push({
                id: element.idProducto,
                name: element.nombre,
                price: element.precio,
                image: element.imagen,
                description: element.descripcion,
                ingredients: element.ingredientes,
                size: element.medidas,
                conservation: element.conservacion,
                nutritionalInfo: element.infoNutricional
            });

            if(divS2BoxContent){
                paintProductS2(productsS2); 
            }

            if(divPlpBoxContent && !divPlpBoxContentResults){
                paintProductPLP(products);    
            }

            if(divPlpBoxContentResults){
                products.forEach((productId) => {
                    const productFilter = products.filter((product) => { 
                        return product.name.toLowerCase().includes(urlSearch.toLowerCase()) 
                    });

                    if(productId.name.toLowerCase().includes(urlSearch.toLowerCase())){
                        paintProductResults(productFilter)
                    } else {
                        //pintar no se encontraron resultados (pdte)
                    }
                })
            }

            if(sectionPdpBoxContainerContainer){
                products.forEach(function (productId){
                    if(urlId === productId.id){
                        paintProductPDP(productId);
                    }
                })
            }

            if(divCartBoxSubcontentItems){
                paintCart(cartLocalStorage);
                totalCart.innerHTML = calculateTotal();

                cartBtn.addEventListener("click", (e) => {
                    e.preventDefault();
                    window.location.href = "checkout.php";
                })
            }

            if(divCheckoutBoxSubcontent){
                paintCheckoutProducts(cartLocalStorage);
            }    
        }
        if(cartLocalStorage !== null){
            cartArray = cartLocalStorage;
        }
    })
}

// variables relativas al buscador
const inputSearchBtn = document.querySelector("#inputSearchSubmit");
const input = document.querySelector("#inputSearch");

// comportamiento del evento click sobre el input de buscar
inputSearchBtn.addEventListener("click", handleClickSearch);
input.addEventListener("keypress", (ev) => {
    if (ev.key === "Enter") {
        ev.preventDefault();
        inputSearchBtn.click();
      }
});

// función manejadora de la búsqueda de resultados
function handleClickSearch (ev) {
    ev.preventDefault();
    const inputValue = input.value;
    const productFilter = products.filter((product) => { 
        return product.name.toLowerCase().includes(inputValue.toLowerCase()) 
    });
    window.location.href = "results.php?search=" + inputValue;
}

// petición de datos de recetas al archivo controller
function getDataFromControllerRecipe () { 
    fetch("./php/controllerRecipe.php")
    .then((response) =>  response.json())
    .then((data)=>{
        for(const element of data){
            const recipesS4 = recipes.slice(0, 3);
            recipes.push({
                id: element.idReceta,
                title: element.titulo,
                image: element.imagen,
                ingredients: element.ingredientes,
                instructions: element.instrucciones
            });
            
            if(divS4BoxContent){
                paintRecipeS2(recipesS4);
            }

            if(divRlpBoxContent){
                paintRecipeRlp(recipes);
            }

            if(sectionRdpBoxContainerContainer){
                recipes.forEach(function (recipeId){
                    if(urlId === recipeId.id){
                        paintRecipeRdp(recipeId);
                    }
                })
            }   
        }
    })
}

// petición de datos de etiquetas de recetas al archivo controller
function getDataFromControllerRecipeLabel () { 
    fetch("./php/controllerRecipeLabel.php")
    .then((response) =>  response.json())
    .then((data)=>{
        for(const element of data){
            recipesLabel.push({
                idRecipe: element.fkReceta,
                label: element.etiqueta
            });
        }

        if(divRdpBoxSubContentLabels){
            recipesLabel.forEach(function (recipeId){
                if(urlId === recipeId.idRecipe){
                    paintRecipeRdpLabel(recipeId.label);
                }
            })
        }
    })
}

// método para pintar toda la estructura de productos de la home (S2)
function paintProductS2(listado){
    divS2BoxContent.innerHTML = "";
    listado.forEach((item, i) => {
        const divS2BoxProduct = document.createElement("div");
        divS2BoxProduct.classList.add("s2", "box-product");
        divS2BoxProduct.setAttribute("id", i);
        divS2BoxContent.appendChild(divS2BoxProduct);

        const imgS2ProductImg = document.createElement("img");
        imgS2ProductImg.classList.add("s2", "product-img");
        imgS2ProductImg.setAttribute("alt", item.name);
        imgS2ProductImg.src = "./assets/images/img_productos/" + item.image;
        divS2BoxProduct.appendChild(imgS2ProductImg);

        const divS2BoxSubcontent = document.createElement("div");
        divS2BoxSubcontent.classList.add("s2", "box-subcontent");
        divS2BoxProduct.appendChild(divS2BoxSubcontent);

        const h5S2 = document.createElement("h5");
        const h5S2Text = document.createTextNode(item.name);
        h5S2.classList.add("s2", "h5", "bold");
        divS2BoxSubcontent.appendChild(h5S2);
        h5S2.appendChild(h5S2Text);

        const h6S2 = document.createElement("h6");
        const h6S2Text = document.createTextNode(item.price + "€");
        h6S2.classList.add("s2", "h6", "reg");
        divS2BoxSubcontent.appendChild(h6S2);
        h6S2.appendChild(h6S2Text);

        const aS2 = document.createElement("a");
        const aS2Text = document.createTextNode("COMPRAR AHORA");
        aS2.classList.add("button", "btn");
        aS2.setAttribute("href", "product_detail.php?id=" + item.id + "&name=" + item.name);
        divS2BoxSubcontent.appendChild(aS2);
        aS2.appendChild(aS2Text);
    });
}

// método para pintar toda la estructura de productos en la página de listado de productos
function paintProductPLP(listado){
    divPlpBoxContent.innerHTML = "";
    listado.forEach((item, i) => {
        const divPlpBoxProduct = document.createElement("div");
        divPlpBoxProduct.classList.add("plp", "box-product");
        divPlpBoxProduct.setAttribute("id", i);
        divPlpBoxContent.appendChild(divPlpBoxProduct);

        const imgPlpProductImg = document.createElement("img");
        imgPlpProductImg.classList.add("plp", "product-img");
        imgPlpProductImg.setAttribute("alt", item.name);
        imgPlpProductImg.src = "./assets/images/img_productos/" + item.image;
        divPlpBoxProduct.appendChild(imgPlpProductImg);

        const divPlpBoxSubcontent = document.createElement("div");
        divPlpBoxSubcontent.classList.add("plp", "box-subcontent");
        divPlpBoxProduct.appendChild(divPlpBoxSubcontent);

        const h5Plp = document.createElement("h5");
        const h5PlpText = document.createTextNode(item.name);
        h5Plp.classList.add("plp", "h5", "bold");
        divPlpBoxSubcontent.appendChild(h5Plp);
        h5Plp.appendChild(h5PlpText);

        const h6Plp = document.createElement("h6");
        const h6PlpText = document.createTextNode(item.price + "€");
        h6Plp.classList.add("plp", "h6", "reg");
        divPlpBoxSubcontent.appendChild(h6Plp);
        h6Plp.appendChild(h6PlpText);

        const aPlp = document.createElement("a");
        const aPlpText = document.createTextNode("COMPRAR AHORA");
        aPlp.classList.add("button", "btn");
        aPlp.setAttribute("href", "product_detail.php?id=" + item.id + "&name=" + item.name);
        
        divPlpBoxSubcontent.appendChild(aPlp);
        aPlp.appendChild(aPlpText);
    });
}

// método para pintar toda la estructura de productos en la página de resultados
function paintProductResults(listado){
    divPlpBoxContentResults.innerHTML = "";
    listado.forEach((item, i) => {
        const divPlpBoxProduct = document.createElement("div");
        divPlpBoxProduct.classList.add("plp", "box-product");
        divPlpBoxProduct.setAttribute("id", i);
        divPlpBoxContentResults.appendChild(divPlpBoxProduct);

        const imgPlpProductImg = document.createElement("img");
        imgPlpProductImg.classList.add("plp", "product-img");
        imgPlpProductImg.setAttribute("alt", item.name);
        imgPlpProductImg.src = "./assets/images/img_productos/" + item.image;
        divPlpBoxProduct.appendChild(imgPlpProductImg);

        const divPlpBoxSubcontent = document.createElement("div");
        divPlpBoxSubcontent.classList.add("plp", "box-subcontent");
        divPlpBoxProduct.appendChild(divPlpBoxSubcontent);

        const h5Plp = document.createElement("h5");
        const h5PlpText = document.createTextNode(item.name);
        h5Plp.classList.add("plp", "h5", "bold");
        divPlpBoxSubcontent.appendChild(h5Plp);
        h5Plp.appendChild(h5PlpText);

        const h6Plp = document.createElement("h6");
        const h6PlpText = document.createTextNode(item.price + "€");
        h6Plp.classList.add("plp", "h6", "reg");
        divPlpBoxSubcontent.appendChild(h6Plp);
        h6Plp.appendChild(h6PlpText);

        const aPlp = document.createElement("a");
        const aPlpText = document.createTextNode("COMPRAR AHORA");
        aPlp.classList.add("button", "btn");
        aPlp.setAttribute("href", "product_detail.php?id=" + item.id + "&name=" + item.name);
        divPlpBoxSubcontent.appendChild(aPlp);
        aPlp.appendChild(aPlpText);
    })
}

// método para pintar toda la estructura del detalle de producto individual
function paintProductPDP(product){
    sectionPdpBoxContainerContainer.innerHTML = "";

    const divPdpBoxContent = document.createElement("div");
    divPdpBoxContent.classList.add("pdp", "box-content");
    sectionPdpBoxContainerContainer.appendChild(divPdpBoxContent);

    const imgPdpProductImg = document.createElement("img");
    imgPdpProductImg.classList.add("pdp", "product-img");
    imgPdpProductImg.setAttribute("alt", product.name);
    imgPdpProductImg.src = "./assets/images/img_productos/" + product.image;
    divPdpBoxContent.appendChild(imgPdpProductImg);

    const divPdpBoxSubcontent = document.createElement("div");
    divPdpBoxSubcontent.classList.add("pdp", "box-subcontent");
    divPdpBoxContent.appendChild(divPdpBoxSubcontent);

    const h1Pdp = document.createElement("h1");
    const h1PdpText = document.createTextNode(product.name);
    h1Pdp.classList.add("pdp", "h1", "bold");
    divPdpBoxSubcontent.appendChild(h1Pdp);
    h1Pdp.appendChild(h1PdpText);

    const h6PdpDescription = document.createElement("h6");
    const h6PdpTextDescription = document.createTextNode(product.description);
    h6PdpDescription.classList.add("pdp", "h6", "reg");
    divPdpBoxSubcontent.appendChild(h6PdpDescription);
    h6PdpDescription.appendChild(h6PdpTextDescription);

    const h6PdpPrice = document.createElement("h6");
    const h6PdpTextPrice = document.createTextNode(product.price + "€");
    h6PdpPrice.classList.add("pdp", "h6", "reg");
    divPdpBoxSubcontent.appendChild(h6PdpPrice);
    h6PdpPrice.appendChild(h6PdpTextPrice);

    const aPdp = document.createElement("a");
    const aPdpText = document.createTextNode("AÑADIR CESTA");
    aPdp.classList.add("button", "btn");
    
    aPdp.setAttribute("id", product.id);
    // comportamiento de añadir al carrito
    aPdp.addEventListener("click", addProductToCart);
    aPdp.setAttribute("href", "#");
    divPdpBoxSubcontent.appendChild(aPdp);
    aPdp.appendChild(aPdpText);

    const divPdpBoxContentInfo = document.createElement("div");
    divPdpBoxContentInfo.classList.add("pdp", "box-content", "info");
    sectionPdpBoxContainerContainer.appendChild(divPdpBoxContentInfo);

    const divPdpBoxSubContentInfo1 = document.createElement("div");
    divPdpBoxSubContentInfo1.classList.add("pdp", "box-subcontent", "info");
    divPdpBoxContentInfo.appendChild(divPdpBoxSubContentInfo1);

    const h6PdpIngTitle = document.createElement("h6");
    const h6PdpIngTitleText = document.createTextNode("INGREDIENTES");
    h6PdpIngTitle.classList.add("h6");
    divPdpBoxSubContentInfo1.appendChild(h6PdpIngTitle);
    h6PdpIngTitle.appendChild(h6PdpIngTitleText);

    const h6PdpIngDesc = document.createElement("h6");
    const h6PdpIngDescText = document.createTextNode(product.ingredients);
    h6PdpIngDesc.classList.add("h6", "reg", "text");
    divPdpBoxSubContentInfo1.appendChild(h6PdpIngDesc);
    h6PdpIngDesc.appendChild(h6PdpIngDescText);


    const divPdpBoxSubContentInfo2 = document.createElement("div");
    divPdpBoxSubContentInfo2.classList.add("pdp", "box-subcontent", "info");
    divPdpBoxContentInfo.appendChild(divPdpBoxSubContentInfo2);

    const h6PdpConsTitle = document.createElement("h6");
    const h6PdpConsTitleText = document.createTextNode("CONSERVACIÓN");
    h6PdpConsTitle.classList.add("h6");
    divPdpBoxSubContentInfo2.appendChild(h6PdpConsTitle);
    h6PdpConsTitle.appendChild(h6PdpConsTitleText);

    const h6PdpConsDesc = document.createElement("h6");
    const h6PdpConsDescText = document.createTextNode(product.conservation);
    h6PdpConsDesc.classList.add("h6", "reg", "text");
    divPdpBoxSubContentInfo2.appendChild(h6PdpConsDesc);
    h6PdpConsDesc.appendChild(h6PdpConsDescText);

    const divPdpBoxSubContentInfo3 = document.createElement("div");
    divPdpBoxSubContentInfo3.classList.add("pdp", "box-subcontent", "info");
    divPdpBoxContentInfo.appendChild(divPdpBoxSubContentInfo3);

    const h6PdpMedTitle = document.createElement("h6");
    const h6PdpMedTitleText = document.createTextNode("MEDIDAS");
    h6PdpMedTitle.classList.add("h6", "text");
    divPdpBoxSubContentInfo3.appendChild(h6PdpMedTitle);
    h6PdpMedTitle.appendChild(h6PdpMedTitleText);

    const h6PdpMedDesc = document.createElement("h6");
    const h6PdpConsMedText = document.createTextNode(product.size);
    h6PdpMedDesc.classList.add("h6", "reg", "text");
    divPdpBoxSubContentInfo3.appendChild(h6PdpMedDesc);
    h6PdpMedDesc.appendChild(h6PdpConsMedText);

    const divPdpBoxSubContentInfo4 = document.createElement("div");
    divPdpBoxSubContentInfo4.classList.add("pdp", "box-subcontent", "info");
    divPdpBoxContentInfo.appendChild(divPdpBoxSubContentInfo4);

    const h6PdpInfoTitle = document.createElement("h6");
    const h6PdpInfoTitleText = document.createTextNode("INFORMACIÓN NUTRICIONAL");
    h6PdpInfoTitle.classList.add("h6");
    divPdpBoxSubContentInfo4.appendChild(h6PdpInfoTitle);
    h6PdpInfoTitle.appendChild(h6PdpInfoTitleText);

    const ulPdp = document.createElement("ul");
    divPdpBoxSubContentInfo4.appendChild(ulPdp);

    const li = document.createElement("li");
    const liText = document.createTextNode(product.nutritionalInfo);
    li.classList.add("h6", "reg", "text");
    ulPdp.appendChild(li);
    li.appendChild(liText);
}

// método para añadir el producto al carrito
function addProductToCart(event) {
    event.preventDefault();
    cart.push(event.target.getAttribute('id'));
    setCartLocalStorage();
}

// obtener la información del local storage
getCartLocalStorage();

// método para establecer un array en el local storage con los productos
function setCartLocalStorage () {
    products.forEach(function (productId){
        for(item of cart){
            if(item === productId.id){
                cartArray.push(productId);
                myLocalStorage.setItem('cart', JSON.stringify(cartArray));
            }
        }
    })
}

// método para cargar la información en el local storage
function getCartLocalStorage () {
    if (myLocalStorage.getItem('cart') !== null) {
        cart = JSON.parse(myLocalStorage.getItem('cart'));
    }
}

// método para calcular el total del carrito y checkout
function calculateTotal() {
    let sumTotal = cart.reduce((acumulador, actual) => parseFloat(acumulador) + parseFloat(actual.price), 0);
    roundTotal = sumTotal.toFixed(2);
    return roundTotal + "€";   
}

// método para eliminar un producto del carrito
function deleteCartItem(event) {
    const id = event.target.id;
    cartLocalStorage = cartLocalStorage.filter((cartId) => {
        return cartId.id !== id;
    })
    localStorage.setItem('cart', JSON.stringify(cartLocalStorage));
    paintCart(cartLocalStorage);
}

// método para pintar toda la estructura de recetas de la home (S2)
function paintRecipeS2(listado){
    divS4BoxContent.innerHTML = "";
    listado.forEach((item, i) => {
        const divS4BoxRecipes = document.createElement("div");
        divS4BoxRecipes.classList.add("s4", "box-recipes");
        divS4BoxRecipes.setAttribute("id", i);
        divS4BoxContent.appendChild(divS4BoxRecipes);

        const aS4Img = document.createElement("a");
        aS4Img.setAttribute("href", "recipe_detail.php?id=" + item.id + "&name=" + item.title);
        divS4BoxRecipes.appendChild(aS4Img);

        const imgS4RecipeImg = document.createElement("img");
        imgS4RecipeImg.classList.add("s4", "recipe-img");
        imgS4RecipeImg.setAttribute("alt", item.title);
        imgS4RecipeImg.src = "./assets/images/img_recetas/" + item.image + ".jpg";
        aS4Img.appendChild(imgS4RecipeImg);

        const divS4BoxSubcontent = document.createElement("div");
        divS4BoxSubcontent.classList.add("s4", "box-subcontent");
        divS4BoxRecipes.appendChild(divS4BoxSubcontent);

        const aS4 = document.createElement("a");
        aS4.setAttribute("href", "recipe_detail.php?id=" + item.id + "&name=" + item.title);
        divS4BoxSubcontent.appendChild(aS4);

        const h5S4 = document.createElement("h5");
        const h5S4Text = document.createTextNode(item.title);
        h5S4.classList.add("s4", "h5", "bold");
        aS4.appendChild(h5S4);
        h5S4.appendChild(h5S4Text);
    });
}

// método para pintar toda la estructura de recetas de la página de listado de recetas
function paintRecipeRlp(listado){
    divRlpBoxContent.innerHTML = "";
    listado.forEach((item, i) => {
        const divRlpBoxRecipes = document.createElement("div");
        divRlpBoxRecipes.classList.add("rlp", "box-recipes");
        divRlpBoxRecipes.setAttribute("id", i);
        divRlpBoxContent.appendChild(divRlpBoxRecipes);

        const aRlpImg = document.createElement("a");
        aRlpImg.setAttribute("href", "recipe_detail.php?id=" + item.id + "&name=" + item.title);
        divRlpBoxRecipes.appendChild(aRlpImg);

        const imgRlpRecipeImg = document.createElement("img");
        imgRlpRecipeImg.classList.add("rlp", "recipe-img");
        imgRlpRecipeImg.setAttribute("alt", item.title);
        imgRlpRecipeImg.src = "./assets/images/img_recetas/" + item.image + ".jpg";
        aRlpImg.appendChild(imgRlpRecipeImg);

        const divRlpBoxSubcontent = document.createElement("div");
        divRlpBoxSubcontent.classList.add("rlp", "box-subcontent");
        divRlpBoxRecipes.appendChild(divRlpBoxSubcontent);

        const aRlp = document.createElement("a");
        aRlp.setAttribute("href", "recipe_detail.php?id=" + item.id + "&name=" + item.title);
        divRlpBoxSubcontent.appendChild(aRlp);

        const h5Rlp = document.createElement("h5");
        const h5RlpText = document.createTextNode(item.title);
        h5Rlp.classList.add("s4", "h5", "bold");
        aRlp.appendChild(h5Rlp);
        h5Rlp.appendChild(h5RlpText);
    });
}

// método para pintar toda la estructura del detalle de la receta individual
function paintRecipeRdp(receta){
    sectionRdpBoxContainerContainer.innerHTML = "";

    const divRdpBoxRecipes = document.createElement("div");
    divRdpBoxRecipes.classList.add("rdp", "box-content");
    divRdpBoxRecipes.setAttribute("id", receta.id);
    sectionRdpBoxContainerContainer.appendChild(divRdpBoxRecipes);

    const h1Rdp = document.createElement("h1");
    const h1RdpText = document.createTextNode(receta.title);
    divRdpBoxRecipes.appendChild(h1Rdp);
    h1Rdp.appendChild(h1RdpText);

    const divRdpBoxRecipeImg = document.createElement("div");
    divRdpBoxRecipeImg.classList.add("rdp", "box-recipe-img");
    divRdpBoxRecipes.appendChild(divRdpBoxRecipeImg);

    const img1 = document.createElement("img");
    img1.classList.add("rdp", "recipe-img");
    img1.setAttribute("alt", receta.title);
    img1.src = "./assets/images/img_recetas/" + receta.image + ".jpg";
    divRdpBoxRecipeImg.appendChild(img1);

    const img2 = document.createElement("img");
    img2.classList.add("rdp", "recipe-img");
    img2.setAttribute("alt", receta.title);
    img2.src = "./assets/images/img_recetas/" + receta.image + "_.jpg";
    divRdpBoxRecipeImg.appendChild(img2);

    const divRdpBoxContentInfo = document.createElement("div");
    divRdpBoxContentInfo.classList.add("rdp", "box-content", "info");
    sectionRdpBoxContainerContainer.appendChild(divRdpBoxContentInfo);

    const divRdpBoxSubContentInfo1 = document.createElement("div");
    divRdpBoxSubContentInfo1.classList.add("rdp", "box-subcontent", "info");
    divRdpBoxContentInfo.appendChild(divRdpBoxSubContentInfo1);

    const h6Title1 = document.createElement("h6");
    const h6TitleText1 = document.createTextNode("INGREDIENTES");
    h6Title1.classList.add("h6");
    divRdpBoxSubContentInfo1.appendChild(h6Title1);
    h6Title1.appendChild(h6TitleText1);

    const h6Des1 = document.createElement("h6");
    const h6DesText1 = document.createTextNode(receta.ingredients);
    h6Des1.classList.add("h6", "reg", "text");
    divRdpBoxSubContentInfo1.appendChild(h6Des1);
    h6Des1.appendChild(h6DesText1);

    const divRdpBoxSubContentInfo2 = document.createElement("div");
    divRdpBoxSubContentInfo2.classList.add("rdp", "box-subcontent", "info");
    divRdpBoxContentInfo.appendChild(divRdpBoxSubContentInfo2);

    const h6Title2 = document.createElement("h6");
    const h6TitleText2 = document.createTextNode("INTRUCCIONES");
    h6Title2.classList.add("h6");
    divRdpBoxSubContentInfo2.appendChild(h6Title2);
    h6Title2.appendChild(h6TitleText2);

    const h6Des2 = document.createElement("h6");

    const h6DesText2 = document.createTextNode(receta.instructions);
    h6Des2.classList.add("h6", "reg", "text");
    divRdpBoxSubContentInfo2.appendChild(h6Des2);
    h6Des2.appendChild(h6DesText2);

    divRdpBoxContentInfo.appendChild(divRdpBoxSubContentLabels);
}

// método para pintar toda la estructura de etiquetas de las recetas
function paintRecipeRdpLabel(receta){
    const p = document.createElement("p");
    const pText = document.createTextNode(receta);
    p.classList.add("button", "button-label");
    divRdpBoxSubContentLabels.appendChild(p);
    p.appendChild(pText);
}

// método para pintar toda la estructura del carrito
function paintCart(listado){
    divCartBoxSubcontentItems.innerHTML = "";
    for(const item of listado){
        const divCartBoxSubcontentItem = document.createElement("div");
        divCartBoxSubcontentItem.classList.add("cart", "box-subcontent-item");
        divCartBoxSubcontentItems.appendChild(divCartBoxSubcontentItem);

        const imgCart = document.createElement("img");
        imgCart.classList.add("cart", "product-img");
        imgCart.setAttribute("alt", item.name);
        imgCart.src = "./assets/images/img_productos/" + item.image;
        divCartBoxSubcontentItem.appendChild(imgCart);

        const divCartBoxSubcontentItemDetails =  document.createElement("div");
        divCartBoxSubcontentItemDetails.classList.add("cart", "box-subcontent-item-details");
        divCartBoxSubcontentItem.appendChild(divCartBoxSubcontentItemDetails);

        const pName = document.createElement("p");
        const pNameText = document.createTextNode(item.name);
        pName.classList.add("h6", "reg");
        divCartBoxSubcontentItemDetails.appendChild(pName);
        pName.appendChild(pNameText);

        const pPrice = document.createElement("p");
        const pPriceText = document.createTextNode(item.price + "€");
        pPrice.classList.add("h6", "reg");
        divCartBoxSubcontentItemDetails.appendChild(pPrice);
        pPrice.appendChild(pPriceText);

        const a = document.createElement("a");
        a.setAttribute("href", "#");
            
        a.addEventListener("click", deleteCartItem);
        divCartBoxSubcontentItem.appendChild(a);

        const imgIconBin = document.createElement("img");
        imgIconBin.classList.add("cart", "icon-bin");
        imgIconBin.setAttribute("alt", "Icono Basura");
        imgIconBin.setAttribute("id", item.id);
        imgIconBin.src = "./assets/icons/icono_papelera.svg";
        a.appendChild(imgIconBin);
    }
}

// método para pintar toda la estructura del resumen de cesta del checkout
function paintCheckoutProducts(listado){
    divCheckoutBoxSubcontent.innerHTML = "";
    for(const item of listado){
        const divCheckoutResumeItems = document.createElement("div");
        divCheckoutResumeItems.classList.add("checkout", "resume-items");
        divCheckoutBoxSubcontent.appendChild(divCheckoutResumeItems);

        const pName = document.createElement("p");
        const pNameText = document.createTextNode(item.name);
        pName.classList.add("h6", "reg");
        divCheckoutResumeItems.appendChild(pName);
        pName.appendChild(pNameText);

        const pPrice = document.createElement("p");
        const pPriceText = document.createTextNode(item.price + "€");
        pPrice.classList.add("h6", "reg");
        divCheckoutResumeItems.appendChild(pPrice);
        pPrice.appendChild(pPriceText);
    }
        const divCheckoutResumeTotal = document.createElement("div");
        divCheckoutResumeTotal.classList.add("checkout", "resume-total");
        divCheckoutBoxSubcontent.appendChild(divCheckoutResumeTotal);

        const pTotalName = document.createElement("p");
        const pTotalNameText = document.createTextNode("TOTAL");
        pTotalName.classList.add("h6", "bold");
        divCheckoutResumeTotal.appendChild(pTotalName);
        pTotalName.appendChild(pTotalNameText);

        const pTotalPrice = document.createElement("p");
        const pTotalPriceText = document.createTextNode(calculateTotal());
        pTotalPrice.classList.add("h6", "bold");
        pTotalPrice.setAttribute("id", "totalCheckout");
        divCheckoutResumeTotal.appendChild(pTotalPrice);
        pTotalPrice.appendChild(pTotalPriceText);
}

//cuando cargue la página, se cargan todos los productos y recetas de la BD
window.onload = getDataFromDB;

// método para obtener todos los datos de las diferentes bases de datos
function getDataFromDB(){
    getDataFromControllerProduct();
    getDataFromControllerRecipe();
    getDataFromControllerRecipeLabel();
}