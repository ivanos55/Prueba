<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="WebForm1.aspx.vb" Inherits="PruebaDev17.WebForm1" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="charts/Chart.bundle.js"></script>
    <script src="charts/Chart.bundle.min.js"></script>
    <script type="text/javascript">


        //var text = '{label:"# Votos",' +
        //    'data: [1,2,6,7,3],' +
        //    'backgroundColor: [' +
        //        '"rgba(255, 99, 132, 0.2)", ' +
        //        '"rgba(54, 162, 235, 0.2)", ' +
        //        '"rgba(255, 206, 86, 0.2)", ' +
        //        '"rgba(75, 192, 192, 0.2)", ' +
        //        '"rgba(153, 102, 255, 0.2)",' +
        //        '"rgba(255, 159, 64, 0.2)"],' +
        //    'borderColor: [' +
        //        '"rgba(255,99,132,1)",     ' +
        //        '"rgba(54, 162, 235, 1)",  ' +
        //        '"rgba(255, 206, 86, 1)",  ' +
        //        '"rgba(75, 192, 192, 1)",  ' +
        //        '"rgba(153, 102, 255, 1)", ' +
        //        '"rgba(255, 159, 64, 1)],borderWidth: 1}'

 //       var text = '{"label":"# Votos","data":["1","2","6","7","3"],"employees":[' +
 //'{"firstName":"John","lastName":"Doe" },' +
 //'{"firstName":"Anna","lastName":"Smith" },' +
        //'{"firstName":"Peter","lastName":"Jones" }]}';

        var obj = new Object();
        obj.label = "# Votos";
        obj.data = [10, 20, 30, 45, 23, 67];
        obj.backgroundColor = [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
        ];
        obj.borderColor = [
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
        ];
        obj.borderWidth = 1;
        obj = JSON.parse(JSON.stringify(obj));

        var obj2 = new Object();
        obj2.type = 'line';
        obj2.label = "otro";
        obj2.borderColor = [
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
        ];
        obj2.borderWidth =  2;
        obj2.fill = false;
        obj2.data = [32,44,56,15,32,77];
        obj2 = JSON.parse(JSON.stringify(obj2));

        var datas = [];
        datas[0] = obj;
        datas[1] = obj2;
        
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
                    datasets: datas
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
        
<p id="demo"></p>
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
