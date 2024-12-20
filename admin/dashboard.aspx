﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dashboard.aspx.cs" Inherits="dashboard" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="JPDado Software - Dashboard">
    <meta name="author" content="André Lourenço">
    <title>JPDado Software - Dashboard</title>
    <!-- Favicon -->
    <link href="../Img/favicon.ico" rel="icon" type="image/ico">
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
    <!-- Icons -->
    <link href="../general/assets/vendor/nucleo/css/nucleo.css" rel="stylesheet">
    <link href="../general/assets/vendor/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">
    <!-- Argon CSS -->
    <link type="text/css" href="../general/assets/css/argon.css?v=1.0.0" rel="stylesheet">

    <style>
        .bg-gradient-primary {
            background: linear-gradient(87deg, #7DC7A4, #7DC7A4 100%) !important;
        }

        .bg-gradient-default {
            background: linear-gradient(87deg, #43635B, #43635B 100%) !important;
        }
    </style>
</head>

<body>

    <!-- Main content -->
    <div class="main-content">
        <!-- Top navbar -->
        <nav class="navbar navbar-top navbar-expand-md navbar-dark" id="navbar-main">
            <div class="container-fluid">
                <!-- Brand -->
                <a class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block">Dashboard</a>
                <!-- Form -->
                <form class="navbar-search navbar-search-dark form-inline mr-3 d-none d-md-flex ml-lg-auto">
                    <div class="form-group mb-0">
                        <div class="input-group input-group-alternative">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-search"></i></span>
                            </div>
                            <input class="form-control" placeholder="Pesquisar" type="text">
                        </div>
                    </div>
                </form>
                <!-- User -->
                <ul class="navbar-nav align-items-center d-none d-md-flex pointer">
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
                            <a onclick="finishSession();" class="dropdown-item">
                                <i class="ni ni-button-power"></i>
                                <span>Terminar sessão</span>
                            </a>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>




        <!-- Header -->
        <div class="header bg-gradient-primary pb-8 pt-5 pt-md-8">
            <div class="container-fluid">
                <div class="header-body">
                    <!-- Card stats -->
                    <div class="row">
                        <div class="col-xl-6 col-lg-6" id="header1">
                            <div class="card card-stats mb-4 mb-xl-0">
                                <div class="card-body">
                                    <div class="row" id="subheader1">
                                        <div class="col">
                                            <h5 id="label1" class="card-title text-uppercase text-muted mb-0"></h5>
                                            <span id="total1" class="h2 font-weight-bold mb-0"></span>
                                        </div>
                                        <div class="col-auto">
                                            <div class="icon icon-shape bg-gradient-primary text-white rounded-circle shadow">
                                                <i class="fas fa-building"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <p class="mt-3 mb-0 text-muted text-sm">
                                        <span id="rodape1" class="text-nowrap"></span>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-6 col-lg-6" id="header2">
                            <div class="card card-stats mb-4 mb-xl-0">
                                <div class="card-body">
                                    <div class="row" id="subheader2">
                                        <div class="col">
                                            <h5 id="label2" class="card-title text-uppercase text-muted mb-0"></h5>
                                            <span id="total2" class="h2 font-weight-bold mb-0"></span>
                                        </div>
                                        <div class="col-auto">
                                            <div class="icon icon-shape bg-gradient-default text-white rounded-circle shadow">
                                                <i class="fas fa-image"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <p class="mt-3 mb-0 text-muted text-sm">
                                        <span id="rodape2" class="text-nowrap"></span>
                                    </p>
                                </div>
                            </div>
                        </div>
<%--                        <div class="col-xl-3 col-lg-6" id="header3">
                            <div class="card card-stats mb-4 mb-xl-0">
                                <div class="card-body">
                                    <div class="row" id="subheader3">
                                        <div class="col">
                                            <h5 id="label3" class="card-title text-uppercase text-muted mb-0"></h5>
                                            <span id="total3" class="h2 font-weight-bold mb-0"></span>
                                        </div>
                                        <div class="col-auto">
                                            <div class="icon icon-shape bg-info text-white rounded-circle shadow">
                                                <i class="fas fa-car"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <p class="mt-3 mb-0 text-muted text-sm">
                                        <span id="rodape3" class="text-nowrap"></span>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-6" id="header4">
                            <div class="card card-stats mb-4 mb-xl-0">
                                <div class="card-body">
                                    <div class="row" id="subheader4">
                                        <div class="col">
                                            <h5 id="label4" class="card-title text-uppercase text-muted mb-0"></h5>
                                            <span id="total4" class="h2 font-weight-bold mb-0"></span>
                                        </div>
                                        <div class="col-auto">
                                            <div class="icon icon-shape bg-warning text-white rounded-circle shadow">
                                                <i class="fas fa-screwdriver"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <p class="mt-3 mb-0 text-muted text-sm">
                                        <span id="rodape4" class="text-nowrap"></span>
                                    </p>
                                </div>
                            </div>
                        </div>--%>
                    </div>
                </div>
            </div>
        </div>



        <!-- Page content -->
        <div class="container-fluid mt--7">
            <div class="row">
                <div class="col-xl-12 mb-5 mb-xl-0">
                    <div class="card bg-gradient-default shadow">
                        <div class="card-header bg-transparent">
                            <div class="row align-items-center">
                                <div class="col">
                                    <h6 class="text-uppercase text-light ls-1 mb-1">Obras Efetuadas</h6>
                                    <h2 class="text-white mb-0">Obras Efetuadas por ano</h2>
                                </div>
                                <div class="col">
                                    <ul class="nav nav-pills justify-content-end"></ul>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <!-- Chart -->
                            <div class="chart">
                                <!-- Chart wrapper -->
                                <canvas id="dashboard-graphic" class="chart-canvas"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row mt-5">
                <div class="col-xl-12 mb-5 mb-xl-0">
                    <div class="card shadow">
                        <div class="card-header border-0">
                            <div class="row align-items-center">
                                <div class="col">
                                    <h3 class="mb-0 text-default">Nº de Obras por Ano</h3>
                                </div>
                            </div>
                        </div>
                        <div id="divObrasAno" class="table-responsive"></div>
                    </div>
                </div>
            </div>

             <%--<div class="row mt-5">
                <div class="col-xl-12 mb-5 mb-xl-0">
                    <div class="card shadow">
                        <div class="card-header border-0">
                            <div class="row align-items-center">
                                <div class="col">
                                    <h3 class="mb-0" style="color: #FB6340" runat="server" id="titleTableMesSeguinte"></h3>
                                </div>
                            </div>
                        </div>
                        <div id="divReparacoesMesSeguinte" class="table-responsive"></div>
                    </div>
                </div>
            </div>--%>

            <%--<div class="row mt-5">
                <div class="col-xl-12 mb-5 mb-xl-0">
                    <div class="card shadow">
                        <div class="card-header border-0">
                            <div class="row align-items-center">
                                <div class="col">
                                    <h3 class="mb-0" style="color: red">MÁQUINAS DESLIGADAS</h3>
                                </div>
                            </div>
                        </div>
                        <div id="divGrelhaMaquinasDesligadas" class="table-responsive">
                            <!-- Projects table -->

                        </div>
                    </div>
                </div>
            </div>--%>

            <!-- Footer -->
            <footer class="footer">
                <%-- <div class="row align-items-center justify-content-xl-between">
          <div class="col-xl-6">
            <div class="copyright text-center text-xl-left text-muted">
              &copy; 2019, Plataforma desenvolvida por <a href="http://www.xxxx.pt" class="font-weight-bold ml-1" target="_blank">xxxx</a>
            </div>
          </div>
        </div>--%>
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
    <!-- Optional JS -->
    <script src="../general/assets/vendor/chart.js/dist/Chart.min.js"></script>
    <script src="../general/assets/vendor/chart.js/dist/Chart.extension.js"></script>
    <!-- Argon JS -->
    <script src="../general/assets/js/argon.js?v=1.0.0"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    

    <script>

        $(document).ready(function () {
            loga();
            setAltura();
            getTotals();
            //getPermissions();
            makeChart();

            getObrasPorAno();
        });

        $(window).resize(function () {
            setAltura();
        });

        function setAltura() {
            $("#fraContent").height($(window).height());
        }

        function loga() {
            var id = localStorage.loga;
            $('#txtAux').val(id);

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
                    var administrador = parseInt(dados[2]);
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
                }
            });
        }

        function loadUrl(url) {
            window.location = url;
        }

        function finishSession() {
            window.top.location = "../general/login.aspx";
        }

        function getTotals() {
            var id = null;
            $.ajax({
                type: "POST",
                url: "index.aspx/getTotais",
                data: '{"id":"' + id + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (res) {
                    var dados = res.d.split('@');

                    var label1 = dados[0];
                    var total1 = dados[1];
                    var rodape1 = dados[2];

                    $('#label1').html(label1);
                    $('#total1').html(total1);
                    $('#rodape1').html(rodape1);

                    var label2 = dados[3];
                    var total2 = dados[4];
                    var rodape2 = dados[5];

                    $('#label2').html(label2);
                    $('#total2').html(total2);
                    $('#rodape2').html(rodape2);
                }
            });
        }

        function makeChart() {
            $.ajax({
                type: "POST",
                url: "dashboard.aspx/getGrafico",
                /*data: '{"idCliente":"' + id + '"}',*/
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (res) {
                    var dados = res.d.split('<#SEP#>');
                    var anos = [];
                    var nr_obras = [];

                    for (var i = 0; i < dados.length; i++) {
                        var obrasPorAno = dados[i].split('@');
                        anos[i] = obrasPorAno[0];
                        nr_obras[i] = obrasPorAno[1];
                    }

                    var $chart = $('#dashboard-graphic');
                    if ($chart.length) {
                        initChartVendas($chart, anos, nr_obras);
                    }
                }
            });
        }

        function initChartVendas($chart, anos, nr_obras) {
            var chart = new Chart($chart, {
                type: 'pie',
                data: {
                    labels: anos,
                    datasets: [{
                        backgroundColor: [
                            "white",
                            "red",
                            "green",
                            "yellow",
                            "black",
                            "blue",
                            "grey",
                            "purple"
                        ],
                        data: nr_obras
                    }]
                }
            });
        }

        function getObrasPorAno() {
            $.ajax({
                type: "POST",
                url: "dashboard.aspx/getObrasAno",
                //data: '{"idCliente":"' + id + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (res) {
                    $('#divObrasAno').html(res.d);
                }
            });
        }
    </script>
</body>

</html>
