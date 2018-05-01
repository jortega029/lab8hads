<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="admin.aspx.vb" Inherits="Lab2HADS25.admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

            <asp:Label ID="Label3" runat="server"></asp:Label>
        &nbsp;
            &nbsp;
            <asp:LinkButton ID="LinkButton1" runat="server">Cerrar Sesión</asp:LinkButton>
        <br />
        <br />
       
        <div style=" height: 500px; width: 700px; position: relative; left: 220px; background-color: #CCFFCC; text-align: center; border-left-style: groove; border-left-color: #C0C0C0; border-right-style: groove; border-right-color: #000000; border-top-style: groove; border-top-color: #C0C0C0; border-bottom-style: groove; border-bottom-color: #000000;">
            
            <br />
            <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Opciones de administrador"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label5" runat="server" Text="Consulta los usuarios del sistema"></asp:Label>
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="email" DataSourceID="SqlDataSource1" HorizontalAlign="Center">
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="email" HeaderText="email" ReadOnly="True" SortExpression="email" />
                    <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
                    <asp:BoundField DataField="apellidos" HeaderText="apellidos" SortExpression="apellidos" />
                    <asp:BoundField DataField="tipo" HeaderText="tipo" SortExpression="tipo" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HADS25-TAREASConnectionString %>" DeleteCommand="DELETE FROM [Usuarios] WHERE [email] = @email" InsertCommand="INSERT INTO [Usuarios] ([email], [nombre], [apellidos], [tipo]) VALUES (@email, @nombre, @apellidos, @tipo)" SelectCommand="SELECT [email], [nombre], [apellidos], [tipo] FROM [Usuarios]" UpdateCommand="UPDATE [Usuarios] SET [nombre] = @nombre, [apellidos] = @apellidos, [tipo] = @tipo WHERE [email] = @email">
                <DeleteParameters>
                    <asp:Parameter Name="email" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="nombre" Type="String" />
                    <asp:Parameter Name="apellidos" Type="String" />
                    <asp:Parameter Name="tipo" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="nombre" Type="String" />
                    <asp:Parameter Name="apellidos" Type="String" />
                    <asp:Parameter Name="tipo" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:Label ID="Label6" runat="server" Text="Selecciona una tarea para ver sus instancias:"></asp:Label>
            <br />
            <br />
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="Codigo" DataValueField="Codigo">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HADS25-TAREASConnectionString %>" SelectCommand="SELECT [Codigo] FROM [TareasGenericas]"></asp:SqlDataSource>
            <br />
            <br />
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Email,CodTarea" DataSourceID="SqlDataSource3" HorizontalAlign="Center">
                <Columns>
                    <asp:CommandField ButtonType="Button" DeleteText="Eliminar tarea instanciada" ShowDeleteButton="True" />
                    <asp:BoundField DataField="Email" HeaderText="Email" ReadOnly="True" SortExpression="Email" />
                    <asp:BoundField DataField="CodTarea" HeaderText="CodTarea" ReadOnly="True" SortExpression="CodTarea" />
                    <asp:BoundField DataField="HEstimadas" HeaderText="HEstimadas" SortExpression="HEstimadas" />
                    <asp:BoundField DataField="HReales" HeaderText="HReales" SortExpression="HReales" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:HADS25-TAREASConnectionString %>" DeleteCommand="DELETE FROM [EstudiantesTareas] WHERE [Email] = @Email AND [CodTarea] = @CodTarea" InsertCommand="INSERT INTO [EstudiantesTareas] ([Email], [CodTarea], [HEstimadas], [HReales]) VALUES (@Email, @CodTarea, @HEstimadas, @HReales)" SelectCommand="SELECT * FROM [EstudiantesTareas] WHERE ([CodTarea] = @CodTarea)" UpdateCommand="UPDATE [EstudiantesTareas] SET [HEstimadas] = @HEstimadas, [HReales] = @HReales WHERE [Email] = @Email AND [CodTarea] = @CodTarea">
                <DeleteParameters>
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="CodTarea" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="CodTarea" Type="String" />
                    <asp:Parameter Name="HEstimadas" Type="Int32" />
                    <asp:Parameter Name="HReales" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="CodTarea" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="HEstimadas" Type="Int32" />
                    <asp:Parameter Name="HReales" Type="Int32" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="CodTarea" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <br />
            
        </div>
    </form>
</body>
</html>
