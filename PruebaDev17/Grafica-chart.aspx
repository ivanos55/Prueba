<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Grafica-chart.aspx.vb" Inherits="PruebaDev17.WebForm1" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="charts/Chart.bundle.js"></script>
    <script src="charts/Chart.bundle.min.js"></script>
    <script type="text/javascript">
        
        var puntocoma = [];
        var puntocoma2 = [];
        var amper = [];
        var nombres = [];
        var valores = [];
        var nombres2 = [];
        var valores2 = [];

        function HazCallback() {
            CB.PerformCallback();
        }
        function OnCallbackComplete(s, e) {

            amper = e.result.split("$DIM$");
            puntocoma = amper[0].split(";");
            puntocoma2 = amper[1].split(";");

            nombres = puntocoma[0].split(",");
            valores = puntocoma[1].split(",");

            nombres2 = puntocoma2[0].split(",");
            valores2 = puntocoma2[1].split(",");

            graficachart();

        }

        function graficachart() {

            var ctx = document.getElementById('myChart').getContext('2d');
            var purple_orange_gradient = ctx.createLinearGradient(0, 0, 0, 600);
            var blue_gradient = ctx.createLinearGradient(0, 0, 0, 700);
            purple_orange_gradient.addColorStop(0, 'orange');
            purple_orange_gradient.addColorStop(1, 'purple');


            var myChart = new Chart(ctx, {
                type:'bar',
                data: {
                    labels: nombres,
                    datasets: [{
                        label: '# de barras',
                        data: valores,
                        backgroundColor: purple_orange_gradient,
                        borderWidth: 2,
                        hoverBackgroundColor: purple_orange_gradient,
                        hoverBorderWidth: 2,
                        hoverBorderColor: 'purple'

                    }, {
                        label: '# de area',
                        data: valores,
                        backgroundColor: blue_gradient,
                        type: 'line'

                    }]
                },
                options: {
                    title: {
                        display: true,
                        text: 'Tabla analitica.'
                    }
                }
            });
                        
        }

    </script>
    <style type="text/css">
        .col-sm {
            height: 152px;
            width: 689px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="position: center; height: 50%; width: 50%">

            <a href="javascript:HazCallback()" style="float: left;">Dale!</a>

            <dx:ASPxCallback ID="CB_holaMundo" runat="server" ClientInstanceName="CB">
                <ClientSideEvents CallbackComplete="OnCallbackComplete" />
            </dx:ASPxCallback>
            
            <canvas id="myChart"></canvas>

        </div>
    </form>
</body>
</html>
