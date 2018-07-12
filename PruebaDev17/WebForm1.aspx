<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="WebForm1.aspx.vb" Inherits="PruebaDev17.WebForm1" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="charts/Chart.bundle.js"></script>
    <script src="charts/Chart.bundle.min.js"></script>
    <script type="text/javascript">
        
        var dimension1 = [];
        var dimension1_labels = [];
        var dimension1_values = [];

        function HazCallback() {
            CB.PerformCallback();
        }
        function OnCallbackComplete(s, e) {

            dimension1 = e.result.split(";");

            dimension1_labels = dimension1[0].split(",");
            dimension1_values = dimension1[1].split(",");

            graficabar();

        }

        function graficabar() {

            var ctx = document.getElementById("myChart");
            var myChart = new Chart(ctx, {
                type:'bar',
                data: {
                    labels: dimension1_labels,
                    datasets: [{
                        label: '# votos',
                        data: dimension1_values,
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
