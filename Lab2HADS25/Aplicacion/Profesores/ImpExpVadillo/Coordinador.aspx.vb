Public Class Coordinador
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub



    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged
        Dim clienteServicio As New azureservicio.Dedicaciones
        Dim dedicacion As Integer = clienteServicio.calcularDedicacion(DropDownList1.SelectedValue)
        horas.Text = dedicacion.ToString
    End Sub

    Private Sub DropDownList1_DataBound(sender As Object, e As EventArgs) Handles DropDownList1.DataBound
        'Dim clienteServicio As New azureservicio.Dedicaciones
        'Dim dedicacion As Integer = clienteServicio.calcularDedicacion(DropDownList1.SelectedValue)
        'horas.Text = dedicacion.ToString
    End Sub
End Class