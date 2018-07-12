
Imports DevExpress.Web

Public Class WebForm1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub


    Private Sub CB_holaMundo_Callback(source As Object, e As CallbackEventArgs) Handles CB_holaMundo.Callback
        Dim cadena As String = "verde,cafe,morado,naranja,azul,rojo;10,2,7,19,15,8,12,5"

        e.Result = cadena

    End Sub

End Class