
Imports DevExpress.Web

Public Class WebForm1
    Inherits System.Web.UI.Page


    Private Sub CB_holaMundo_Callback(source As Object, e As CallbackEventArgs) Handles CB_holaMundo.Callback
        Dim cadena As String = "10,2,7,19,15,8,12,5,;,verde,cafe,morado,naranja,azul,rojo"

        e.Result = cadena

    End Sub

End Class