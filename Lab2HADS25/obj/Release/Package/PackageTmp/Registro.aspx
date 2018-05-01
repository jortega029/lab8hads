<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Registro.aspx.vb" Inherits="Lab2HADS25.Registrar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
            width: 1130px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label1" runat="server" Text="Correo electrónico: "></asp:Label>
                    <asp:TextBox ID="email" runat="server" AutoPostBack="True"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="email" ErrorMessage="*"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email" ErrorMessage="El formato del email no es correcto" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    <br />
                    <p class="auto-style1">
                        <asp:Label ID="Label2" runat="server" Text="Nombre: "></asp:Label>
                        <asp:TextBox ID="nombre" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="nombre" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </p>
                    <p class="auto-style1">
                        <asp:Label ID="Label5" runat="server" Text="Apellidos: "></asp:Label>
                        <asp:TextBox ID="apellidos" runat="server"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;</p>
                    <p class="auto-style1">
                        &nbsp;<asp:Label ID="Label3" runat="server" Text="Contraseña: "></asp:Label>
                        <asp:TextBox ID="psw" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="psw" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </p>
                    <p class="auto-style1">
                        &nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label4" runat="server" Text="Repetir contraseña: "></asp:Label>
                        <asp:TextBox ID="psw2" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="psw2" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </p>
                    <p class="auto-style1">
                        Elije:
                        <asp:DropDownList ID="rol" runat="server">
                            <asp:ListItem>Profesor</asp:ListItem>
                            <asp:ListItem>Alumno</asp:ListItem>
                        </asp:DropDownList>
                    </p>
                    <p class="auto-style1">
                        <asp:Label ID="QUERY" runat="server"></asp:Label>
                    </p>
                </ContentTemplate>
            </asp:UpdatePanel>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </div>
        <p class="auto-style1">
                        <asp:Button ID="Button1" runat="server" style="text-align: center" Text="REGISTRARSE" />
        </p>
        <p class="auto-style1">
            &nbsp;</p>
        <p class="auto-style1">
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Inicio.aspx" Visible="False">VOLVER AL INICIO</asp:HyperLink>
        </p>
        <p>
            &nbsp;</p>
    </form>
</body>
</html>
