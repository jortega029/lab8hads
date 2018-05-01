Imports System.Net.Mail
Imports System.Security.Cryptography
Imports AccesoDatos.AccesoDatosSQL
Public Class Registrar
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub


    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim cl As New compr.Matriculas
        Dim valido As String = cl.comprobar(email.Text)

        Dim clienteContraseña As New servicioContraseña.compr
        Dim contr As String = clienteContraseña.Callcompr(psw.Text)

        If valido = "NO" Then
            QUERY.Text = "Ese usuario no está matriculado"
        Else
            If contr = "INVALIDA" Then
                QUERY.Text = "Esa contraseña es demasiado debil"
            Else
                Conectar()
                If (psw.Text = psw2.Text) Then
                    Dim res As Integer
                    Dim numConf
                    Randomize()
                    numConf = CLng(Rnd() * 9000000) + 1000000
                    Dim encriptada As String = encriptar(psw.Text)
                    res = Insertar(email.Text, nombre.Text, apellidos.Text, numConf, rol.Text, psw.Text)
                    If res = 0 Then
                        Dim url As String = "http://hads1825.azurewebsites.net/Confirmar.aspx?num=" & numConf & "&email=" & email.Text
                        Dim cuerpo As String = "<html><head></head><body><h1>Pulsa en este enlace para confirmar tu cuenta<br/></h1><a href='" + url + "'>Confirmar cuenta</a></body></html>"
                        enviarEmail(email.Text, cuerpo)
                        QUERY.Text = "Te has registrado correctamente"
                        HyperLink1.Visible = True
                    Else
                        QUERY.Text = "Ya existe ese usuario en la Base de datos"
                    End If

                Else
                    QUERY.Text = "Las contraseñas no coinciden"
                End If
                CerrarConexion()
            End If
        End If

    End Sub

    Protected Function encriptar(ByVal psw As String) As String
        Dim textoEnBytes As Byte()
        Dim hashEnBytes As Byte()
        Dim res As String

        Dim md5 As New MD5CryptoServiceProvider
        textoEnBytes = System.Text.Encoding.UTF8.GetBytes(psw)


        hashEnBytes = md5.ComputeHash(textoEnBytes)
        res = BitConverter.ToString(hashEnBytes)

        Return res.Replace("-", "")
    End Function

    Protected Sub email_TextChanged(sender As Object, e As EventArgs) Handles email.TextChanged
        Dim cl As New compr.Matriculas
        Dim valido As String = cl.comprobar(email.Text)
        If valido = "SI" Then
            QUERY.Text = "El email es válido"
        Else
            QUERY.Text = "El email NO es válido"
        End If
    End Sub

End Class