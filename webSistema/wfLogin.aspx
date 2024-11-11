<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="wfLogin.aspx.vb" Inherits="webSistema.wfLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <link href="CSS/login.css" rel="stylesheet" />
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
                <p class="text-center mb-4" style="color:white">Inicia sesión para continuar</p>
                <div style="height: 32px">
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>