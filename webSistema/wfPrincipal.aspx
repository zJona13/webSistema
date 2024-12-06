<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="wfPrincipal.aspx.vb" Inherits="webSistema.principal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="CSS/navbar.css" rel="stylesheet" />
    <link href="CSS/gridview.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <script src="https://kit.fontawesome.com/79be0d4522.js" crossorigin="anonymous"></script>    
    <title>MENU PRINCIPAL</title>
</head>
<body>
    <form id="form1" runat="server">
                <%--Navegador Principal--%>
        <div class="navprincipal">
            <nav class="navbar navbar-expand-lg" style="background-color: #2e3b4e; color: #fff;">
                <div class="container-fluid">
                    <img src="images/final.png" alt="Alternate Text" style="height: 48px; width: 48px;" />
            
                    <div class="collapse navbar-collapse justify-content-center" id="navbarSupportedContent">
                        <ul class="navbar-nav mb-2 mb-lg-0 text-center" style="gap: 20px;">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle text-white" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="fa-regular fa-user"></i>&nbsp;Acceso
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="wfUsuario.aspx">Usuarios</a></li>
                                </ul>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle text-white" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="fa-solid fa-gear"></i>&nbsp;Mantenimientos
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="wfCategoria.aspx">Categorías</a></li>
                                    <li><a class="dropdown-item" href="wfArticulo.aspx">Artículos</a></li>
                                    <li><a class="dropdown-item" href="wfProveedor.aspx">Proveedores</a></li>
                                    <li><a class="dropdown-item" href="wfCliente.aspx">Clientes</a></li>
                                </ul>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle text-white" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="fa-solid fa-cash-register"></i>&nbsp;Transacciones
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="wfIngreso.aspx">Compras</a></li>
                                    <li><a class="dropdown-item" href="wfVenta.aspx">Ventas</a></li>
                                </ul>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle text-white" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="fa-solid fa-list"></i>&nbsp;Reportes
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#">Reporte 1</a></li>
                                    <li><a class="dropdown-item" href="#">Reporte 2</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
            
                    <a class="nav-link text-white" href="wfLogin.aspx" style="margin-left: auto;"><i class="fa-solid fa-circle-xmark"></i>&nbsp;Salir</a>
                </div>
            </nav>
            <div class="text-center mt-4">
                <p style="font-size:40px;"><strong>DASHBOARD</strong></p>
            </div>
        </div>
    </form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
