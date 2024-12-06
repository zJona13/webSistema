<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="wfIngreso.aspx.vb" Inherits="webSistema.wfIngreso" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="CSS/navbar.css" rel="stylesheet" />
    <link href="CSS/gridview.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <script src="https://kit.fontawesome.com/79be0d4522.js" crossorigin="anonymous"></script>   
    <title>COMPRAS</title>
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
        </div>

        <div class="text-center mt-4">
            <p style="font-size:40px;"><strong>COMPRAS</strong></p>
        </div>

        <%--Listado y Funciones--%>
        <div class="ps-4 pe-4 mt-3">
            <div class="row">
                <div class="col-lg-4 col-md-12">
                    <div class="formulario p-3 rounded" style="background-color: #f9f9f9; border: 1px solid #ddd;">
                        <div class="form-group" id="id">
                            <asp:TextBox ID="TxtId" runat="server" CssClass="form-control" Visible="False"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label>Cabecera</label>
                            <div class="form-group" id="proveedor">
                                <label for="txtProveedor">Proveedor (*)</label>
                                <asp:TextBox ID="TxtIdProveedor" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:TextBox ID="TxtNombreProveedor" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:Button ID="BtnBuscarProveedor" runat="server" CssClass="btn btn-secondary" Text="..." />
                            </div>
                            <div class="form-group" id="comprobante">
                                <label for="txtComprobante">Comprobante</label>
                                <asp:DropDownList ID="CboTipoComprobante" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="Factura" Value="FACTURA"></asp:ListItem>
                                    <asp:ListItem Text="Boleta" Value="BOLETA"></asp:ListItem>
                                    <asp:ListItem Text="Ticket" Value="TICKET"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:TextBox ID="TxtSerieComprobante" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:TextBox ID="TxtNumComprobante" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group" id="impuesto">
                                <label for="txtImpuesto">Impuesto</label>
                                <asp:TextBox ID="TxtImpuesto" runat="server" CssClass="form-control" Text="0.18"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
                            <label>Detalles</label>
                            <div class="form-group" id="codigoarticulo">
                                <label for="txtCodArticulo">Código Artículo</label>
                                <asp:TextBox ID="TxtCodigo" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:Button ID="BtnBuscarArticulos" runat="server" CssClass="btn btn-secondary" Text="Buscar" />
                            </div>
                            <div class="form-group" id="detalle">
                                <asp:GridView ID="DgvDetalle" runat="server">
                                </asp:GridView>
                                <div class="form-group" id="detallearticulo">
                                    <label for="txtSubTotal">Sub Total</label>
                                    <asp:TextBox ID="TxtSubTotal" runat="server" CssClass="form-control"></asp:TextBox>
                                    <label for="txtImpuestoTotal">Total Impuesto</label>
                                    <asp:TextBox ID="TxtTotalImpuesto" runat="server" CssClass="form-control"></asp:TextBox>
                                    <label for="txtTotal">Total</label>
                                    <asp:TextBox ID="TxtTotal" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Botones debajo del formulario -->
                    <div class="botones mt-3">
                        <asp:Button ID="BtnInsertar" runat="server" CssClass="btn btn-primary me-2" Text="Insertar" />
                        <asp:Button ID="BtnCancelar" runat="server" CssClass="btn btn-secondary me-2" Text="Cancelar" />
                        <asp:Button ID="BtnAnular" runat="server" Text="Anular" CssClass="btn btn-danger me-2" />
                    </div>
                </div>

                <div class="col-lg-8 col-md-12">
                    <div class="row">
                        <div class="col-md-8">
                            <div class="listado" style="overflow-x: auto; max-width: 100%;">
                                <asp:GridView ID="DgvListado" runat="server" AllowPaging="true" PageSize="6"
                                    PagerStyle-CssClass="GridViewPager"
                                    OnPageIndexChanging="DgvListado_PageIndexChanging"
                                    OnSelectedIndexChanged="DgvListado_SelectedIndexChanged"
                                    AutoGenerateSelectButton="true" DataKeyNames="ID"
                                    AlternatingRowStyle-BackColor="White"
                                    SelectedRowStyle-BackColor="#669999"
                                    SelectedRowStyle-ForeColor="White">
                                </asp:GridView>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <asp:Panel ID="PanelMostrarDetalle" runat="server" Visible="False" CssClass="p-3">
                                <div class="form-group">
                                    <h3>Detalles de la Compra</h3>
                                    <asp:GridView ID="DgvMostrarDetalle" runat="server" AutoGenerateColumns="False">
                                        <Columns>
                                            <asp:BoundField DataField="codigo" HeaderText="Código" />
                                            <asp:BoundField DataField="articulo" HeaderText="Artículo" />
                                            <asp:BoundField DataField="cantidad" HeaderText="Cantidad" />
                                            <asp:BoundField DataField="precio" HeaderText="Precio" />
                                            <asp:BoundField DataField="importe" HeaderText="Importe" />
                                        </Columns>
                                    </asp:GridView>

                                    <!-- Subtotal, Impuesto y Total -->
                                    <div class="form-group mt-3">
                                        <label>Sub Total:</label>
                                        <asp:Label ID="LblSubTotal" runat="server" CssClass="form-control" />
                                        <label>Total Impuesto:</label>
                                        <asp:Label ID="LblTotalImpuesto" runat="server" CssClass="form-control" />
                                        <label>Total General:</label>
                                        <asp:Label ID="LblTotalGeneral" runat="server" CssClass="form-control" />
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
