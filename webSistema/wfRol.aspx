﻿<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="wfRol.aspx.vb" Inherits="webSistema.wfRol1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="/CSS/master.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>ROLES</title>
</head>
<body>
    <header>
        <div class="header-content">
            <img src="images/final.PNG" alt="Logo" class="logo" />
            <h2 id="header-title">Sistema compra y ventas - Web</h2>
        </div>
    </header>
    <form id="form1" runat="server">
        <div class="wrapper">
            <%--Sidebar--%>
            <aside id="sidebar">
                <div class="sidebar-logo">
                    <a href="wfPrincipal.aspx">Sistema de Ventas</a>
                </div>
                <ul class="sidebar-nav">
                    <li class="sidebar-item">
                        <a href="#" class="sidebar-link">
                            <i class="lni lni-protection"></i>
                            <span>Acceso</span>
                        </a>
                        <ul class="sidebar-dropdown list-unstyled">
                            <li class="sidebar-item">
                                <a href="wfRol.aspx" class="sidebar-link">Roles</a>
                            </li>
                            <li class="sidebar-item">
                                <a href="wfUsuario.aspx" class="sidebar-link">Usuarios</a>
                            </li>
                        </ul>
                    </li>
                    <li class="sidebar-item">
                        <a href="#" class="sidebar-link">
                            <i class="lni lni-protection"></i>
                            <span>Mantenimientos</span>
                        </a>
                        <ul class="sidebar-dropdown list-unstyled">
                            <li class="sidebar-item">
                                <a href="wfCategoria.aspx" class="sidebar-link">Categorías</a>
                            </li>
                            <li class="sidebar-item">
                                <a href="wfArticulo.aspx" class="sidebar-link">Artículos</a>
                            </li>
                            <li class="sidebar-item">
                                <a href="wfProveedor.aspx" class="sidebar-link">Proveedores</a>
                            </li>
                            <li class="sidebar-item">
                                <a href="wfCliente.aspx" class="sidebar-link">Clientes</a>
                            </li>
                        </ul>
                    </li>
                    <li class="sidebar-item">
                        <a href="#" class="sidebar-link">
                            <i class="lni lni-protection"></i>
                            <span>Transacciones</span>
                        </a>
                        <ul class="sidebar-dropdown list-unstyled">
                            <li class="sidebar-item">
                                <a href="wfIngreso.aspx" class="sidebar-link">Compras</a>
                            </li>
                            <li class="sidebar-item">
                                <a href="wfVenta.aspx" class="sidebar-link">Ventas</a>
                            </li>
                        </ul>
                    </li>
                </ul>
                <div class="sidebar-footer">
                    <a href="wfLogin.aspx" class="sidebar-link">
                        <i class="lni lni-exit"></i>
                        <span>Salir</span>
                    </a>
                </div>
            </aside>
            <%--Información--%>
             <div class="content" style="height: 0px;">
                 <div class="container-fluid">
                    <div>
                        <asp:GridView ID="DgvListado" runat="server" AutoGenerateColumns="True" CssClass="table" />
                    </div>
                 </div>
             </div>   
        </div>
    </form>
<footer>
    <div class="footer-container">
        <div class="footer-column">
            <h3>Contacto</h3>
            <p>Soporte y Ventas</p>
            <p>605-850 W Hastings St, Vancouver, BC V6C, Canada</p>
            <p><a href="soportemjegr@mjegr.com">soportemjegr@mjegr.com</a></p>
        </div>
        <div class="footer-column">
            <h4>Categorías</h4>
            <ul>
                <li><a href="#">Portátiles</a></li>
                <li><a href="#">Smartphones</a></li>
                <li><a href="#">Componentes</a></li>
                <li><a href="#">Accesorios</a></li>
                <li><a href="#">Ofertas</a></li>
            </ul>
        </div>
        <div class="footer-column">
            <h4>Soporte</h4>
            <ul>
                <li><a href="#">Preguntas Frecuentes (FAQ)</a></li>
                <li><a href="#">Política de Garantía</a></li>
                <li><a href="#">Política de Devoluciones</a></li>
                <li><a href="#">Centro de Ayuda</a></li>
            </ul>
        </div>
        <div class="footer-column">
            <h4>Empresa</h4>
            <ul>
                <li><a href="#">Acerca de Nosotros</a></li>
                <li><a href="#">Términos y Condiciones</a></li>
                <li><a href="#">Política de Privacidad</a></li>
                <li><a href="#">Mapa del Sitio</a></li>
            </ul>
        </div>
        <div class="footer-column">
            <h4>Síguenos</h4>
            <div class="social-icons">
                <a href="#">&#xf099;</a>
                <a href="#">&#xf09a;</a>
                <a href="#">&#xf16d;</a>
                <a href="#">&#xf0d5;</a>
                <a href="#">&#xf08c;</a>
            </div>
        </div>
    </div>
    <div class="footer-bottom">
        <p>&copy; SISTEMAS DISTRIBUIDOS 2024 . Diseñado por MJEGR </p>
    </div>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
