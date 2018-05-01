<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Coordinador.aspx.vb" Inherits="Lab2HADS25.Coordinador" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    </head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Aplicacion/Profesores/Profesor.aspx">Volver</asp:HyperLink>
            <br />
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    Elige una asignatura para que aparezcan el número medio de horas dedicadas:<br />
                    <br />
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Nombre" DataValueField="Nombre">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HADS25-TAREASConnectionString %>" SelectCommand="SELECT [Nombre] FROM [Asignaturas]"></asp:SqlDataSource>
                    <br />
                    <br />
                    <br />
                    <asp:Label ID="Label1" runat="server" Text="Número de horas:"></asp:Label>
                    &nbsp;
                    &nbsp;
                    <asp:Label ID="horas" runat="server"></asp:Label>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <asp:UpdateProgress ID="UpdateProgress2" runat="server">
            <ProgressTemplate>
                <asp:Image ID="Image1" runat="server" ImageUrl="~/cargando.gif" />
            </ProgressTemplate>
        </asp:UpdateProgress>
    </form>
</body>
</html>
