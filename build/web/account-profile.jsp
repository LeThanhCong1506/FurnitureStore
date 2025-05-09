<%@page import="sample.user.UserDAO"%>
<%@page import="sample.cart.CartDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sample.user.UserDTO"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Classi - Bootstrap 5 HTML Template for Furniture Shop</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="format-detection" content="telephone=no">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="author" content="TemplatesJungle">
        <meta name="keywords" content="ecommerce,fashion,store">
        <meta name="description" content="Bootstrap 5 Furniture Shop HTML CSS Template">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="css/vendor.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
        <link rel="stylesheet" type="text/css" href="style.css">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;700;900&display=swap" rel="stylesheet">
    </head>
    <body class="homepage">
        <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
        <defs>
    <symbol xmlns="http://www.w3.org/2000/svg" id="instagram" viewBox="0 0 15 15">
        <path fill="none" stroke="currentColor" d="M11 3.5h1M4.5.5h6a4 4 0 0 1 4 4v6a4 4 0 0 1-4 4h-6a4 4 0 0 1-4-4v-6a4 4 0 0 1 4-4Zm3 10a3 3 0 1 1 0-6a3 3 0 0 1 0 6Z"/>
    </symbol>
    <symbol xmlns="http://www.w3.org/2000/svg" id="facebook" viewBox="0 0 15 15">
        <path fill="none" stroke="currentColor" d="M7.5 14.5a7 7 0 1 1 0-14a7 7 0 0 1 0 14Zm0 0v-8a2 2 0 0 1 2-2h.5m-5 4h5"/>
    </symbol>
    <symbol xmlns="http://www.w3.org/2000/svg" id="twitter" viewBox="0 0 15 15">
        <path fill="currentColor" d="m14.478 1.5l.5-.033a.5.5 0 0 0-.871-.301l.371.334Zm-.498 2.959a.5.5 0 1 0-1 0h1Zm-6.49.082h-.5h.5Zm0 .959h.5h-.5Zm-6.99 7V12a.5.5 0 0 0-.278.916L.5 12.5Zm.998-11l.469-.175a.5.5 0 0 0-.916-.048l.447.223Zm3.994 9l.354.353a.5.5 0 0 0-.195-.827l-.159.474Zm7.224-8.027l-.37.336l.18.199l.265-.04l-.075-.495Zm1.264-.94c.051.778.003 1.25-.123 1.606c-.122.345-.336.629-.723 1l.692.722c.438-.42.776-.832.974-1.388c.193-.546.232-1.178.177-2.006l-.998.066Zm0 3.654V4.46h-1v.728h1Zm-6.99-.646V5.5h1v-.959h-1Zm0 .959V6h1v-.5h-1ZM10.525 1a3.539 3.539 0 0 0-3.537 3.541h1A2.539 2.539 0 0 1 10.526 2V1Zm2.454 4.187C12.98 9.503 9.487 13 5.18 13v1c4.86 0 8.8-3.946 8.8-8.813h-1ZM1.03 1.675C1.574 3.127 3.614 6 7.49 6V5C4.174 5 2.421 2.54 1.966 1.325l-.937.35Zm.021-.398C.004 3.373-.157 5.407.604 7.139c.759 1.727 2.392 3.055 4.73 3.835l.317-.948c-2.155-.72-3.518-1.892-4.132-3.29c-.612-1.393-.523-3.11.427-5.013l-.895-.446Zm4.087 8.87C4.536 10.75 2.726 12 .5 12v1c2.566 0 4.617-1.416 5.346-2.147l-.708-.706Zm7.949-8.009A3.445 3.445 0 0 0 10.526 1v1c.721 0 1.37.311 1.82.809l.74-.671Zm-.296.83a3.513 3.513 0 0 0 2.06-1.134l-.744-.668a2.514 2.514 0 0 1-1.466.813l.15.989ZM.222 12.916C1.863 14.01 3.583 14 5.18 14v-1c-1.63 0-3.048-.011-4.402-.916l-.556.832Z"/>
    </symbol>
    <symbol xmlns="http://www.w3.org/2000/svg" id="pinterest" viewBox="0 0 15 15">
        <path fill="none" stroke="currentColor" d="m4.5 13.5l3-7m-3.236 3a2.989 2.989 0 0 1-.764-2V7A3.5 3.5 0 0 1 7 3.5h1A3.5 3.5 0 0 1 11.5 7v.5a3 3 0 0 1-3 3a2.081 2.081 0 0 1-1.974-1.423L6.5 9m1 5.5a7 7 0 1 1 0-14a7 7 0 0 1 0 14Z"/>
    </symbol>
    <symbol xmlns="http://www.w3.org/2000/svg" id="youtube" viewBox="0 0 15 15">
        <path fill="currentColor" d="m1.61 12.738l-.104.489l.105-.489Zm11.78 0l.104.489l-.105-.489Zm0-10.476l.104-.489l-.105.489Zm-11.78 0l.106.489l-.105-.489ZM6.5 5.5l.277-.416A.5.5 0 0 0 6 5.5h.5Zm0 4H6a.5.5 0 0 0 .777.416L6.5 9.5Zm3-2l.277.416a.5.5 0 0 0 0-.832L9.5 7.5ZM0 3.636v7.728h1V3.636H0Zm15 7.728V3.636h-1v7.728h1ZM1.506 13.227c3.951.847 8.037.847 11.988 0l-.21-.978a27.605 27.605 0 0 1-11.568 0l-.21.978ZM13.494 1.773a28.606 28.606 0 0 0-11.988 0l.21.978a27.607 27.607 0 0 1 11.568 0l.21-.978ZM15 3.636c0-.898-.628-1.675-1.506-1.863l-.21.978c.418.09.716.458.716.885h1Zm-1 7.728a.905.905 0 0 1-.716.885l.21.978A1.905 1.905 0 0 0 15 11.364h-1Zm-14 0c0 .898.628 1.675 1.506 1.863l.21-.978A.905.905 0 0 1 1 11.364H0Zm1-7.728c0-.427.298-.796.716-.885l-.21-.978A1.905 1.905 0 0 0 0 3.636h1ZM6 5.5v4h1v-4H6Zm.777 4.416l3-2l-.554-.832l-3 2l.554.832Zm3-2.832l-3-2l-.554.832l3 2l.554-.832Z"/>
    </symbol>
    <symbol xmlns="http://www.w3.org/2000/svg" id="dribble" viewBox="0 0 15 15">
        <path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" d="M4.839 1.024c3.346 4.041 5.096 7.922 5.704 12.782M.533 6.82c5.985-.138 9.402-1.083 11.97-4.216M2.7 12.594c3.221-4.902 7.171-5.65 11.755-4.293M14.5 7.5a7 7 0 1 0-14 0a7 7 0 0 0 14 0Z"/>
    </symbol>
    <symbol xmlns="http://www.w3.org/2000/svg" id="calendar" viewBox="0 0 24 24">
        <g fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"><rect width="20" height="18" x="2" y="4" rx="4"/><path d="M8 2v4m8-4v4M2 10h20"/></g>
    </symbol>
    <symbol xmlns="http://www.w3.org/2000/svg" id="shopping-bag" viewBox="0 0 24 24">
        <g fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"><path d="M3.977 9.84A2 2 0 0 1 5.971 8h12.058a2 2 0 0 1 1.994 1.84l.803 10A2 2 0 0 1 18.833 22H5.167a2 2 0 0 1-1.993-2.16l.803-10Z"/><path d="M16 11V6a4 4 0 0 0-4-4v0a4 4 0 0 0-4 4v5"/></g>
    </symbol>
    <symbol xmlns="http://www.w3.org/2000/svg" id="gift" viewBox="0 0 24 24">
        <g fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"><rect width="18" height="14" x="3" y="8" rx="2"/><path d="M12 5a3 3 0 1 0-3 3m6 0a3 3 0 1 0-3-3m0 0v17m9-7H3"/></g>
    </symbol>
    <symbol xmlns="http://www.w3.org/2000/svg" id="arrow-cycle" viewBox="0 0 24 24">
        <g fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"><path d="M22 12c0 6-4.39 10-9.806 10C7.792 22 4.24 19.665 3 16m-1-4C2 6 6.39 2 11.806 2C16.209 2 19.76 4.335 21 8"/><path d="m7 17l-4-1l-1 4M17 7l4 1l1-4"/></g>
    </symbol>
    <symbol xmlns="http://www.w3.org/2000/svg" id="link" viewBox="0 0 24 24">
        <path fill="currentColor" d="M12 19a1 1 0 1 0-1-1a1 1 0 0 0 1 1Zm5 0a1 1 0 1 0-1-1a1 1 0 0 0 1 1Zm0-4a1 1 0 1 0-1-1a1 1 0 0 0 1 1Zm-5 0a1 1 0 1 0-1-1a1 1 0 0 0 1 1Zm7-12h-1V2a1 1 0 0 0-2 0v1H8V2a1 1 0 0 0-2 0v1H5a3 3 0 0 0-3 3v14a3 3 0 0 0 3 3h14a3 3 0 0 0 3-3V6a3 3 0 0 0-3-3Zm1 17a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1v-9h16Zm0-11H4V6a1 1 0 0 1 1-1h1v1a1 1 0 0 0 2 0V5h8v1a1 1 0 0 0 2 0V5h1a1 1 0 0 1 1 1ZM7 15a1 1 0 1 0-1-1a1 1 0 0 0 1 1Zm0 4a1 1 0 1 0-1-1a1 1 0 0 0 1 1Z"/>
    </symbol>
    <symbol xmlns="http://www.w3.org/2000/svg" id="arrow-left" viewBox="0 0 24 24">
        <path fill="currentColor" d="M17 11H9.41l3.3-3.29a1 1 0 1 0-1.42-1.42l-5 5a1 1 0 0 0-.21.33a1 1 0 0 0 0 .76a1 1 0 0 0 .21.33l5 5a1 1 0 0 0 1.42 0a1 1 0 0 0 0-1.42L9.41 13H17a1 1 0 0 0 0-2Z"/>
    </symbol>
    <symbol xmlns="http://www.w3.org/2000/svg" id="arrow-right" viewBox="0 0 24 24">
        <path fill="currentColor" d="M17.92 11.62a1 1 0 0 0-.21-.33l-5-5a1 1 0 0 0-1.42 1.42l3.3 3.29H7a1 1 0 0 0 0 2h7.59l-3.3 3.29a1 1 0 0 0 0 1.42a1 1 0 0 0 1.42 0l5-5a1 1 0 0 0 .21-.33a1 1 0 0 0 0-.76Z"/>
    </symbol>
    <symbol xmlns="http://www.w3.org/2000/svg" id="play" viewBox="0 0 24 24">
        <g fill="none" fill-rule="evenodd"><path d="M24 0v24H0V0h24ZM12.593 23.258l-.011.002l-.071.035l-.02.004l-.014-.004l-.071-.035c-.01-.004-.019-.001-.024.005l-.004.01l-.017.428l.005.02l.01.013l.104.074l.015.004l.012-.004l.104-.074l.012-.016l.004-.017l-.017-.427c-.002-.01-.009-.017-.017-.018Zm.265-.113l-.013.002l-.185.093l-.01.01l-.003.011l.018.43l.005.012l.008.007l.201.093c.012.004.023 0 .029-.008l.004-.014l-.034-.614c-.003-.012-.01-.02-.02-.022Zm-.715.002a.023.023 0 0 0-.027.006l-.006.014l-.034.614c0 .012.007.02.017.024l.015-.002l.201-.093l.01-.008l.004-.011l.017-.43l-.003-.012l-.01-.01l-.184-.092Z"/><path fill="currentColor" d="M5.669 4.76a1.469 1.469 0 0 1 2.04-1.177c1.062.454 3.442 1.533 6.462 3.276c3.021 1.744 5.146 3.267 6.069 3.958c.788.591.79 1.763.001 2.356c-.914.687-3.013 2.19-6.07 3.956c-3.06 1.766-5.412 2.832-6.464 3.28c-.906.387-1.92-.2-2.038-1.177c-.138-1.142-.396-3.735-.396-7.237c0-3.5.257-6.092.396-7.235Z"/></g>
    </symbol>
    <symbol xmlns="http://www.w3.org/2000/svg" id="category" viewBox="0 0 24 24">
        <path fill="currentColor" d="M19 5.5h-6.28l-.32-1a3 3 0 0 0-2.84-2H5a3 3 0 0 0-3 3v13a3 3 0 0 0 3 3h14a3 3 0 0 0 3-3v-10a3 3 0 0 0-3-3Zm1 13a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1v-13a1 1 0 0 1 1-1h4.56a1 1 0 0 1 .95.68l.54 1.64a1 1 0 0 0 .95.68h7a1 1 0 0 1 1 1Z"/>
    </symbol>
    <symbol xmlns="http://www.w3.org/2000/svg" id="calendar" viewBox="0 0 24 24">
        <path fill="currentColor" d="M19 4h-2V3a1 1 0 0 0-2 0v1H9V3a1 1 0 0 0-2 0v1H5a3 3 0 0 0-3 3v12a3 3 0 0 0 3 3h14a3 3 0 0 0 3-3V7a3 3 0 0 0-3-3Zm1 15a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1v-7h16Zm0-9H4V7a1 1 0 0 1 1-1h2v1a1 1 0 0 0 2 0V6h6v1a1 1 0 0 0 2 0V6h2a1 1 0 0 1 1 1Z"/>
    </symbol>
    <symbol xmlns="http://www.w3.org/2000/svg" id="heart" viewBox="0 0 24 24">
        <path fill="currentColor" d="M20.16 4.61A6.27 6.27 0 0 0 12 4a6.27 6.27 0 0 0-8.16 9.48l7.45 7.45a1 1 0 0 0 1.42 0l7.45-7.45a6.27 6.27 0 0 0 0-8.87Zm-1.41 7.46L12 18.81l-6.75-6.74a4.28 4.28 0 0 1 3-7.3a4.25 4.25 0 0 1 3 1.25a1 1 0 0 0 1.42 0a4.27 4.27 0 0 1 6 6.05Z"/>
    </symbol>
    <symbol xmlns="http://www.w3.org/2000/svg" id="plus" viewBox="0 0 24 24">
        <path fill="currentColor" d="M19 11h-6V5a1 1 0 0 0-2 0v6H5a1 1 0 0 0 0 2h6v6a1 1 0 0 0 2 0v-6h6a1 1 0 0 0 0-2Z"/>
    </symbol>
    <symbol xmlns="http://www.w3.org/2000/svg" id="minus" viewBox="0 0 24 24">
        <path fill="currentColor" d="M19 11H5a1 1 0 0 0 0 2h14a1 1 0 0 0 0-2Z"/>
    </symbol>
    <symbol xmlns="http://www.w3.org/2000/svg" id="cart" viewBox="0 0 24 24">
        <path fill="currentColor" d="M8.5 19a1.5 1.5 0 1 0 1.5 1.5A1.5 1.5 0 0 0 8.5 19ZM19 16H7a1 1 0 0 1 0-2h8.491a3.013 3.013 0 0 0 2.885-2.176l1.585-5.55A1 1 0 0 0 19 5H6.74a3.007 3.007 0 0 0-2.82-2H3a1 1 0 0 0 0 2h.921a1.005 1.005 0 0 1 .962.725l.155.545v.005l1.641 5.742A3 3 0 0 0 7 18h12a1 1 0 0 0 0-2Zm-1.326-9l-1.22 4.274a1.005 1.005 0 0 1-.963.726H8.754l-.255-.892L7.326 7ZM16.5 19a1.5 1.5 0 1 0 1.5 1.5a1.5 1.5 0 0 0-1.5-1.5Z"/>
    </symbol>
    <symbol xmlns="http://www.w3.org/2000/svg" id="check" viewBox="0 0 24 24">
        <path fill="currentColor" d="M18.71 7.21a1 1 0 0 0-1.42 0l-7.45 7.46l-3.13-3.14A1 1 0 1 0 5.29 13l3.84 3.84a1 1 0 0 0 1.42 0l8.16-8.16a1 1 0 0 0 0-1.47Z"/>
    </symbol>
    <symbol xmlns="http://www.w3.org/2000/svg" id="trash" viewBox="0 0 24 24">
        <path fill="currentColor" d="M10 18a1 1 0 0 0 1-1v-6a1 1 0 0 0-2 0v6a1 1 0 0 0 1 1ZM20 6h-4V5a3 3 0 0 0-3-3h-2a3 3 0 0 0-3 3v1H4a1 1 0 0 0 0 2h1v11a3 3 0 0 0 3 3h8a3 3 0 0 0 3-3V8h1a1 1 0 0 0 0-2ZM10 5a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v1h-4Zm7 14a1 1 0 0 1-1 1H8a1 1 0 0 1-1-1V8h10Zm-3-1a1 1 0 0 0 1-1v-6a1 1 0 0 0-2 0v6a1 1 0 0 0 1 1Z"/>
    </symbol>
    <symbol xmlns="http://www.w3.org/2000/svg" id="star-outline" viewBox="0 0 15 15">
        <path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" d="M7.5 9.804L5.337 11l.413-2.533L4 6.674l2.418-.37L7.5 4l1.082 2.304l2.418.37l-1.75 1.793L9.663 11L7.5 9.804Z"/>
    </symbol>
    <symbol xmlns="http://www.w3.org/2000/svg" id="star-solid" viewBox="0 0 15 15">
        <path fill="currentColor" d="M7.953 3.788a.5.5 0 0 0-.906 0L6.08 5.85l-2.154.33a.5.5 0 0 0-.283.843l1.574 1.613l-.373 2.284a.5.5 0 0 0 .736.518l1.92-1.063l1.921 1.063a.5.5 0 0 0 .736-.519l-.373-2.283l1.574-1.613a.5.5 0 0 0-.283-.844L8.921 5.85l-.968-2.062Z"/>
    </symbol>
    <symbol xmlns="http://www.w3.org/2000/svg" id="search" viewBox="0 0 24 24">
        <path fill="currentColor" d="M21.71 20.29L18 16.61A9 9 0 1 0 16.61 18l3.68 3.68a1 1 0 0 0 1.42 0a1 1 0 0 0 0-1.39ZM11 18a7 7 0 1 1 7-7a7 7 0 0 1-7 7Z"/>
    </symbol>
    <symbol xmlns="http://www.w3.org/2000/svg" id="user" viewBox="0 0 24 24">
        <path fill="currentColor" d="M15.71 12.71a6 6 0 1 0-7.42 0a10 10 0 0 0-6.22 8.18a1 1 0 0 0 2 .22a8 8 0 0 1 15.9 0a1 1 0 0 0 1 .89h.11a1 1 0 0 0 .88-1.1a10 10 0 0 0-6.25-8.19ZM12 12a4 4 0 1 1 4-4a4 4 0 0 1-4 4Z"/>
    </symbol>
    <symbol xmlns="http://www.w3.org/2000/svg" id="close" viewBox="0 0 15 15">
        <path fill="currentColor" d="M7.953 3.788a.5.5 0 0 0-.906 0L6.08 5.85l-2.154.33a.5.5 0 0 0-.283.843l1.574 1.613l-.373 2.284a.5.5 0 0 0 .736.518l1.92-1.063l1.921 1.063a.5.5 0 0 0 .736-.519l-.373-2.283l1.574-1.613a.5.5 0 0 0-.283-.844L8.921 5.85l-.968-2.062Z"/>
    </symbol>
    </defs>
    </svg>

    <div class="preloader text-white fs-6 text-uppercase overflow-hidden"></div>

    <div class="search-popup">
        <div class="search-popup-container">

            <form role="search" method="get" class="form-group" action="">
                <input type="search" id="search-form" class="form-control border-0 border-bottom" placeholder="Type and press enter" value="" name="s" />
                <button type="submit" class="search-submit border-0 position-absolute bg-white" style="top: 15px;right: 15px;"><svg class="search" width="24" height="24"><use xlink:href="#search"></use></svg></button>
            </form>

            <h5 class="cat-list-title">Browse Categories</h5>

            <ul class="cat-list">
                <li class="cat-list-item">
                    <a href="#" title="Offices">Offices</a>
                </li>
                <li class="cat-list-item">
                    <a href="#" title="Kitchen">Kitchen</a>
                </li>
                <li class="cat-list-item">
                    <a href="#" title="Living Room">Living Room</a>
                </li>
                <li class="cat-list-item">
                    <a href="#" title="Hall">Hall</a>
                </li>
                <li class="cat-list-item">
                    <a href="#" title="Dining">Dining</a>
                </li>
                <li class="cat-list-item">
                    <a href="#" title="Bedroom">Bedroom</a>
                </li>
                <li class="cat-list-item">
                    <a href="#" title="Outdoor">Outdoor</a>
                </li>
            </ul>

        </div>
    </div>

    <%
        ArrayList<CartDTO> listCart = (ArrayList<CartDTO>) request.getAttribute("listCart");
        if (listCart == null) {
            listCart = new ArrayList<CartDTO>();
        }
        if (listCart.size() > 0) {
    %>
    <div class="offcanvas offcanvas-end" data-bs-scroll="true" tabindex="-1" id="offcanvasCart" aria-labelledby="My Cart">
        <div class="offcanvas-header justify-content-center">
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body">
            <div class="order-md-last">
                <h4 class="d-flex justify-content-between align-items-center mb-3">
                    <span class="text-primary">Your cart</span>
                    <span class="badge bg-primary rounded-pill"><%=listCart.size()%></span>
                </h4>
                <ul class="list-group mb-3">
                    <%
                        float totalPrice = 0;
                        for (int i = 0; i < listCart.size(); i++) {
                            totalPrice += listCart.get(i).getTotalPrice();
                    %>
                    <li class="list-group-item d-flex justify-content-between lh-sm">
                        <div>
                            <h6 class="my-0"><%=listCart.get(i).getProductName()%></h6>
                            <small class="text-body-secondary">Quantity: <%=listCart.get(i).getQuantity()%></small>
                        </div>
                        <span class="text-body-secondary"><%=listCart.get(i).getTotalPrice()%></span>
                    </li>
                    <%
                        }
                    %>
                    <li class="list-group-item d-flex justify-content-between">
                        <span>Total (USD)</span>
                        <strong><%=String.format("%.2f", totalPrice)%></strong>
                    </li>
                </ul>

                <button class="w-100 btn btn-primary btn-lg" type="submit">Continue to checkout</button>
            </div>
        </div>
    </div>
    <%
    } else {
    %>
    <div class="offcanvas offcanvas-end" data-bs-scroll="true" tabindex="-1" id="offcanvasCart" aria-labelledby="My Cart">
        <div class="offcanvas-header justify-content-center">
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body">
            <div class="order-md-last">
                <h4 class="d-flex justify-content-between align-items-center mb-3">
                    <span class="text-primary">Your cart</span>
                    <span class="badge bg-primary rounded-pill">0</span>
                </h4>
                <ul class="list-group mb-3">
                    <li class="list-group-item d-flex justify-content-between lh-sm">
                        <div>
                            <h6 class="my-0">Nothing here yet!</h6>
                        </div>
                    </li>
                    <li class="list-group-item d-flex justify-content-between">
                        <span>Total (USD)</span>
                        <strong>0</strong>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <%
        }
    %>

    <nav class="navbar navbar-expand-lg text-uppercase fs-6 p-3 border-bottom fixed-top bg-white">
        <div class="container-fluid">
            <a class="navbar-brand" href="Home"><img src="images/logo_black.png" width="100" height="55" alt="logo"></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
                    aria-controls="offcanvasNavbar">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
                <div class="offcanvas-header">
                    <h5 class="offcanvas-title" id="offcanvasNavbarLabel">Menu</h5>
                    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>

                <div class="offcanvas-body">
                    <ul class="navbar-nav justify-content-end flex-grow-1 gap-1 gap-md-5 pe-3">
                        <li class="nav-item">
                            <a class="nav-link" href="Home">Home</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="dropdownPages" data-bs-toggle="dropdown"
                               aria-haspopup="true" aria-expanded="false">Pages</a>
                            <ul class="dropdown-menu list-unstyled border p-3" aria-labelledby="dropdownPages">
                                <li>
                                    <a href="Shop" class="dropdown-item item-anchor">Shop</a>
                                </li>
                                <li>
                                    <a href="blog.jsp" class="dropdown-item item-anchor">Blog</a>
                                </li>
                                <li>
                                    <a href="Cart" class="dropdown-item item-anchor">Cart</a>
                                </li>
                                <li>
                                    <a href="Checkout" class="dropdown-item item-anchor">Checkout </a>
                                </li>
                                <li>

                                    <%
                                        UserDTO a = (UserDTO) session.getAttribute("account");
                                        if (a == null) {
                                    %>
                                    <a href="Login" class="dropdown-item item-anchor">My Account </a>
                                    <%
                                    } else {
                                    %>
                                    <a href="accountProfile" class="dropdown-item item-anchor">My Account </a>
                                    <%
                                        }
                                    %>
                                </li>
                                <li>
                                    <a href="Wishlist" class="dropdown-item item-anchor">Wishlist </a>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Shop">Shop</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="blog.jsp">Blog</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="about.jsp">About</a>
                        </li>
                    </ul>
                </div>
            </div>
            <ul class="list-unstyled d-flex m-0">
                <li>
                    <a href="Wishlist" class="mx-2">
                        <svg width="24" height="24" viewBox="0 0 24 24"><use xlink:href="#heart"></use></svg>
                    </a>
                </li>
                <li>
                    <a href="cart.html" class="mx-2" data-bs-toggle="offcanvas" data-bs-target="#offcanvasCart" aria-controls="offcanvasCart">
                        <svg width="24" height="24" viewBox="0 0 24 24"><use xlink:href="#cart"></use></svg>
                    </a>
                </li>
                <li class="search-box" class="mx-2">
                    <a href="#search" class="search-button">
                        <svg width="24" height="24" viewBox="0 0 24 24"><use xlink:href="#search"></use></svg>
                    </a>
                </li>
            </ul>

        </div>
    </nav>
    <style>
        .aaa{
            margin-bottom: 10px;
        }
    </style>

    <%
        UserDTO profileUser = new UserDAO().read(a);
        if (profileUser == null) {
            profileUser = new UserDTO();
        }
    %>
    <section id="login-form" class="py-5 my-5">
        <div class="container-sm">
            <div class="row justify-content-center">
                <div class="col-md-4">
                    <div class="breadcrumbs pt-5 my-5">
                        <span class="item"><a href="index.html">Home /</a></span>
                        <span class="item">Account setting</span>
                    </div>
                    <h2 class="section-title text-uppercase">Update account</h2>
                    <form action="MainController" method="post" id="form" class="form-group flex-wrap">
                        <div class="col-12 pb-3">
                            <label>Username *</label>
                            <input type="text" name="username" placeholder="Write your username here"
                                   class="form-control" value="<%=profileUser.getUsername()%>">
                        </div>
                        <div class="col-12 pb-3">
                            <label>Email *</label>
                            <input type="text" name="email" placeholder="Write your email here"
                                   class="form-control" value="<%=profileUser.getEmail()%>">
                        </div>
                        <div class="col-12 pb-3">
                            <label>Full name *</label>
                            <input type="text" name="fullname" placeholder="Write your full name here"
                                   class="form-control" value="<%=profileUser.getFullName()%>">
                        </div>
                        <div class="col-12 pb-3">
                            <label>Phone number *</label>
                            <input type="text" name="phoneNumber" placeholder="Write your phone number here"
                                   class="form-control" value="<%=profileUser.getPhoneNumber()%>">
                        </div>
                        <div class="col-12 pb-3">
                            <label>Address *</label>
                            <input type="text" name="address" placeholder="Write your address here"
                                   class="form-control" value="<%=profileUser.getAddress()%>">
                        </div>
                        <div class="col-12 pb-3">
                            <label>Password *</label>
                            <input type="text" name="password" placeholder="Enter your password" class="form-control" value="<%=profileUser.getPassword()%>">
                        </div>
                        <div class="col-12 pb-3">
                            <label>Confirm password *</label>
                            <input type="text" name="passwordConfirm" placeholder="Confirm password" class="form-control">
                        </div>
                        <div class="col-12">
                            <%
                                String ms = (String) request.getAttribute("status");
                                if (ms != null) {
                            %>
                            <p style="text-align: center" ><%=ms%></p>
                            <%
                                }
                            %>
                            <button type="submit" name="action" value="Update" class="btn aaa btn-dark text-uppercase w-100">Update</button>
                            <button type="submit" name="action" value="Logout" class="btn btn-dark text-uppercase w-100">Logout</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>

    <section class="newsletter bg-black py-5" data-bs-theme="dark">
        <div class="container">
            <div class="row">
                <div class="col-md-10 offset-md-1">
                    <div class="row my-5 align-items-center">
                        <div class="col-md-7">
                            <h3 class="display-4 m-0">Get 20% discount on your first purchase</h3>
                            <p class="fs-6 text-gray">Just Sign Up & Register it now to become member of TemplatesJungle.</p>
                        </div>
                        <div class="col-md-5">
                            <form id="form" class="d-flex flex-wrap gap-2">
                                <input type="text" name="email" placeholder="Your Email Addresss" class="form-control form-control-lg">
                                <button class="btn btn-primary btn-lg text-uppercase w-100 rounded-3">Sign Up</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <footer id="footer" class="bg-black border-top" data-bs-theme="dark">
        <div class="container-fluid">
            <div class="row d-flex flex-wrap justify-content-between py-5">
                <div class="col-md-3 col-sm-6">
                    <div class="footer-menu footer-menu-001">
                        <div class="footer-intro mb-4">
                            <a href="index.html">
                                <svg width="247" height="64" viewBox="0 0 247 64" fill="#111" xmlns="http://www.w3.org/2000/svg">
                                <path d="M26.7795 63.62C22.1895 63.62 17.8155 62.189 13.6575 59.327C9.55351 56.411 6.25951 52.523 3.77551 47.663C1.29151 42.803 0.0495118 37.592 0.0495118 32.03C0.0495118 25.982 1.23751 20.555 3.61351 15.749C5.98951 10.943 9.22951 7.19 13.3335 4.49C17.4375 1.79 22.0005 0.439996 27.0225 0.439996C29.8305 0.439996 33.0435 1.196 36.6615 2.708C40.3335 4.22 42.8985 5.948 44.3565 7.892L45.5715 1.817H46.9485V19.88H45.2475C45.2475 17.072 44.3835 14.291 42.6555 11.537C40.9815 8.783 38.6595 6.515 35.6895 4.733C32.7195 2.951 29.4525 2.06 25.8885 2.06C22.2165 2.06 18.9495 3.356 16.0875 5.948C13.2255 8.54 10.9845 12.104 9.36451 16.64C7.74451 21.122 6.93451 26.144 6.93451 31.706C6.93451 37.052 7.71751 42.047 9.28351 46.691C10.9035 51.281 13.3335 54.98 16.5735 57.788C19.8675 60.596 23.8635 62 28.5615 62C32.0175 62 35.1765 61.001 38.0385 59.003C40.9005 57.005 43.0335 54.413 44.4375 51.227C44.5995 50.849 44.9235 49.742 45.4095 47.906C45.7875 46.286 46.1655 44.936 46.5435 43.856C46.9755 42.722 47.5425 41.723 48.2445 40.859H49.3785C48.5145 41.615 47.8935 43.019 47.5155 45.071C47.1915 47.123 47.0295 49.958 47.0295 53.576C47.0295 54.872 45.9765 56.33 43.8705 57.95C41.8185 59.516 39.1995 60.866 36.0135 62C32.8815 63.08 29.8035 63.62 26.7795 63.62ZM85.1571 43.694C84.4011 44.396 83.8881 45.503 83.6181 47.015C83.4021 48.527 83.2941 50.768 83.2941 53.738V62H50.9751V59.975C52.0011 60.299 52.9461 60.461 53.8101 60.461C54.8361 60.461 55.6191 60.191 56.1591 59.651C56.7531 59.057 57.0501 58.22 57.0501 57.14V6.92C57.0501 5.84 56.7531 5.03 56.1591 4.49C55.6191 3.896 54.8361 3.599 53.8101 3.599C52.9461 3.599 52.0011 3.761 50.9751 4.085V2.06H69.2001V4.085C68.1741 3.761 67.2291 3.599 66.3651 3.599C65.3391 3.599 64.5291 3.896 63.9351 4.49C63.3951 5.03 63.1251 5.84 63.1251 6.92V51.875C63.1251 55.061 63.6651 57.41 64.7451 58.922C65.8251 60.434 67.7151 61.19 70.4151 61.19C73.4391 61.19 75.7071 60.785 77.2191 59.975C78.7311 59.111 79.7301 58.058 80.2161 56.816C80.7021 55.52 81.1071 53.711 81.4311 51.389C81.6471 49.607 81.8901 48.149 82.1601 47.015C82.4301 45.881 82.9161 44.774 83.6181 43.694H85.1571ZM127.999 58.76C128.377 60.164 129.349 60.866 130.915 60.866C131.941 60.866 133.291 60.569 134.965 59.975V62H115.444V59.975C117.01 60.515 118.36 60.785 119.494 60.785C120.79 60.785 121.438 60.326 121.438 59.408C121.438 59.138 121.411 58.922 121.357 58.76L114.067 35.675H96.8951C94.9511 42.155 93.0881 48.635 91.3061 55.115L90.7391 57.14C90.6311 57.464 90.5771 57.869 90.5771 58.355C90.5771 59.921 91.5491 60.704 93.4931 60.704C94.5731 60.704 95.8151 60.461 97.2191 59.975V62H80.2901V59.975C81.5861 60.461 82.8281 60.704 84.0161 60.704C85.6361 60.704 86.7971 60.056 87.4991 58.76C87.8771 58.004 88.2011 57.221 88.4711 56.411L105.643 0.439996H110.341L127.999 58.76ZM97.3001 34.217H113.581L105.157 7.649L97.3001 34.217ZM152.604 63.62C148.662 63.62 145.503 62.972 143.127 61.676C140.805 60.326 138.78 58.328 137.052 55.682L135.918 60.461H134.298V38.429H136.485C136.485 45.773 137.754 51.578 140.292 55.844C142.884 60.11 146.718 62.243 151.794 62.243C154.17 62.243 156.249 61.595 158.031 60.299C159.813 58.949 161.163 57.194 162.081 55.034C162.999 52.874 163.458 50.579 163.458 48.149C163.458 45.179 162.783 42.722 161.433 40.778C160.137 38.78 158.517 37.214 156.573 36.08C154.629 34.946 152.064 33.704 148.878 32.354C145.584 30.95 142.965 29.681 141.021 28.547C139.077 27.359 137.43 25.793 136.08 23.849C134.784 21.851 134.136 19.34 134.136 16.316C134.136 13.292 134.838 10.565 136.242 8.135C137.7 5.705 139.644 3.815 142.074 2.465C144.558 1.115 147.339 0.439996 150.417 0.439996C152.307 0.439996 154.17 0.763997 156.006 1.412C157.896 2.06 159.489 2.897 160.785 3.923C162.081 4.895 162.864 5.867 163.134 6.839L164.025 0.601999H165.564V16.721H163.701C163.701 14.291 163.269 11.969 162.405 9.755C161.541 7.541 160.191 5.732 158.355 4.328C156.573 2.924 154.359 2.222 151.713 2.222C148.311 2.222 145.53 3.356 143.37 5.624C141.264 7.892 140.211 11.051 140.211 15.101C140.211 17.423 140.805 19.394 141.993 21.014C143.181 22.58 144.639 23.876 146.367 24.902C148.149 25.928 150.525 27.116 153.495 28.466C156.951 30.032 159.732 31.49 161.838 32.84C163.998 34.136 165.807 35.918 167.265 38.186C168.777 40.4 169.533 43.181 169.533 46.529C169.533 49.229 168.75 51.929 167.184 54.629C165.618 57.275 163.539 59.435 160.947 61.109C158.355 62.783 155.574 63.62 152.604 63.62ZM192.87 63.62C188.928 63.62 185.769 62.972 183.393 61.676C181.071 60.326 179.046 58.328 177.318 55.682L176.184 60.461H174.564V38.429H176.751C176.751 45.773 178.02 51.578 180.558 55.844C183.15 60.11 186.984 62.243 192.06 62.243C194.436 62.243 196.515 61.595 198.297 60.299C200.079 58.949 201.429 57.194 202.347 55.034C203.265 52.874 203.724 50.579 203.724 48.149C203.724 45.179 203.049 42.722 201.699 40.778C200.403 38.78 198.783 37.214 196.839 36.08C194.895 34.946 192.33 33.704 189.144 32.354C185.85 30.95 183.231 29.681 181.287 28.547C179.343 27.359 177.696 25.793 176.346 23.849C175.05 21.851 174.402 19.34 174.402 16.316C174.402 13.292 175.104 10.565 176.508 8.135C177.966 5.705 179.91 3.815 182.34 2.465C184.824 1.115 187.605 0.439996 190.683 0.439996C192.573 0.439996 194.436 0.763997 196.272 1.412C198.162 2.06 199.755 2.897 201.051 3.923C202.347 4.895 203.13 5.867 203.4 6.839L204.291 0.601999H205.83V16.721H203.967C203.967 14.291 203.535 11.969 202.671 9.755C201.807 7.541 200.457 5.732 198.621 4.328C196.839 2.924 194.625 2.222 191.979 2.222C188.577 2.222 185.796 3.356 183.636 5.624C181.53 7.892 180.477 11.051 180.477 15.101C180.477 17.423 181.071 19.394 182.259 21.014C183.447 22.58 184.905 23.876 186.633 24.902C188.415 25.928 190.791 27.116 193.761 28.466C197.217 30.032 199.998 31.49 202.104 32.84C204.264 34.136 206.073 35.918 207.531 38.186C209.043 40.4 209.799 43.181 209.799 46.529C209.799 49.229 209.016 51.929 207.45 54.629C205.884 57.275 203.805 59.435 201.213 61.109C198.621 62.783 195.84 63.62 192.87 63.62ZM213.858 59.975C214.884 60.299 215.829 60.461 216.693 60.461C217.719 60.461 218.502 60.191 219.042 59.651C219.636 59.057 219.933 58.22 219.933 57.14V6.92C219.933 5.84 219.636 5.03 219.042 4.49C218.502 3.896 217.719 3.599 216.693 3.599C215.829 3.599 214.884 3.761 213.858 4.085V2.06H232.083V4.085C231.057 3.761 230.112 3.599 229.248 3.599C228.222 3.599 227.412 3.896 226.818 4.49C226.278 5.03 226.008 5.84 226.008 6.92V57.14C226.008 58.22 226.278 59.057 226.818 59.651C227.412 60.191 228.222 60.461 229.248 60.461C230.112 60.461 231.057 60.299 232.083 59.975V62H213.858V59.975ZM242.588 62.81C241.562 62.81 240.617 62.459 239.753 61.757C238.943 61.055 238.538 60.191 238.538 59.165C238.538 58.193 238.943 57.356 239.753 56.654C240.617 55.898 241.562 55.52 242.588 55.52C243.614 55.52 244.532 55.898 245.342 56.654C246.206 57.356 246.638 58.193 246.638 59.165C246.638 60.191 246.206 61.055 245.342 61.757C244.532 62.459 243.614 62.81 242.588 62.81Z" fill="white"/>
                                </svg>
                            </a>
                        </div>
                        <p>Gravida massa volutpat aenean odio. Amet, turpis erat nullam fringilla elementum diam in. Nisi, purus vitae, ultrices nunc. Sit ac sit suscipit hendrerit.</p>
                        <div class="social-links">
                            <ul class="list-unstyled d-flex flex-wrap gap-3">
                                <li>
                                    <a href="#" class="text-secondary">
                                        <svg width="24" height="24" viewBox="0 0 24 24"><use xlink:href="#facebook"></use></svg>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="text-secondary">
                                        <svg width="24" height="24" viewBox="0 0 24 24"><use xlink:href="#twitter"></use></svg>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="text-secondary">
                                        <svg width="24" height="24" viewBox="0 0 24 24"><use xlink:href="#youtube"></use></svg>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="text-secondary">
                                        <svg width="24" height="24" viewBox="0 0 24 24"><use xlink:href="#pinterest"></use></svg>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="text-secondary">
                                        <svg width="24" height="24" viewBox="0 0 24 24"><use xlink:href="#instagram"></use></svg>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-2 col-sm-6">
                    <div class="footer-menu footer-menu-002">
                        <h5 class="widget-title mb-4">Quick Links</h5>
                        <ul class="menu-list list-unstyled fs-6">
                            <li class="menu-item">
                                <a href="index.html" class="item-anchor">Home</a>
                            </li>
                            <li class="menu-item">
                                <a href="shop-four-column-wide.html" class="item-anchor">About</a>
                            </li>
                            <li class="menu-item">
                                <a href="blog.html" class="item-anchor">Services</a>
                            </li>
                            <li class="menu-item">
                                <a href="styles.html" class="item-anchor">Single item</a>
                            </li>
                            <li class="menu-item">
                                <a href="#" class="item-anchor">Contact</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-2 col-sm-6">
                    <div class="footer-menu footer-menu-002">
                        <h5 class="widget-title mb-4">About</h5>
                        <ul class="menu-list list-unstyled fs-6">
                            <li class="menu-item">
                                <a href="index.html" class="item-anchor">How it works</a>
                            </li>
                            <li class="menu-item">
                                <a href="shop-four-column-wide.html" class="item-anchor">About</a>
                            </li>
                            <li class="menu-item">
                                <a href="blog.html" class="item-anchor">Our packages</a>
                            </li>
                            <li class="menu-item">
                                <a href="styles.html" class="item-anchor">Promotions</a>
                            </li>
                            <li class="menu-item">
                                <a href="#" class="item-anchor">Refer a friend</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-2 col-sm-6">
                    <div class="footer-menu footer-menu-003">
                        <h5 class="widget-title mb-4">Help & Info</h5>
                        <ul class="menu-list list-unstyled fs-6">
                            <li class="menu-item">
                                <a href="#" class="item-anchor">Track Your Order</a>
                            </li>
                            <li class="menu-item">
                                <a href="#" class="item-anchor">Returns + Exchanges</a>
                            </li>
                            <li class="menu-item">
                                <a href="#" class="item-anchor">Shipping + Delivery</a>
                            </li>
                            <li class="menu-item">
                                <a href="#" class="item-anchor">Contact Us</a>
                            </li>
                            <li class="menu-item">
                                <a href="#" class="item-anchor">Find us easy</a>
                            </li>
                            <li class="menu-item">
                                <a href="faqs.html" class="item-anchor">Faqs</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="footer-menu footer-menu-004 border-animation-left">
                        <h5 class="widget-title mb-4">Contact Us</h5>
                        <p>Do you have any questions or suggestions? <a href="mailto:contact@yourcompany.com" class="item-anchor">contact@yourcompany.com</a></p>
                        <p>Do you need support? Give us a call. <a href="tel:+43 720 11 52 78" class="item-anchor">+43 720 11 52 78</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <div class="border-top py-4">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-6 d-flex flex-wrap">
                        <div class="shipping">
                            <span>We ship with:</span>
                            <img src="images/arct-icon.png" alt="icon">
                            <img src="images/dhl-logo.png" alt="icon">
                        </div>
                        <div class="payment-option">
                            <span>Payment Option:</span>
                            <img src="images/visa-card.png" alt="card">
                            <img src="images/paypal-card.png" alt="card">
                            <img src="images/master-card.png" alt="card">
                        </div>
                    </div>
                    <div class="col-md-6 text-start text-md-end">
                        <p>� Copyright 2023 Classi. All rights reserved. HTML Template by <a href="https://templatesjungle.com" target="_blank">TemplatesJungle</a></p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <script src="js/jquery.min.js"></script>
    <script src="js/plugins.js"></script>
    <script src="js/SmoothScroll.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
    <script src="js/script.js"></script>
</body>
</html>