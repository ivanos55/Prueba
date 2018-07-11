<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="WebForm1.aspx.vb" Inherits="WebApplication1.WebForm1" %>

<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="charts/Chart.bundle.js"></script>
    <script src="charts/Chart.bundle.min.js"></script>
    <script type="text/javascript">
        var d1, d2, d3, d4, d5, d6;
        var array_labels = [];

        function HazCallback() {
            CB.PerformCallback();
        }
        function OnCallbackComplete(s, e) {

            var results = e.result.split(",");

            results.forEach(function (element) {
                array_labels.push(element);
            });

            d1 = results[0];
            d2 = results[1];
            d3 = results[2];
            d4 = results[3];
            d5 = results[4];
            d6 = results[5];

            graficabar();

        }

        var etiquetas = ["rojo", "azul", "amarillo", "verde", "morado", "naranja"];

        function graficabar() {

            var ctx = document.getElementById("myChart");
            var myChart = new Chart(ctx, {
                type:'bar',
                data: {
                    labels: array_labels,
                    datasets: [{
                        label: '# votos',
                        data: [d1, d2, d3, d4, d5, d6],
                        backgroundColor: [
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(255, 206, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(255, 159, 64, 0.2)'
                        ],
                        borderColor: [
                            'rgba(255,99,132,1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 206, 86, 1)',
                            'rgba(75, 192, 192, 1)',
                            'rgba(153, 102, 255, 1)',
                            'rgba(255, 159, 64, 1)'
                        ],
                        borderWidth: 1
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
</head>
<body>
    <form id="form1" runat="server">
        <div style="position: center; height: 50%; width: 50%">

            <a href="javascript:HazCallback()" style="float: left;">Dale!</a>

            <%--<button id="Actualizar" onclick=" actualizarfun">Actualizar</button>--%>

            <dx:ASPxCallback ID="CB_holaMundo" runat="server" ClientInstanceName="CB">
                <ClientSideEvents CallbackComplete="OnCallbackComplete" />
            </dx:ASPxCallback>

            <canvas id="myChart"></canvas>

        </div>
    </form>
</body>
</html>
