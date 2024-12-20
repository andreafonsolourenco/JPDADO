<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" Culture="auto" UICulture="auto" %>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="JPDADO">
    <meta name="author" content="André Afonso Lourenço">
    <link rel='shortcut icon' type='image/x-icon' href='img/favicon.png' />

    <title>JPDADO S.E.C. Lda</title>
    
    <%--
    
    
    <!-- Add icon library -->--%>

    <%--<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="bootstrap/css/bootstrap-grid.min.css" rel="stylesheet">
    <link href="bootstrap/css/bootstrap-reboot.min.css" rel="stylesheet">--%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <%--<link href="jquery-ui/jquery-ui.min.css" rel="stylesheet">
    <link href="jquery-ui/jquery-ui.structure.min.css" rel="stylesheet">
    <link href="jquery-ui/jquery-ui.theme.min.css" rel="stylesheet">--%>
    <link href="alertifyjs/css/alertify.min.css" rel="stylesheet" type='text/css'/>
    <link href="alertifyjs/css/themes/semantic.min.css" rel="stylesheet" type='text/css'/>
    <link href="alertifyjs/css/themes/default.min.css" rel="stylesheet" type='text/css'/>
    <link href="css/main.css" rel="stylesheet">

    <style type="text/css">
        /* Style all font awesome icons */
        .fa {
            padding: 20px;
            font-size: 30px;
            width: auto;
            text-align: center;
            text-decoration: none;
        }

            /* Add a hover effect if you want */
            .fa:hover {
                opacity: 0.7;
            }

        /* Set a specific color for each brand */

        /* Facebook */
        .fa-facebook {
            background: #3B5998;
            color: white;
        }

        /* Twitter */
        .fa-twitter {
            background: #55ACEE;
            color: white;
        }

        .black_overlay {
            display: none;
            position: fixed;
            top: 0%;
            left: 0%;
            width: 100%;
            height: 100%;
            background-color: black;
            z-index: 1001;
            -moz-opacity: 0.8;
            opacity: .80;
            filter: alpha(opacity=80);
        }

        .carouselSlider {
            z-index: 1002;
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 75%;
            max-height: 100%;
        }

        .stopScroll {
            overflow: hidden;
        }

        .maxheightclass {
            max-height: 100% !important;
        }

        .opacity {
            opacity: 0.5;
        }

        .divPortfolioMargin {
            margin-bottom: 50px !important;
        }

        .ano2015 {
            display: none;
        }

        .ano2016 {
            display: none;
        }

        .ano2017 {
            display: none;
        }

        .ano2018 {
            display: none;
        }

        .ano2019 {
            display: none;
        }

        .ano2020 {
            display: none;
        }

        .ano2021 {
            display: none;
        }

        .ano2022 {
            display: none;
        }

        .ano2023 {
            display: none;
        }

        .ano2024 {
            display: none;
        }

        .ano2025 {
            display: none;
        }

        .ano2026 {
            display: none;
        }

        .ano2027 {
            display: none;
        }

        .ano2028 {
            display: none;
        }

        .ano2029 {
            display: none;
        }

        .ano2030 {
            display: none;
        }

        .btn {
            background-color: #78bc9d;
            color: #000;
            transition: 0.5s;
            font-size-adjust: inherit;
            font-size: x-large;
            height: auto;
        }

            .btn:hover {
                background-color: #4B94C4;
                color: #000;
                font-size-adjust: inherit;
                font-size: x-large;
                height: auto;
            }

        .textSizeSmall {
            font-size: x-small;
        }

        .titulo {
            display: block;
        }

        .img_slider {
            max-height: 800px !important;
            width: auto !important;
            margin: auto !important;
        }

        .variaveis {
            display: none !important;
        }

        /* When the screen is less than 600 pixels wide, hide all links, except for the first one ("Home"). Show the link that contains should open and close the topnav (.icon) */
        @media screen and (max-width: 600px) {
            .w3-top {
                font-size: x-small;
            }

            .titulo {
                display: none;
            }
        }
    </style>
</head>
<body>
    <div id="black_overlay" class="black_overlay" onclick="closeSlider();">
        <img src="img/icon_close.png" style="top: 0; height: 20px; width: auto; float: right; cursor: pointer;" onclick="closeSlider();" />
    </div>

    <div id="myCarousel" class="carousel slide carouselSlider" data-ride="carousel"></div>

    <!-- Navbar (sit on top) -->
    <div class="w3-top" id="navbar">
        <div class="w3-bar w3-white w3-wide w3-padding w3-card">
            <a href="#home" class="w3-bar-item w3-button titulo"><span class="w3-padding w3-black w3-opacity-min"><b>JP</b></span><span class="w3-hide-small w3-text-green">DADO</span></a>
            <!-- Float links to the right. Hide them on small screens -->
            <div class="w3-right w3-hide-small">
                <a href="#about" class="w3-bar-item w3-button">Sobre Nós</a>
                <a href="#projects" class="w3-bar-item w3-button">Portfolio</a>
                <a href="#contact" class="w3-bar-item w3-button">Contactos</a>
            </div>
        </div>
    </div>

    <!-- Header -->
    <header class="w3-display-container w3-content w3-wide" id="home">
        <img class="w3-image opacity" src="img/capa.png" alt="JP DADO" id="capaHome">
        <div class="w3-display-middle w3-margin-top w3-center">
            <%--<h1 class="w3-xxlarge w3-text-white"><span class="w3-padding w3-black w3-opacity-min"><b>JPDADO</b></span> <span class="w3-hide-small w3-text-light-grey">DADO</span></h1>--%>
            <img src="img/logo.png" id="logoHome" />
        </div>
    </header>

    <!-- Page content -->
    <div class="w3-content w3-padding" style="max-width: 1564px" id="content">
        <div class="variaveis" id="imgNamesDiv" runat="server"></div>

        <!-- About Section -->
        <div class="w3-container w3-padding-32" id="about" runat="server"></div>

        <div class="w3-row-padding w3-grayscale" id="textos" runat="server"></div>

        <div class="w3-row-padding w3-grayscale" id="divEspecialidades" runat="server"></div>

        <!-- Project Section -->
        <div class="w3-container w3-padding-32" id="projects" runat="server"></div>

        <!-- Contact Section -->
        <div class="w3-container w3-padding-32" id="contact" runat="server"></div>

        <!-- End page content -->
    </div>

    <div class="black_overlay" id="overlayLanguages">
        <img src="img/icon_close.png" style="top: 0; height: 20px; width: auto; float: right; cursor: pointer;" onclick="closeLanguagesMenu();" />
        <div id='divLanguages' class='w3-center w3-padding-16 divLanguages' runat='server'>
            <h3 class='w3-border-bottom w3-border-light-grey w3-padding-16 w3-text-primary-color w3-padding-top' id="selectLanguageTag" runat="server">Selecione a língua</h3>
            <div class="w3-padding-32 w3-col l3 m3 s3 w3-padding-small w3-justify pt divSelectLanguage" onclick="selectLanguage('PT');"></div>
            <div class="w3-padding-32 w3-col l3 m3 s3 w3-padding-small w3-justify en divSelectLanguage" onclick="selectLanguage('EN');"></div>
            <div class="w3-padding-32 w3-col l3 m3 s3 w3-padding-small w3-justify fr divSelectLanguage" onclick="selectLanguage('FR');"></div>
            <div class="w3-padding-32 w3-col l3 m3 s3 w3-padding-small w3-justify es divSelectLanguage" onclick="selectLanguage('ES');"></div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="w3-center w3-black w3-padding-16">
        <p>
            <img src="img/logo_aal_white.png" style="width:100px; height: auto; margin: auto"/> &copy; 2018
        </p>
    </footer>

    <%--<!-- Custom scripts for this template -->--%>

    <%--<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>--%>
    <%--<script type="text/javascript" src="jquery-ui/jquery-ui.min.js"></script>--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="alertifyjs/alertify.min.js"></script>
    <%--<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>--%>

    <script type="text/javascript">
        //override defaults
        alertify.defaults.transition = "slide";
        alertify.defaults.theme.ok = "btn btn-primary";
        alertify.defaults.theme.cancel = "btn btn-danger";
        alertify.defaults.theme.input = "form-control";

        var contador = 0;
        var dots = [];
        var totalImgs = 0;

        $("a[href^='#']").click(function (e) {
            e.preventDefault();

            var position = $($(this).attr("href")).offset().top;

            $("body, html").animate({
                scrollTop: position
            }, 2000);
        });

        $(document).ready(function () {
            fillImgArray();
            ajustaTamanhos();

            setInterval(function () {

                var name = "img/portfolio/" + dots[contador];
                $('#capaHome').attr("src");

                contador++;

                if (contador == (totalImgs - 1))
                    contador = 0;

                document.getElementById("capaHome").setAttribute("src", name);

                ajustaTamanhos();
            }, 5000);
        });

        $(window).on('resize', function () {
            ajustaTamanhos();
        });

        function fillImgArray() {
            totalImgs = parseInt($('#countNrImg').html());

            for (var i = 0; i < totalImgs; i++) {
                dots.push($('#img' + i.toString()).html());
            }
        }

        function ajustaTamanhos() {
            var height = window.innerHeight;
            var width = window.innerWidth;

            $('#home').css({ "margin-top": $('#navbar').height(), "height": height - $('#navbar').height(), "max-height": height - $('#navbar').height(), "width": "auto" });
            $('#capaHome').css({ "height": height - $('#navbar').height(), "max-height": height - $('#navbar').height(), "width": "auto" });
            $('#logoHome').css({ "height": ($('#capaHome').height() / 2), "width": "auto", "margin": "auto" });
        }

        function closeSlider() {
            $('#black_overlay').fadeOut();
            $('#myCarousel').fadeOut();
        }

        function buildMyCarousel(x) {
            $.ajax({
                type: "POST",
                url: "index.aspx/loadImagesCarousel",
                data: '{"id":"' + x + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (res) {
                    if (res.d != null && res.d != '') {
                        $('#myCarousel').html(res.d);
                        $('.carousel-caption').addClass('maxheightclass');
                        $('#black_overlay').fadeIn();
                        $('#myCarousel').fadeIn();
                        $(".d-block.w-80").addClass('maxheightclass');
                        $('.carousel-inner').addClass('maxheightclass');
                    }
                }
            });
        }

        function sendEmail() {
            var assunto = $('#assunto').val().trim();
            var nome = $('#nome').val().trim();
            var email = $('#email').val().trim();
            var body = $('#texto').val().trim();

            if (assunto == '' || nome == '' || email == '' || body == '') {
                $('#errorMsgEmail').html('Por favor, para que o email seja enviado preencha todos os dados!');
                $('#errorMsgEmail').fadeIn();
                return;
            }

            $.ajax({
                type: "POST",
                url: "index.aspx/sendEmailFromTemplate",
                data: '{"assunto":"' + assunto + '", "nome":"' + nome + '", "email":"' + email + '", "body":"' + body + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (res) {
                    if (res.d != null) {
                        if (parseInt(res.d) >= 0) {
                            $('#assunto').val('');
                            $('#nome').val('');
                            $('#email').val('');
                            $('#texto').val('');
                            $('#errorMsgEmail').fadeOut();
                            $("#successMsgEmail").html('O seu contacto foi enviado com sucesso! Tentaremos responder o mais brevemenete possível. Obrigado!');
                            $("#successMsgEmail").fadeIn();
                            setTimeout(function () { $("#successMsgEmail").fadeOut(); }, 5000);
                        }
                        else {
                            $('#errorMsgEmail').html('Ocorreu um erro ao enviar o seu contacto. Por favor, tente novamente. Obrigado!');
                            $('#errorMsgEmail').fadeIn();
                        }
                    }
                }
            });
        }

        function showPortfolio(year) {
            if ($('.ano' + year).is(":visible")) {
                $('.ano' + year).fadeOut();
            }
            else {
                $('.ano' + year).fadeIn();
            }
        }

        function selectLanguage(language) {
            window.open(getUrlPage(language), '_self');
        }

        function getUrlPage(language) {
            if (window.location.href.includes('localhost')) {
                var url = window.location.href;

                if (url.includes('language=')) {
                    url = url.replace('=' + $('#txtAuxLanguage').html(), '=' + language);
                }
                else {
                    url = url + "?language=" + language;
                }

                return url;
            }

            return $('#txtAuxUrl').html() + "/index.aspx?language=" + language;
        }

        function setLanguage() {
            if ($('#txtAuxLanguage').html() == 'PT') {
                $('#btnLanguage').addClass('pt');
            }
            else if ($('#txtAuxLanguage').html() == 'EN') {
                $('#btnLanguage').addClass('en');
            }
            else if ($('#txtAuxLanguage').html() == 'FR') {
                $('#btnLanguage').addClass('fr');
            }
            else if ($('#txtAuxLanguage').html() == 'ES') {
                $('#btnLanguage').addClass('es');
            }

            var h = $('#logoTopBar').height();
            $('#btnLanguage').css({ "height": h, "width": "auto !important" });
        }

        function openLanguagesMenu() {
            $('#overlayLanguages').fadeIn();
            $('#divLanguages').fadeIn();
        }

        function closeLanguagesMenu() {
            $('#overlayLanguages').fadeOut();
            $('#divLanguages').fadeOut();
        }
    </script>
</body>
</html>
