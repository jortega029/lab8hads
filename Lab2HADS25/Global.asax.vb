Imports System.Web.SessionState

Public Class Global_asax
    Inherits System.Web.HttpApplication

    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Se desencadena al iniciar la aplicación
        Application.Contents("numeroProfesores") = 0
        Application.Contents("numeroAlumnos") = 0
        Dim dictionary As New Dictionary(Of String, String)
        Application.Contents("listaProf") = dictionary

        Dim dictionary2 As New Dictionary(Of String, String)
        Application.Contents("listaAlum") = dictionary2

    End Sub

    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Se desencadena al iniciar la sesión
    End Sub

    Sub Application_BeginRequest(ByVal sender As Object, ByVal e As EventArgs)
        ' Se desencadena al comienzo de cada solicitud
    End Sub

    Sub Application_AuthenticateRequest(ByVal sender As Object, ByVal e As EventArgs)
        ' Se desencadena al intentar autenticar el uso
    End Sub

    Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
        ' Se desencadena cuando se produce un error
    End Sub

    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Se desencadena cuando finaliza la sesión
        Application.Lock()
        Dim num As Integer = 0
        If Session("rol") = "Alumno" Then
            num = Application.Contents("numeroAlumnos")
            num = num - 1
            Application.Contents("numeroAlumnos") = num
            Dim dictionary As Dictionary(Of String, String)
            dictionary = Application.Contents("listaAlum")
            dictionary.Remove(Session("Usuario"))
            Application.Contents("listaAlum") = dictionary
        ElseIf Session("rol") = "Profesor" Then
            num = Application.Contents("numeroProfesores")
            num = num - 1
            Application.Contents("numeroProfesores") = num
            Dim dictionary As Dictionary(Of String, String)
            dictionary = Application.Contents("listaProf")
            dictionary.Remove(Session("Usuario"))
            Application.Contents("listaProf") = dictionary
        End If
        Application.UnLock()
    End Sub

    Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Se desencadena cuando finaliza la aplicación
    End Sub

End Class