<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="TareasProfesor.aspx.vb" Inherits="Lab2HADS25.TareasProfesor" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
.handlecss
{
width:20px;
height:20px;
}
.resizablecss
{
padding:0px;
border-style:solid;
cursor:se-resize;
}
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div style="background-color: #C0C0C0">
            
            <h1 style="text-align: center">PROFESOR</h1>
            <h1 style="text-align: center">GESTIÓN DE TAREAS GENÉRICAS</h1>
        </div>
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Label ID="Label2" runat="server" Text="Seleccionar asignatura:"></asp:Label>
            <br />
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="codigoasig" DataValueField="codigoasig">
                    </asp:DropDownList>
                    <br />
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HADS25-TAREASConnectionString %>" SelectCommand="SELECT g.codigoasig FROM GruposClase AS g INNER JOIN ProfesoresGrupo AS p ON g.codigo = p.codigogrupo WHERE (p.email = @email)">
                        <SelectParameters>
                            <asp:SessionParameter Name="email" SessionField="Usuario" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Codigo" DataSourceID="SqlDataSource2">
                        <Columns>
                            <asp:CommandField ShowEditButton="True" />
                            <asp:BoundField DataField="Codigo" HeaderText="Codigo" ReadOnly="True" SortExpression="Codigo" />
                            <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                            <asp:BoundField DataField="CodAsig" HeaderText="CodAsig" SortExpression="CodAsig" />
                            <asp:BoundField DataField="HEstimadas" HeaderText="HEstimadas" SortExpression="HEstimadas" />
                            <asp:CheckBoxField DataField="Explotacion" HeaderText="Explotacion" SortExpression="Explotacion" />
                            <asp:BoundField DataField="TipoTarea" HeaderText="TipoTarea" SortExpression="TipoTarea" />
                        </Columns>
                    </asp:GridView>
                    <ajaxToolkit:ResizableControlExtender ID="GridView1_ResizableControlExtender" runat="server" BehaviorID="GridView1_ResizableControlExtender" TargetControlID="GridView1" HandleCssClass="handlecss" ResizableCssClass="resizablecss" />
                    <br />
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HADS25-TAREASConnectionString %>" SelectCommand="select * from tareasgenericas where codasig = @codigo" UpdateCommand="UPDATE TareasGenericas SET Descripcion = @Descripcion, CodAsig = @CodAsig, HEstimadas = @HEstimadas, Explotacion = @Explotacion, TipoTarea = @TipoTarea where Codigo = @Codigo">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" Name="codigo" PropertyName="SelectedValue" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Descripcion" />
                            <asp:Parameter Name="CodAsig" />
                            <asp:Parameter Name="HEstimadas" />
                            <asp:Parameter Name="Explotacion" />
                            <asp:Parameter Name="TipoTarea" />
                            <asp:Parameter Name="codigo" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <br />
                    <asp:Button ID="Button1" runat="server" Text="Añadir nueva tarea" />
                    <ajaxToolkit:ConfirmButtonExtender ID="Button1_ConfirmButtonExtender" runat="server" BehaviorID="Button1_ConfirmButtonExtender" ConfirmText="Confirmar" TargetControlID="Button1" />
                    <ajaxToolkit:RoundedCornersExtender ID="Button1_RoundedCornersExtender" runat="server" BehaviorID="Button1_RoundedCornersExtender" TargetControlID="Button1" />
                    <br />
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Aplicacion/Profesores/Profesor.aspx">Volver a inicio Profesor</asp:HyperLink>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
