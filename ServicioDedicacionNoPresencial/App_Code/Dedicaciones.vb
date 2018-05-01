Imports System.Data.SqlClient
Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols

' Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente.
' <System.Web.Script.Services.ScriptService()> _
<WebService(Namespace:="http://tempuri.org/")> _
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Public Class Dedicaciones
    Inherits System.Web.Services.WebService

    <WebMethod()>
    Public Function calcularDedicacion(asignatura As String) As Integer
        Dim conexion As New SqlConnection
        Dim comando As New SqlCommand
        Try
            conexion.ConnectionString = "Server=tcp:hads25.database.windows.net,1433;Initial Catalog=HADS25-TAREAS;Persist Security Info=False;User ID=amaiajokin@hads25;Password=Nistus8000;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
            conexion.Open()
        Catch ex As Exception
            Return "ERROR DE CONEXIÓN: " + ex.Message
        End Try
        Dim st = "select avg(EstudiantesTareas.HReales) from Asignaturas inner join (TareasGenericas inner join EstudiantesTareas on TareasGenericas.Codigo = Estudiantestareas.CodTarea) on Asignaturas.codigo = TareasGenericas.CodAsig where Nombre = '" & asignatura & "'"
        comando = New SqlCommand(st, conexion)
        Dim res As Integer
        Try
            res = comando.ExecuteScalar
        Catch ex As Exception
            Return 0
        End Try
        Return res
    End Function

End Class