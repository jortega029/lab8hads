﻿Imports System.Data.SqlClient
Imports System.Security.Cryptography
Imports AccesoDatos.AccesoDatosSQL
Public Class admin
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim usuario = Session("Usuario")
        Label3.Text = "Bienvenido/a " & usuario
    End Sub

    Protected Sub LinkButton1_Click(sender As Object, e As EventArgs) Handles LinkButton1.Click
        Session.Clear()
        System.Web.Security.FormsAuthentication.SignOut()
        Response.Redirect("Inicio.aspx")
    End Sub
End Class