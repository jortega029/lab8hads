Public Class Usuarios
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Label4.Text = Application.Contents("numeroAlumnos").ToString
        Label5.Text = Application.Contents("numeroProfesores").ToString
        rellenar()
        visibilidadListBox()
    End Sub

    Protected Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick
        Label4.Text = Application.Contents("numeroAlumnos").ToString
        Label5.Text = Application.Contents("numeroProfesores").ToString
        rellenar()
        visibilidadListBox()
    End Sub

    Protected Sub rellenar()
        Dim dictionary As Dictionary(Of String, String)
        dictionary = Application.Contents("listaProf")
        ListBox1.Items.Clear()
        For Each key As String In dictionary.Keys
            ListBox1.Items.Add(key)
        Next
        Dim dictionary2 As Dictionary(Of String, String)
        dictionary2 = Application.Contents("listaAlum")
        ListBox2.Items.Clear()
        For Each key As String In dictionary2.Keys
            ListBox2.Items.Add(key)
        Next
    End Sub

    Protected Sub visibilidadListBox()
        If ListBox1.Items.Count = 0 Then
            ListBox1.Visible = False
        Else
            ListBox1.Visible = True
        End If

        If ListBox2.Items.Count = 0 Then
            ListBox2.Visible = False
        Else
            ListBox2.Visible = True
        End If
    End Sub

End Class