Imports AccesoDatos.AccesoDatosSQL
Imports System.Data.SqlClient
Imports System.Security.Cryptography

Public Class Login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Conectar()
        Dim dr As SqlDataReader
        Try
            Dim encriptado As String = encriptar(psw.Text).ToLower
            Dim dr2 As SqlDataReader
            dr2 = obtContrasena(email.Text)

            Dim pass = ""
            If dr2.HasRows Then
                While dr2.Read
                    pass = dr2.Item(0).ToString()
                End While
            End If
            dr2.Close()
            Dim comparador As StringComparer = StringComparer.OrdinalIgnoreCase
            Dim igual = comparador.Compare(encriptado, pass)
            dr = logueado(email.Text, encriptado)
        Catch ex As Exception
            QUERY.Text = ex.Message
            CerrarConexion()
            Exit Sub
        End Try
        If dr.HasRows Then
            While dr.Read
                If dr.Item(0) = 0 Then
                    QUERY.Text = "Confirma tu registro, revisa tu correo electrónico y accede desde el enlace que te mandamos al registrarte"
                    dr.Close()
                Else
                    Session("Usuario") = email.Text
                    If dr.Item(1) = "Profesor" Then
                        Session("rol") = "Profesor"
                        anadirPersona()
                        If email.Text = "vadillo@ehu.es" Then
                            System.Web.Security.FormsAuthentication.SetAuthCookie("Vadillo", False)
                        Else
                            System.Web.Security.FormsAuthentication.SetAuthCookie("Profesor", False)
                        End If
                        dr.Close()
                        Response.Redirect("Aplicacion/Profesores/Profesor.aspx")
                    ElseIf dr.Item(1) = "Alumno" Then
                        Session("rol") = "Alumno"
                        anadirPersona()
                        dr.Close()
                        System.Web.Security.FormsAuthentication.SetAuthCookie("Alumno", False)

                        Response.Redirect("Aplicacion/Alumnos/Alumno.aspx")
                    ElseIf dr.Item(1) = "Admin" Then
                        dr.Close()
                        System.Web.Security.FormsAuthentication.SetAuthCookie("Admin", False)
                        Response.Redirect("Aplicacion/Admin/admin.aspx")
                    End If
                End If
            End While

        Else
            QUERY.Text = "El usuario o la contraseña no son correctos"
            dr.Close()
            CerrarConexion()
        End If
        CerrarConexion()
    End Sub

    Protected Function encriptar(ByVal psw As String) As String
        Dim textoEnBytes As Byte()
        Dim hashEnBytes As Byte()
        Dim res As String

        Dim md5 As New MD5CryptoServiceProvider
        textoEnBytes = System.Text.Encoding.UTF8.GetBytes(psw)


        hashEnBytes = md5.ComputeHash(textoEnBytes)
        res = BitConverter.ToString(hashEnBytes).Trim("-")
        Return res.Replace("-", "")
    End Function

    Protected Sub anadirPersona()
        Dim num As Integer = 0
        If Session("rol") = "Alumno" Then
            num = Application.Contents("numeroAlumnos")
            num = Application.Contents("numeroAlumnos") + 1
            Application.Contents("numeroAlumnos") = num
            Dim dictionary As Dictionary(Of String, String)
            dictionary = Application.Contents("listaAlum")
            If Not dictionary.ContainsKey(Session("Usuario")) Then
                dictionary.Add(Session("Usuario"), Session("usuario"))
                Application.Contents("listaAlum") = dictionary
            Else
                Application.Lock()
                Dim numero As Integer = Application.Contents("numeroAlumnos")
                numero = numero - 1
                Application.Contents("numeroAlumnos") = numero
                Application.UnLock()
            End If
        ElseIf Session("rol") = "Profesor" Then
            num = Application.Contents("numeroProfesores")
            num = Application.Contents("numeroProfesores") + 1
            Application.Contents("numeroProfesores") = num
            Dim dictionary As Dictionary(Of String, String)
            dictionary = Application.Contents("listaProf")
            If Not dictionary.ContainsKey(Session("Usuario")) Then
                dictionary.Add(Session("Usuario"), Session("usuario"))
                Application.Contents("listaProf") = dictionary
            Else
                Application.Lock()
                Dim numero As Integer = Application.Contents("numeroProfesores")
                numero = Application.Contents("numeroProfesores") - 1
                Application.Contents("numeroProfesores") = numero
                Application.UnLock()
            End If
        End If
    End Sub


End Class