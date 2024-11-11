<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="wfCategoria.aspx.vb" Inherits="webSistema.wfCategorias" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="/CSS/master.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>CATEGORÍAS</title>
</head>
<body>
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
                        <!-- Button trigger modal -->
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                         Agregar
                        </button>

                        <!-- Modal -->
                        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Categorías</h1>
                                        <asp:Button type="BtnClose" runat="server" CssClass="btn-close" data-bs-dismiss="modal" aria-label="Close" Text="" ID="BtnClose" />
                                    </div>
                                    <div class="modal-body">

                                        <div class="form-group" id="id">
                                            <asp:TextBox ID="TxtId" runat="server" CssClass="form-control" Visible="False"></asp:TextBox>
                                        </div>

                                        <div class="form-group" id="nombre">
                                            <label for="txtNombre">Nombre (*)</label>
                                            <asp:TextBox ID="TxtNombre" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                
                                        <div class="form-group" id="descripcion">
                                            <label for="txtDescripcion">Descripcion</label>
                                            <asp:TextBox ID="TxtDescripcion" runat="server" CssClass="form-control" Height="62"></asp:TextBox>
                                        </div>
                
                                    </div>
                                    <div class="modal-footer">
                                        <asp:Button ID="BtnInsertar" runat="server" CssClass="btn btn-primary" Text="Insertar" Visible="true" />
                                        <asp:Button ID="BtnActualizar" runat="server" CssClass="btn btn-primary" Text="Actualizar" Visible="false" OnClientClick="mostrarConfirmacion('actualizar'); return false;"/>
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                     </div>
                     <div>
                        <asp:Button ID="BtnEliminar" runat="server" Text="Eliminar" CssClass="btn btn-danger" OnClientClick="mostrarConfirmacion('eliminar'); return false;"/>
                        <asp:Button ID="BtnActivar" runat="server" Text="Activar" CssClass="btn btn-success" OnClientClick="mostrarConfirmacion('activar'); return false;"/>
                        <asp:Button ID="BtnDesactivar" runat="server" Text="Desactivar" CssClass="btn btn-warning" OnClientClick="mostrarConfirmacion('desactivar'); return false;"/>
                        <asp:HiddenField ID="HiddenFieldAccion" runat="server" />
                     </div>
                     <div>
                        <asp:GridView ID="DgvListado" runat="server" AutoGenerateSelectButton="true" AutoGenerateEditButton="true" DataKeyNames="ID"
                            AlternatingRowStyle-BackColor="White"
                            SelectedRowStyle-BackColor="#669999"
                            SelectedRowStyle-ForeColor="White">
                        </asp:GridView>
                        <asp:HiddenField ID="hfShowModal" runat="server" Value="False" />
                     </div>   
                 </div>
             </div>   
        </div>
    </form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script>
    function mostrarConfirmacion(accion) {
        document.getElementById("actionText").innerText = accion;
        document.getElementById("<%= HiddenFieldAccion.ClientID %>").value = accion;
        var confirmationModal = new bootstrap.Modal(document.getElementById('confirmationModal'));
        confirmationModal.show();
    }

    document.addEventListener("DOMContentLoaded", function () {
        var showModal = document.getElementById('<%= hfShowModal.ClientID %>').value;
        if (showModal === "True") {
            var exampleModal = new bootstrap.Modal(document.getElementById('exampleModal'));
            exampleModal.show();
            document.getElementById('<%= hfShowModal.ClientID %>').value = "False";
        }
    });
</script>
</body>
</html>
