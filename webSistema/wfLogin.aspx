<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="wfLogin.aspx.vb" Inherits="webSistema.wfLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="~/Content/bootstrap.min.css" rel="stylesheet" />
    <link href="~/CSS/login.css" rel="stylesheet" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>LOGIN</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container d-flex justify-content-center align-items-center vh-100">
            <div class="login-container">
                <div class="logo-container">
                    <asp:Image ID="Image1" runat="server" Height="100px" ImageUrl="~/images/login.png" CssClass="logo" Width="100px"/>
                </div>
                <h3>Bienvenido</h3>
                <p class="text-muted text-center mb-4">Inicia sesión para continuar</p>
                <div style="height: 20px">
                    <asp:Label ID="lblMensaje" runat="server" CssClass="text-danger"></asp:Label>
                </div>
                <div class="form-group mb-3">
                    <asp:TextBox runat="server" ID="txtEmail" type="email" placeholder="Correo electrónico" class="form-control"></asp:TextBox>
                </div>
                <div class="form-group mb-4">
                    <asp:TextBox runat="server" ID="txtClave" type="password" placeholder="Contraseña" class="form-control"></asp:TextBox>
                </div>
                <asp:button ID="btnAcceder" runat="server" type="submit" class="btn btn-primary mb-3" Text="Iniciar Sesión" />
                <asp:button ID="btnCancelar" runat="server" type="button" class="btn btn-outline-secondary" Text="Cancelar" />
            </div>
        </div>
    </form>
<script src="~/Scripts/jquery.min.js"></script>
<script src="~/Scripts/bootstrap.bundle.min.js"></script>
</body>
</html>
