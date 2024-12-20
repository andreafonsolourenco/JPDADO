<%@ Page Language="C#" AutoEventWireup="true" CodeFile="config_ficha_portfolio.aspx.cs" Inherits="config_ficha_portfolio" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Grilo Car Service Software - Ficha de Portfolio">
    <meta name="author" content="André Lourenço">
    <title>Grilo Car Service Software - Ficha de Portfolio</title>
    <!-- Favicon -->
    <link href="../Img/favicon.ico" rel="icon" type="image/ico">
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
    <!-- Icons -->
    <link href="../general/assets/vendor/nucleo/css/nucleo.css" rel="stylesheet">
    <link href="../general/assets/vendor/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">
    <!-- Argon CSS -->
    <link type="text/css" href="../general/assets/css/argon.css?v=1.0.0" rel="stylesheet">
    <link href="../vendors/sweetalert2/sweetalert2.min.css" rel="stylesheet" />
    <link type="text/css" href="../alertify/css/alertify.min.css" rel="stylesheet" />
    <link type="text/css" href="../alertify/css/themes/default.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.css">

    <style>
        #divLoading {
            border: solid 3px gray;
            z-index: 999999999999999999999999;
            position: absolute;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            margin: auto;
            background-color: white;
            height: 350px;
            width: 61%;
        }

        #overlay {
            position: fixed; /* Sit on top of the page content */
            display: none; /* Hidden by default */
            width: 100%; /* Full width (cover the whole page) */
            height: 100%; /* Full height (cover the whole page) */
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(0,0,0,0.5); /* Black background with opacity */
            z-index: 2; /* Specify a stack order in case you're using a different order for other elements */
            cursor: pointer; /* Add a pointer on hover */
        }


        .col-xl-8 {
            max-width: 99%;
            flex: 0 0 99%;
        }

        .pointer {
            cursor: pointer;
        }

        .autocomplete-items {
            position: absolute;
            border: 1px solid #d4d4d4;
            border-bottom: none;
            border-top: none;
            z-index: 99;
            /*position the autocomplete items to be the same width as the container:*/
            top: 100%;
            left: 0;
            right: 0;
        }

            .autocomplete-items div {
                padding: 10px;
                cursor: pointer;
                background-color: #fff;
                border-bottom: 1px solid #d4d4d4;
            }

                .autocomplete-items div:hover {
                    /*when hovering an item:*/
                    background-color: #e9e9e9;
                }

        .autocomplete-active {
            /*when navigating through the items using the arrow keys:*/
            background-color: DodgerBlue !important;
            color: #ffffff;
        }

        .auto_height {
            width: 100%;
        }

        .bg-gradient-primary {
            background: linear-gradient(87deg, #7DC7A4, #7DC7A4 100%) !important;
        }

        .bg-gradient-default {
            background: linear-gradient(87deg, #43635B, #43635B 100%) !important;
        }

        .btn-default
        {
            color: #fff !important;
            border-color: #9c080f !important;
            background-color: #9c080f !important;
            box-shadow: 0 4px 6px rgba(50, 50, 93, .11), 0 1px 3px rgba(0, 0, 0, .08);
        }
        .btn-default:hover
        {
            color: #fff !important;
            border-color: #9c080f !important; 
            background-color: #9c080f !important;
        }

        .highlight_line {
            background-color: cornsilk;
        }

        .background_white {
            background-color: #FFF;
        }

        .margin_lines_row {
            margin-top: 10px;
            margin-bottom: 10px;
        }

        .dialogWidth {
            width: 75% !important;
            max-width: 100% !important;
        }
    </style>
</head>

<body>
    <!-- Main content -->
    <div class="main-content">

        <div id="overlay"></div>
        <div id="divLoading" class="variaveis">
            <table style="width: 100%; height: 100%; text-align: center; vertical-align: middle">
                <tr>
                    <td style="vertical-align: bottom">
                        <img src="../general/assets/img/theme/preloader.gif" />
                    </td>
                </tr>
                <tr>
                    <td style="font-size: 17px; vertical-align: top; font-weight: bold"><span id="spanLoading">A reiniciar serviço, por favor aguarde...</span></td>
                </tr>
            </table>
        </div>

        <!-- Top navbar -->
        <nav class="navbar navbar-top navbar-expand-md navbar-dark" id="navbar-main">
            <div class="container-fluid">
                <!-- Brand -->
                <a class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block" id="pageTitle">Portfolio</a>
                <!-- User -->
                <ul class="navbar-nav align-items-center d-none d-md-flex">
                    <li class="nav-item dropdown">
                        <a class="nav-link pr-0" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <div class="media align-items-center">

                                <div class="media-body ml-2 d-none d-lg-block">
                                    <span id="spanNomeUser" class="mb-0 text-sm  font-weight-bold"></span>
                                </div>
                            </div>
                        </a>
                        <div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
                            <div class=" dropdown-header noti-title">
                                <h6 id="spanOla" class="text-overflow m-0"></h6>
                            </div>



                            <div class="dropdown-divider"></div>
                            <a href="#!" class="dropdown-item" onclick="finishSession();">
                                <i class="ni ni-button-power"></i>
                                <span>Terminar sessão</span>
                            </a>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
        <!-- Header -->
        <div class="header pb-8 pt-5 pt-lg-8 d-flex align-items-center" style="min-height: 200px; background-size: cover; background-position: center top;" id="divInfo">
            <!-- Mask -->
            <span class="mask bg-gradient-primary opacity-8"></span>
            <!-- Header container -->
            <div class="container-fluid d-flex align-items-center">
                <div class="row">
                    <div class="col-lg-12 col-md-10">
                        <h1 class="display-2 text-white" id="divInfoTitle">Portfolio</h1>
                        <p class="text-white mt-0 mb-5" id="divInfoSubTitle">Crie / Edite o seu portfolio</p>
                    </div>
                </div>
            </div>
        </div>
        <!-- Page content -->
        <div class="container-fluid mt--7">
            <div class="row">

                <div class="col-xl-8 order-xl-1">
                    <div class="card bg-secondary shadow">
                        <div class="card-header bg-white border-0">
                            <div class="row align-items-center">
                                <table style="width: 100%; margin-left: 15px">
                                    <tr>
                                        <td style="width: 90%">
                                            <h3 class="mb-0">Portfolio</h3>
                                        </td>
                                        <td style="width: 10%; text-align: right">
                                            <img src='../general/assets/img/theme/setae.png' style='width: 30px; height: 30px; cursor: pointer; margin-left: 10px;' alt='Back' title='Back' onclick='retroceder();'/>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="card-body" id="divGrelha">
                            <div class="row">
                                <table style="width: 100%; margin-left: 15px;">
                                    <tr>
                                        <td style="width: 90%">
                                            <h6 class="heading-small text-muted mb-4 pointer" onclick="showHidePortfolioType();">TIPO DE PORTFOLIO</h6>
                                        </td>
                                        <td style="width: 10%; text-align: right">
                                            <img src='../Img/search_icon.png' style='width: 30px; height: 30px; cursor: pointer; margin-left: 10px;' alt='Pesquisar Tipo de Portfolio' title='Pesquisar Tipo de Portfolio' onclick='getPortfolioTypeList(false);'/>
                                        </td>
                                    </tr>
                                </table>
                            </div>                            

                            <div class="row" id="portfolioTypePTEN">
                                 <div class="col-md-6">
                                     <div class="form-group">
                                         <label class="form-control-label" for="txtTipo">Tipo</label>
                                         <input type="text" id="txtTipo" class="form-control form-control-alternative" placeholder="Tipo">
                                     </div>
                                 </div>
                                 <div class="col-md-6">
                                     <div class="form-group">
                                         <label class="form-control-label" for="txtTipoEn">Tipo (EN)</label>
                                         <input type="text" id="txtTipoEn" class="form-control form-control-alternative" placeholder="Tipo (EN)">
                                     </div>
                                 </div>
                             </div>
                             <div class="row" id="portfolioTypeFRES">
                                 <div class="col-md-6">
                                     <div class="form-group">
                                         <label class="form-control-label" for="txtTipoFr">Tipo (FR)</label>
                                         <input type="text" id="txtTipoFr" class="form-control form-control-alternative" placeholder="Tipo (FR)">
                                     </div>
                                 </div>
                                 <div class="col-md-6">
                                     <div class="form-group">
                                         <label class="form-control-label" for="txtTipoEs">Tipo (ES)</label>
                                         <input type="text" id="txtTipoEs" class="form-control form-control-alternative" placeholder="Tipo (ES)">
                                     </div>
                                 </div>
                             </div>

                            <h6 class="heading-small text-muted mb-4 pointer" onclick="showHidePortfolioData();">DADOS DO PORTFOLIO</h6>

                            <div class="row" id="portfolioCityCompanyRow">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-control-label" for="txtLocalidade">Localidade</label>
                                        <input type="text" id="txtLocalidade" class="form-control form-control-alternative" placeholder="Localidade">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-control-label" for="txtEmpresa">Empresa</label>
                                        <input type="text" id="txtEmpresa" class="form-control form-control-alternative" placeholder="Empresa">
                                    </div>
                                </div>
                            </div>

                            <div class="row" id="portfolioOrderYearRow">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-control-label" for="txtAno">Ano</label>
                                        <input type="number" id="txtAno" class="form-control form-control-alternative" placeholder="Ano">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-control-label" for="txtOrdem">Ordem</label>
                                        <input type="number" id="txtOrdem" class="form-control form-control-alternative" placeholder="Ordem">
                                    </div>
                                </div>
                            </div>

                            <div class="row" id="portfolioTextRow">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="form-control-label" for="txtTexto">Texto</label>
                                        <textarea type="text" id="txtTexto" class="form-control form-control-alternative auto_height" oninput="auto_height(this)" placeholder="Texto"></textarea>
                                    </div>
                                </div>
                            </div>

                            <div class="row" id="portfolioTextEnRow">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="form-control-label" for="txtTextoEn">Texto (EN)</label>
                                        <textarea type="text" id="txtTextoEn" class="form-control form-control-alternative auto_height" oninput="auto_height(this)" placeholder="Texto (EN)"></textarea>
                                    </div>
                                </div>
                            </div>

                            <div class="row" id="portfolioTextFrRow">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="form-control-label" for="txtTextoFr">Texto (FR)</label>
                                        <textarea type="text" id="txtTextoFr" class="form-control form-control-alternative auto_height" oninput="auto_height(this)" placeholder="Texto (FR)"></textarea>
                                    </div>
                                </div>
                            </div>

                            <div class="row" id="portfolioTextEsRow">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="form-control-label" for="txtTextoEs">Texto (ES)</label>
                                        <textarea type="text" id="txtTextoEs" class="form-control form-control-alternative auto_height" oninput="auto_height(this)" placeholder="Texto (ES)"></textarea>
                                    </div>
                                </div>
                            </div>                            

                            <div class="row" id="portfolioImageRow">
                                <div class="col-md-6" id="portfolioSelectImage">
                                    <div class="form-group" id="portfolioSelectImageFormGroup" runat="server">
                                        
                                    </div>
                                </div>
                                <div class="col-md-6" id="portfolioImageDiv">
                                    <div class="form-group" id="portfolioImageFormGroup" runat="server" style="text-align: center;">
                                        <img src="../img/portfolio/NoImg.png" style="height: 150px; width: auto" id="portfolioImage" />
                                    </div>
                                </div>
                            </div>

                            <div class="row" style="margin-top: 20px;">
                                <div class="col-md-12">
                                    <input type="button" class="btn btn-default" onclick="saveData();" value="Guardar alterações" style="width: 100%;"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Footer -->
            <footer class="footer">
                <div class="row align-items-center justify-content-xl-between">
                    <div class="col-xl-6">
                        <div class="copyright text-center text-xl-left text-muted">
                            <%--&copy; 2019, Plataforma desenvolvida por <a href="http://www.mbsolutions.pt" class="font-weight-bold ml-1" target="_blank">MBSolutions</a>--%>
                        </div>
                    </div>
                </div>
            </footer>

            <div id="hiddenVals" class="variaveis">
                <input id="txtAux" runat="server" type="text" class="variaveis" />
            </div>
        </div>
    </div>

    <!-- Argon Scripts -->
    <!-- Core -->
    <script src="../general/assets/vendor/jquery/dist/jquery.min.js"></script>
    <script src="../general/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Argon JS -->
    <script src="../general/assets/js/argon.js?v=1.0.0"></script>
    <script src="../vendors/sweetalert2/sweetalert2.min.js"></script>
    <script src="../alertify/alertify.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/locales/bootstrap-datepicker.pt.min.js"></script>
    

    <script>
        var idPortfolioTypeSelected = "";
        var portfolioTypeIDSelected = "";
        var administrador;

        $(document).ready(function () {
            loga();
            setAltura();
        });

        $(window).resize(function () {
            setAltura();
        });

        $(document).keypress(function (e) {
            if (e.which == 13) {
                checkFocus();
            }
        });

        function loga() {
            var id = localStorage.loga;

            if (id == null || id == 'null' || id == undefined || id == '') {
                swal({
                    title: "JPDADO SOFTWARE",
                    text: 'Utilizador Inválido!',
                    type: "warning",
                    showCancelButton: false,
                    confirmButtonColor: '#007351',
                    cancelButtonColor: '#d33',
                    confirmButtonText: "Confirmar"
                }).then(function () {
                    finishSession();
                });
                return;
            }

            $.ajax({
                type: "POST",
                url: "index.aspx/trataExpiracao",
                data: '{"i":"' + id + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (res) {
                    var dados = res.d.split('<#SEP#>');
                    var ret = parseInt(dados[0]);
                    var retMsg = dados[1];
                    administrador = parseInt(dados[2]);
                    var nome = dados[3];

                    // OK
                    if (ret == 0) {
                        swal({
                            title: "JPDADO SOFTWARE",
                            text: retMsg,
                            type: "warning",
                            showCancelButton: false,
                            confirmButtonColor: '#007351',
                            cancelButtonColor: '#d33',
                            confirmButtonText: "Confirmar"
                        }).then(function () {
                            finishSession();
                        });
                        return;
                    }

                    $('#spanNomeUser').html(nome);
                    $('#spanOla').html("Olá, " + nome.split(' ')[0] + "!");
                    getData();
                }
            });
        }

        function setAltura() {
            $("#fraContent").height($(window).height());
        }

        function defineTablesMaxHeight() {
            var windowHeight = $(window).height();
            var divInfoHeight = $('#divInfo').height();
            var navbarHeight = $('#navbar-main').height();
            var maxHeight = windowHeight - divInfoHeight - navbarHeight - 200;

            $('#divGrelha').css({ "maxHeight": maxHeight + "px" });
        }

        function getPortfolioTypeList(open) {
            var search = "";
            var tablePortfolioType = "";

            if (open) {
                search = $('#portfolioTypeSearchBar').val().trim();
            }

            $.ajax({
                type: "POST",
                url: "config_ficha_portfolio.aspx/getPortfolioTypesList",
                data: '{"search":"' + search + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (res) {
                    if (open) {
                        $('#divDialogSearchPortfolioType').html(res.d);
                    }
                    else {
                        tablePortfolioType = '<div id="divDialogSearchPortfolioType">' + res.d + '</div>';
                        openSearchPortfolioType(tablePortfolioType);
                    }
                }
            });
        }

        function openSearchPortfolioType(val) {
            swal({
                title: "<strong>TIPO DE PORTFOLIO</strong>",
                html: val,
                customClass: 'dialogWidth',
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Confirmar",
                cancelButtonText: "Cancelar"
            }).then(function (isConfirm) {
                if (isConfirm) {
                    if (portfolioTypeIDSelected > 0) {
                        getPortfolioTypeData('');
                    }
                    else {
                        openSearchPortfolioType(val);
                    }
                }
            });
        }

        function selectPortfolioTypeRow(id, i) {
            if (id == portfolioTypeIDSelected) {
                portfolioTypeIDSelected = "0";
                $('#portfolioTypeLine' + i).removeClass('highlight_line');
                return;
            }

            var total = parseInt($('#countPortfolioTypes').html());

            for (let x = 0; x < total; x++) {
                $('#portfolioTypeLine' + x).removeClass('highlight_line');
            }

            portfolioTypeIDSelected = id;
            $('#portfolioTypeLine' + i).addClass('highlight_line');
        }

        function getPortfolioTypeData(name) {
            $.ajax({
                type: "POST",
                url: "config_ficha_portfolio.aspx/getPortfolioTypeData",
                data: '{"id":"' + portfolioTypeIDSelected + '","name":"' + name + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (res) {
                    var dados = res.d.split('<#SEP#>');

                    var tipo = dados[0];
                    var tipoEn = dados[1]
                    var tipoFr = dados[2];
                    var tipoEs = dados[3];

                    $('#txtTipo').val(tipo);
                    $('#txtTipoEn').val(tipoEn);
                    $('#txtTipoFr').val(tipoFr);
                    $('#txtTipoEs').val(tipoEs);

                    portfolioTypeIDSelected = "";
                    $('#txtLocalidade').focus();
                }
            });
        }

        function onSelectImageChange() {
            var img = $('#selectImg option:selected').val();

            if (img == 'default') {
                $('#portfolioImage').attr('src', '../img/portfolio/NoImg.png');
            }
            else {
                $('#portfolioImage').attr('src', '../img/portfolio/' + img);
            }
        }

        function getData() {
            loadingOn('A carregar dados!<br />Por favor aguarde...');
            var id = $('#txtAux').val();
            if (id != null && id != 'null' && id != '') {
                $.ajax({
                    type: "POST",
                    url: "config_ficha_portfolio.aspx/getData",
                    data: '{"id":"' + id + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (res) {
                        var dados = res.d.split('<#SEP#>');

                        // Prepara o retorno dos dados
                        var localidade = dados[0];
                        var texto = dados[1];
                        var texto_en = dados[2];
                        var texto_fr = dados[3];
                        var texto_es = dados[4];
                        var empresa = dados[5];
                        var id_tipo = dados[6];
                        var tipo = dados[7];
                        var tipo_en = dados[8];
                        var tipo_fr = dados[9];
                        var tipo_es = dados[10];
                        var img = dados[11];
                        var ordem = dados[12];
                        var ano = dados[13];

                        $('#txtTipo').val(tipo);
                        $('#txtTipoEn').val(tipo_en);
                        $('#txtTipoFr').val(tipo_fr);
                        $('#txtTipoEs').val(tipo_es);
                        $('#txtLocalidade').val(localidade);
                        $('#txtEmpresa').val(empresa);
                        $('#txtAno').val(ano);
                        $('#txtOrdem').val(ordem);
                        $('#txtTexto').val(texto);
                        $('#txtTextoEn').val(texto_en);
                        $('#txtTextoFr').val(texto_fr);
                        $('#txtTextoEs').val(texto_es);

                        if (img == '') {
                            $('#selectImg').val('default').change();
                            $('#portfolioImage').attr('src', '../img/portfolio/NoImg.png');
                        }
                        else {
                            $('#selectImg').val(img).change();
                            $('#portfolioImage').attr('src', '../img/portfolio/' + img);
                        }
                    }
                });
            }
            else {
                $('#txtTipo').val('');
                $('#txtTipoEn').val('');
                $('#txtTipoFr').val('');
                $('#txtTipoEs').val('');
                $('#txtLocalidade').val('');
                $('#txtEmpresa').val('');
                $('#txtAno').val('');
                $('#txtOrdem').val('');
                $('#txtTexto').val('');
                $('#txtTextoEn').val('');
                $('#txtTextoFr').val('');
                $('#txtTextoEs').val('');
                $('#selectImg').val('default').change();
                $('#portfolioImage').attr('src', '../img/portfolio/NoImg.png');
            }

            loadingOff();
        }

        function saveData() {
            var id = $('#txtAux').val();
            var xml = '';
            var tipo = $('#txtTipo').val();
            var tipoEn = $('#txtTipoEn').val();
            var tipoFr = $('#txtTipoFr').val();
            var tipoEs = $('#txtTipoEs').val();
            var localidade = $('#txtLocalidade').val();
            var empresa = $('#txtEmpresa').val();
            var ano = $('#txtAno').val();
            var ordem = $('#txtOrdem').val();
            var texto = $('#txtTexto').val();
            var textoEn = $('#txtTextoEn').val();
            var textoFr = $('#txtTextoFr').val();
            var textoEs = $('#txtTextoEs').val();
            var img = $('#selectImg option:selected').val();

            if (id == null || id == 'null' || id == '') {
                id = '0';
            }

            if (tipo == '' || tipo == null || tipo == undefined) {
                sweetAlertWarning('Tipo de Portfolio', 'Por favor indique o tipo de portfolio');
                return;
            }
            else if (localidade == '' || localidade == null || localidade == undefined) {
                sweetAlertWarning('Localidade do Portfolio', 'Por favor indique a localidade do portfolio');
                return;
            }
            else if (ano == '' || ano == null || ano == undefined || parseInt(ano) < 0) {
                sweetAlertWarning('Ano do Portfolio', 'Por favor indique o ano do portfolio');
                return;
            }
            else if (ordem == '' || ordem == null || ordem == undefined || parseInt(ordem) < 0) {
                sweetAlertWarning('Ordem do Portfolio', 'Por favor indique a ordem do portfolio');
                return;
            }
            else if (texto == '' || texto == null || texto == undefined) {
                sweetAlertWarning('Texto do Portfolio', 'Por favor indique o texto do portfolio');
                return;
            }
            else if (tipoEn == '' || tipoEn == null || tipoEn == undefined || tipoEn.length === 0) {
                tipoEn = '';
            }
            else if (tipoFr == '' || tipoFr == null || tipoFr == undefined || tipoFr.length === 0) {
                tipoFr = '';
            }
            else if (tipoEs == '' || tipoEs == null || tipoEs == undefined || tipoEs.length === 0) {
                tipoEs = '';
            }
            else if (textoEn == '' || textoEn == null || textoEn == undefined || textoEn.length === 0) {
                textoEn = '';
            }
            else if (textoFr == '' || textoFr == null || textoFr == undefined || textoFr.length === 0) {
                textoFr = '';
            }
            else if (textoEs == '' || textoEs == null || textoEs == undefined || textoEs.length === 0) {
                textoEs = '';
            }
            else if (empresa == '' || empresa == null || empresa == undefined || empresa.length === 0) {
                empresa = '';
            }
            else if (img == '' || img == null || img == undefined || img.length === 0 || img == 'default' || img == 'noImage.png') {
                img = '';
            }

            xml += '<PORTFOLIO>';
            xml += '<ID>' + id + '</ID>';
            xml += '<TEXTO>' + texto + '</TEXTO>';
            xml += '<TEXTO_EN>' + textoEn + '</TEXTO_EN>';
            xml += '<TEXTO_FR>' + textoFr + '</TEXTO_FR>';
            xml += '<TEXTO_ES>' + textoEs + '</TEXTO_ES>';
            xml += '<ORDEM>' + ordem + '</ORDEM>';
            xml += '<IMG>' + img + '</IMG>';
            xml += '<ANO>' + ano + '</ANO>';
            xml += '<LOCALIDADE>' + localidade + '</LOCALIDADE>';
            xml += '<EMPRESA>' + empresa + '</EMPRESA>';
            xml += '<TIPO_PORTFOLIO>';
            xml += '<TIPO>' + tipo + '</TIPO>';
            xml += '<TIPO_EN>' + tipoEn + '</TIPO_EN>';
            xml += '<TIPO_FR>' + tipoFr + '</TIPO_FR>';
            xml += '<TIPO_ES>' + tipoEs + '</TIPO_ES>';
            xml += '</TIPO_PORTFOLIO>';
            xml += '</PORTFOLIO>';

            $.ajax({
                type: "POST",
                url: "config_ficha_portfolio.aspx/saveData",
                data: '{"idUser":"' + localStorage.loga + '","xml":"' + xml + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (res) {
                    var dados = res.d.split('<#SEP#>');

                    if (parseInt(dados[0]) < 0) {
                        sweetAlertError('PORTFOLIO', dados[1]);
                    }
                    else {
                        loadUrl("lista_portfolio.aspx");
                    }
                }
            });
        }


        function loadUrl(url) {
            window.location = url;
        }

        function retroceder() {
            swal({
                title: "SAIR",
                text: "Tem a certeza que pretende sair? Todos os dados serão perdidos.",
                type: 'question',
                showCancelButton: true,
                confirmButtonColor: '#007351',
                cancelButtonColor: '#d33',
                confirmButtonText: "Confirmar",
                cancelButtonText: "Cancelar"
            }).then(function (isConfirm) {
                if (isConfirm) {
                    loadUrl('lista_portfolio.aspx');
                }
            });
        }

        function confirmSave() {
            swal({
                title: "GUARDAR",
                text: "Tem a certeza que deseja guardar a informação?",
                type: "question",
                showCancelButton: true,
                confirmButtonColor: '#007351',
                cancelButtonColor: '#d33',
                confirmButtonText: "Confirmar",
                cancelButtonText: "Cancelar"
            }).then(function (isConfirm) {
                if (isConfirm) {
                    saveData();
                }
            });
        }

        function loadingOn(msg) {
            overlayOn();
            $('#spanLoading').html(msg);
            $('#divLoading').show();
        }

        function loadingOff() {
            overlayOff();
            $('#divLoading').hide();
        }

        function overlayOn() {
            overlayOff();
            document.getElementById("overlay").style.display = "block";
        }

        function overlayOff() {
            document.getElementById("overlay").style.display = "none";
        }

        function sweetAlertBasic(msg) {
            swal(msg);
        }

        function sweetAlertError(subject, msg) {
            swal(
                subject,
                msg,
                'error'
            )
        }

        function sweetAlertInfo(subject, msg) {
            swal(
                subject,
                msg,
                'info'
            )
        }

        function sweetAlertWarning(subject, msg) {
            swal(
                subject,
                msg,
                'warning'
            )
        }

        function sweetAlertSuccess(subject, msg) {
            swal(
                subject,
                msg,
                'success'
            )
        }

        function sweetAlertQuestion(subject, msg) {
            swal(
                subject,
                msg,
                'question'
            )
        }

        function showHidePortfolioType() {
            if ($('#portfolioTypePTEN').is(":visible")) {
                $('#portfolioTypePTEN').fadeOut();
                $('#portfolioTypeFRES').fadeOut();
            }
            else {
                $('#portfolioTypePTEN').fadeIn();
                $('#portfolioTypeFRES').fadeIn();
            }
        }

        function showHidePortfolioData() {
            if ($('#portfolioCityCompanyRow').is(":visible")) {
                $('#portfolioCityCompanyRow').fadeOut();
                $('#portfolioOrderYearRow').fadeOut();
                $('#portfolioTextRow').fadeOut();
                $('#portfolioTextEnRow').fadeOut();
                $('#portfolioTextFrRow').fadeOut();
                $('#portfolioTextEsRow').fadeOut();
            }
            else {
                $('#portfolioCityCompanyRow').fadeIn();
                $('#portfolioOrderYearRow').fadeIn();
                $('#portfolioTextRow').fadeIn();
                $('#portfolioTextEnRow').fadeIn();
                $('#portfolioTextFrRow').fadeIn();
                $('#portfolioTextEsRow').fadeIn();
            }
        }

        function auto_height(elem) {  /* javascript */
            elem.style.height = "1px";
            elem.style.height = (elem.scrollHeight) + "px";
        }
    </script>
</body>

</html>
