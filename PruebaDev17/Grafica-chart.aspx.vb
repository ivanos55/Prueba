
Imports DevExpress.Web

Public Class WebForm1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub


    Private Sub CB_holaMundo_Callback(source As Object, e As CallbackEventArgs) Handles CB_holaMundo.Callback
        Dim cadena As String = "Estados Unidos,Panamá,Canadá,El Salvador,Otros;256,88,77,22,0;$DIM$00:00,01:00,02:00,03:00,04:00,05:00,06:00,07:00,08:00,09:00,10:00,11:00,12:00,13:00,14:00,15:00,16:00,17:00,18:00,19:00,20:00,21:00,22:00,23:00;0,0,0,0,0,0,0,0,0,0,40,130,120,110,0,0,0,0,0,0,0,0,0,0;"
        e.Result = cadena

    End Sub

End Class