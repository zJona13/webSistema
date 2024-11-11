Imports Sistema.Negocio
Imports Sistema.Entidades

Public Class wfCliente
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Listar()
        End If
    End Sub

    Private Sub Listar()
        Try
            Dim Neg As New NPersona()
            Dim dt As DataTable = Neg.ListarClientes()
            DgvListado.DataSource = dt
            DgvListado.DataBind()
        Catch ex As Exception
            ' Manejo de error
        End Try
    End Sub

    Protected Sub BtnInsertar_Click(sender As Object, e As EventArgs) Handles BtnInsertar.Click
        Try
            ' Validar que los campos obligatorios estén llenos
            If String.IsNullOrEmpty(TxtNombre.Text) Then
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Pop", "alert('Por favor, rellene todos los campos obligatorios.');", True)
                Return
            End If

            Dim Obj As New Persona()
            Dim Neg As New NPersona()

            Obj.TipoPersona = "Cliente"
            Obj.Nombre = TxtNombre.Text
            Obj.TipoDocumento = CboTipoDocumento.SelectedValue
            Obj.NumDocumento = TxtNumDocumento.Text
            Obj.Direccion = TxtDireccion.Text
            Obj.Telefono = TxtTelefono.Text
            Obj.Email = TxtEmail.Text

            If Neg.Insertar(Obj) Then
                Listar() ' Actualizar la lista de clientes después de insertar
                LimpiarCampos() ' Limpiar los campos del modal para una nueva inserción
            End If
        Catch ex As Exception
            ' Manejo de error
        End Try
    End Sub

    Protected Sub BtnActualizar_Click(sender As Object, e As EventArgs) Handles BtnActualizar.Click
        Try
            ' Validar que los campos obligatorios estén llenos
            If String.IsNullOrEmpty(TxtNombre.Text) OrElse String.IsNullOrEmpty(TxtId.Text) Then
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Pop", "alert('Por favor, rellene todos los campos obligatorios.');", True)
                Return
            End If

            Dim Obj As New Persona()
            Dim Neg As New NPersona()

            Obj.IdPersona = Convert.ToInt32(TxtId.Text)
            Obj.TipoPersona = "Cliente"
            Obj.Nombre = TxtNombre.Text
            Obj.TipoDocumento = CboTipoDocumento.SelectedValue
            Obj.NumDocumento = TxtNumDocumento.Text
            Obj.Direccion = TxtDireccion.Text
            Obj.Telefono = TxtTelefono.Text
            Obj.Email = TxtEmail.Text

            If Neg.Actualizar(Obj) Then
                Listar() ' Actualizar la lista de clientes después de actualizar
                LimpiarCampos() ' Limpiar los campos y preparar el modal para una nueva inserción
            End If
        Catch ex As Exception
            ' Manejo de error
        End Try
    End Sub

    Protected Sub BtnEliminar_Click(sender As Object, e As EventArgs) Handles BtnEliminar.Click
        Try
            Dim Neg As New NPersona()
            Dim id As Integer = Convert.ToInt32(DgvListado.SelectedDataKey.Value)
            Neg.Eliminar(id)
            Listar() ' Actualizar la lista después de la eliminación
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
        CboTipoDocumento.SelectedIndex = 0
        BtnInsertar.Visible = True
        BtnActualizar.Visible = False
    End Sub

    Protected Sub DgvListado_RowEditing(sender As Object, e As GridViewEditEventArgs) Handles DgvListado.RowEditing
        ' Obtener los valores de la fila seleccionada
        Dim row As GridViewRow = DgvListado.Rows(e.NewEditIndex)

        ' Función para reemplazar '&nbsp;' con una cadena vacía
        Dim obtenerValorLimpio As Func(Of String, String) = Function(valor) If(valor = "&nbsp;", "", valor)

        ' Asignación de valores a los controles del modal
        TxtId.Text = obtenerValorLimpio(row.Cells(1).Text)
        TxtNombre.Text = obtenerValorLimpio(row.Cells(3).Text)
        CboTipoDocumento.SelectedValue = obtenerValorLimpio(row.Cells(4).Text)
        TxtNumDocumento.Text = obtenerValorLimpio(row.Cells(5).Text)
        TxtDireccion.Text = obtenerValorLimpio(row.Cells(6).Text)
        TxtTelefono.Text = obtenerValorLimpio(row.Cells(7).Text)
        TxtEmail.Text = obtenerValorLimpio(row.Cells(8).Text)

        ' Cambiar el botón Insertar a Actualizar en el modal
        BtnInsertar.Visible = False
        BtnActualizar.Visible = True

        ' Establecer el valor del campo oculto para abrir el modal
        hfShowModal.Value = "True"

        ' Cancelar la edición en el GridView para que no intente cambiar de modo
        e.Cancel = True
    End Sub

    Protected Sub BtnClose_Click(sender As Object, e As EventArgs) Handles BtnClose.Click
        LimpiarCampos()
    End Sub
End Class
