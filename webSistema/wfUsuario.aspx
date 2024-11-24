<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="wfUsuario.aspx.vb" Inherits="webSistema.wfUsuarioV" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="CSS/navbar.css" rel="stylesheet" />
    <link href="CSS/gridview.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <script src="https://kit.fontawesome.com/79be0d4522.js" crossorigin="anonymous"></script>    
    <title>USUARIOS</title>
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
                                    <li><a class="dropdown-item" href="wfRol.aspx">Roles</a></li>
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
        </div>

        <div class="text-center mt-4">
            <p style="font-size:40px;"><strong>USUARIOS</strong></p>
        </div>

        <div class="ps-4 pe-4 mt-3">
            <div class="row">
                <div class="col-lg-4 col-md-12">
                    <div class="formulario p-3 rounded" style="background-color: #f9f9f9; border: 1px solid #ddd;">
                        <div class="form-group" id="id">
                            <asp:TextBox ID="TxtId" runat="server" CssClass="form-control" Visible="False"></asp:TextBox>
                        </div>

                        <div class="form-group mt-2" id="rol">
                            <label for="ddlRol">Rol (*)</label>
                            <asp:DropDownList ID="CboRol" runat="server" CssClass="form-control mt-2"></asp:DropDownList>
                        </div>
                
                        <div class="form-group mt-2" id="nombre">
                            <label for="txtNombre">Nombre (*)</label>
                            <asp:TextBox ID="TxtNombre" runat="server" CssClass="form-control mt-2"></asp:TextBox>
                        </div>
                
                        <div class="form-group mt-2">
                            <label for="ddlTipoDocumento">Tipo Documento</label>
                            <asp:DropDownList ID="CboTipoDocumento" runat="server" CssClass="form-control mt-2">
                                <asp:ListItem Text="CEDULA" Value="CEDULA"></asp:ListItem>
                                <asp:ListItem Text="PASAPORTE" Value="PASAPORTE"></asp:ListItem>
                                <asp:ListItem Text="CARNET" Value="CARNET"></asp:ListItem>
                                <asp:ListItem Text="RUC" Value="RUC"></asp:ListItem>
                                <asp:ListItem Text="DNI" Value="DNI"></asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <div class="form-group mt-2" id="numdocumento">
                            <label for="txtNumeroDocumento">Número Documento</label>
                            <asp:TextBox ID="TxtNumDocumento" runat="server" CssClass="form-control mt-2"></asp:TextBox>
                        </div>

                        <div class="form-group mt-2" id="direccion">
                            <label for="txtDireccion">Dirección</label>
                            <asp:TextBox ID="TxtDireccion" runat="server" CssClass="form-control mt-2"></asp:TextBox>
                        </div>

                        <div class="form-group mt-2" id="telefono">
                            <label for="txtTelefono">Teléfono</label>
                            <asp:TextBox ID="TxtTelefono" runat="server" CssClass="form-control mt-2"></asp:TextBox>
                        </div>

                        <div class="form-group mt-2">
                            <div class="form-group" id="email">
                                <label for="txtEmail">Email (*)</label>
                                <asp:TextBox ID="TxtEmail" runat="server" CssClass="form-control mt-2"></asp:TextBox>
                            </div>
                            <div class="form-group mt-2" id="clave">
                                <label for="txtClave">Clave (A)</label>
                                <asp:TextBox ID="TxtClave" runat="server" CssClass="form-control mt-2" TextMode="Password"></asp:TextBox>
                            </div>
                            <small class="form-text text-muted">
                                A: Para insertar un usuario la clave es obligatoria. Para actualizar, deje en blanco el campo clave y la clave no se actualizará.
                            </small>
                        </div>
                    </div>

                    <!-- Botones debajo del formulario -->
                    <div class="botones mt-3">
                        <asp:Button ID="BtnInsertar" runat="server" CssClass="btn btn-primary me-2" Text="Insertar" />
                        <asp:Button ID="BtnActualizar" runat="server" CssClass="btn btn-primary me-2" Text="Actualizar" Visible="false" />
                        <asp:Button ID="BtnEliminar" runat="server" Text="Eliminar" CssClass="btn btn-danger me-2"/>
                        <asp:Button ID="BtnActivar" runat="server" Text="Activar" CssClass="btn btn-success me-2"/>
                        <asp:Button ID="BtnDesactivar" runat="server" Text="Desactivar" CssClass="btn btn-warning"/>
                    </div>
                </div>

                <div class="col-lg-8 col-md-12">
                    <div class="listado" style="overflow-x: auto; max-width: 100%;">
                        <asp:GridView ID="DgvListado" runat="server" AllowPaging="true" PageSize="12"
                            PagerStyle-CssClass="GridViewPager"
                            OnPageIndexChanging="DgvListado_PageIndexChanging"
                            AutoGenerateSelectButton="true" AutoGenerateEditButton="true" DataKeyNames="ID"
                            AlternatingRowStyle-BackColor="White"
                            SelectedRowStyle-BackColor="#669999"
                            SelectedRowStyle-ForeColor="White">
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
