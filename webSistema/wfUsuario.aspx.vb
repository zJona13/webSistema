Imports Sistema
Imports Sistema.Negocio

Public Class wfUsuarioV
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Listar()
            CargarRol()
        End If
    End Sub

    Private Sub Listar()
        Try
            Dim Neg As New NUsuario()
            Dim dt As DataTable = Neg.Listar()
            DgvListado.DataSource = dt
            DgvListado.DataBind()
        Catch ex As Exception
            ' Manejo de error
        End Try
    End Sub

    Private Sub CargarRol()
        Try
            Dim Neg As New NRol()
            CboRol.DataSource = Neg.Listar()
            CboRol.DataValueField = "idrol"
            CboRol.DataTextField = "nombre"
            CboRol.DataBind()
        Catch ex As Exception
            ' Manejo de error
        End Try
    End Sub

    Protected Sub BtnEliminar_Click(sender As Object, e As EventArgs) Handles BtnEliminar.Click
        Try
            Dim Neg As New NUsuario()
            Dim id As Integer = Convert.ToInt32(DgvListado.SelectedDataKey.Value)
            Neg.Eliminar(id)
            Listar()
            DgvListado.SelectedIndex = -1
        Catch ex As Exception
            ' Manejo de error
        End Try
    End Sub

    Protected Sub BtnActivar_Click(sender As Object, e As EventArgs) Handles BtnActivar.Click
        Try
            Dim Neg As New NUsuario()
            Dim id As Integer = Convert.ToInt32(DgvListado.SelectedDataKey.Value)
            Neg.Activar(id)
            Listar()
            DgvListado.SelectedIndex = -1
        Catch ex As Exception
            ' Manejo de error
        End Try
    End Sub

    Protected Sub BtnDesactivar_Click(sender As Object, e As EventArgs) Handles BtnDesactivar.Click
        Try
            Dim Neg As New NUsuario()
            Dim id As Integer = Convert.ToInt32(DgvListado.SelectedDataKey.Value)
            Neg.Desactivar(id)
            Listar()
            DgvListado.SelectedIndex = -1
        Catch ex As Exception
            ' Manejo de error
        End Try
    End Sub

    Private Sub LimpiarCampos()
        TxtId.Text = ""
        TxtNombre.Text = ""
        TxtNumDocumento.Text = ""
        TxtDireccion.Text = ""
        TxtTelefono.Text = ""
        TxtEmail.Text = ""
        TxtClave.Text = ""
        CboRol.SelectedIndex = 0
        CboTipoDocumento.SelectedIndex = 0
        BtnInsertar.Visible = True
        BtnActualizar.Visible = False
    End Sub
    Protected Sub BtnInsertar_Click(sender As Object, e As EventArgs) Handles BtnInsertar.Click
        Try
            If String.IsNullOrEmpty(TxtNombre.Text) Or String.IsNullOrEmpty(TxtEmail.Text) Or String.IsNullOrEmpty(TxtClave.Text) Then
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Pop", "alert('Por favor, rellene todos los campos obligatorios.');", True)
                Return
            End If

            Dim Obj As New Entidades.Usuario
            Dim Neg As New NUsuario()

            Obj.IdRol = CboRol.SelectedValue
            Obj.Nombre = TxtNombre.Text
            Obj.TipoDocumento = CboTipoDocumento.SelectedValue
            Obj.NumDocumento = TxtNumDocumento.Text
            Obj.Direccion = TxtDireccion.Text
            Obj.Telefono = TxtTelefono.Text
            Obj.Email = TxtEmail.Text
            Obj.Clave = TxtClave.Text

            If Neg.Insertar(Obj) Then
                Listar()
                LimpiarCampos()
            End If
        Catch ex As Exception
            ' Manejo de error
        End Try
    End Sub

    Protected Sub DgvListado_RowEditing(sender As Object, e As GridViewEditEventArgs) Handles DgvListado.RowEditing
        Dim row As GridViewRow = DgvListado.Rows(e.NewEditIndex)

        Dim obtenerValorLimpio As Func(Of String, String) = Function(valor) If(valor = "&nbsp;", "", valor)

        TxtId.Text = obtenerValorLimpio(row.Cells(1).Text)
        CboRol.SelectedValue = obtenerValorLimpio(row.Cells(2).Text)
        TxtNombre.Text = obtenerValorLimpio(row.Cells(4).Text)
        CboTipoDocumento.SelectedValue = obtenerValorLimpio(row.Cells(5).Text)
        TxtNumDocumento.Text = obtenerValorLimpio(row.Cells(6).Text)
        TxtDireccion.Text = obtenerValorLimpio(row.Cells(7).Text)
        TxtTelefono.Text = obtenerValorLimpio(row.Cells(8).Text)
        TxtEmail.Text = obtenerValorLimpio(row.Cells(9).Text)

        BtnInsertar.Visible = False
        BtnActualizar.Visible = True

        e.Cancel = True
    End Sub

    Protected Sub BtnActualizar_Click(sender As Object, e As EventArgs) Handles BtnActualizar.Click
        Try
            Dim Obj As New Entidades.Usuario
            Dim Neg As New NUsuario()

            Obj.IdUsuario = TxtId.Text
            Obj.IdRol = CboRol.SelectedValue
            Obj.Nombre = TxtNombre.Text
            Obj.TipoDocumento = CboTipoDocumento.SelectedValue
            Obj.NumDocumento = TxtNumDocumento.Text
            Obj.Direccion = TxtDireccion.Text
            Obj.Telefono = TxtTelefono.Text
            Obj.Email = TxtEmail.Text
            Obj.Clave = TxtClave.Text

            If Neg.Actualizar(Obj) Then
                Listar()
                LimpiarCampos()
            End If
        Catch ex As Exception
            ' Manejo de error
        End Try
    End Sub

    Protected Sub DgvListado_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        Try
            ' Establece la nueva página
            DgvListado.PageIndex = e.NewPageIndex

            ' Vuelve a cargar los datos
            Listar()
        Catch ex As Exception
            ' Manejo de error
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Error", $"alert('Error al cambiar de página: {ex.Message}');", True)
        End Try
    End Sub

End Class