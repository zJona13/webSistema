Imports Sistema.Entidades
Imports Sistema.Negocio
Imports System.IO

Public Class wfArticulo
    Inherits System.Web.UI.Page

    Private RutaOrigen As String
    Private RutaDestino As String
    Private Directorio As String = "D:\sistema\"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Listar()
            CargarCategoria()
        End If
    End Sub

    Private Sub Listar()
        Try
            Dim Neg As New NArticulo()
            Dim dt As DataTable = Neg.Listar()
            DgvListado.DataSource = dt
            DgvListado.DataBind()
        Catch ex As Exception
            ' Manejo de error
        End Try
    End Sub

    Private Sub CargarCategoria()
        Try
            Dim Neg As New NCategoria()
            CboCategoria.DataSource = Neg.Seleccionar()
            CboCategoria.DataValueField = "idcategoria"
            CboCategoria.DataTextField = "nombre"
            CboCategoria.DataBind()
        Catch ex As Exception
            ' Manejo de error
        End Try
    End Sub

    Protected Sub BtnEliminar_Click(sender As Object, e As EventArgs) Handles BtnEliminar.Click
        Try
            Dim Neg As New NArticulo()
            Dim id As Integer = Convert.ToInt32(DgvListado.SelectedDataKey.Value)
            Dim imagen As String = txtImagen.Text

            If Neg.Eliminar(id) Then
                If Not String.IsNullOrEmpty(imagen) Then
                    File.Delete(Path.Combine(Directorio, imagen))
                End If
                Listar()
                DgvListado.SelectedIndex = -1
            End If
        Catch ex As Exception
            ' Manejo de error
        End Try
    End Sub

    Protected Sub BtnActivar_Click(sender As Object, e As EventArgs) Handles BtnActivar.Click
        Try
            Dim Neg As New NArticulo()
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
            Dim Neg As New NArticulo()
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
        TxtCodigo.Text = ""
        TxtNombre.Text = ""
        TxtStock.Text = ""
        TxtPrecioVenta.Text = ""
        TxtDescripcion.Text = ""
        txtImagen.Text = ""
        PicImagen.ImageUrl = ""
        CboCategoria.SelectedIndex = 0
        BtnInsertar.Visible = True
        BtnActualizar.Visible = False
    End Sub

    Protected Sub BtnInsertar_Click(sender As Object, e As EventArgs) Handles BtnInsertar.Click
        Try
            If String.IsNullOrEmpty(TxtNombre.Text) Or String.IsNullOrEmpty(TxtStock.Text) Or String.IsNullOrEmpty(TxtPrecioVenta.Text) Then
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Pop", "alert('Por favor, rellene todos los campos obligatorios.');", True)
                Return
            End If

            Dim Obj As New Articulo()
            Dim Neg As New NArticulo()

            Obj.IdCategoria = CboCategoria.SelectedValue
            Obj.Codigo = TxtCodigo.Text
            Obj.Nombre = TxtNombre.Text
            Obj.Stock = TxtStock.Text
            Obj.PrecioVenta = TxtPrecioVenta.Text
            Obj.Descripcion = TxtDescripcion.Text
            Obj.Imagen = txtImagen.Text

            If Neg.Insertar(Obj) Then
                If Not String.IsNullOrEmpty(txtImagen.Text) Then
                    RutaDestino = Path.Combine(Directorio, txtImagen.Text)
                    File.Copy(RutaOrigen, RutaDestino)
                End If
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
        CboCategoria.SelectedValue = obtenerValorLimpio(row.Cells(2).Text)
        TxtCodigo.Text = obtenerValorLimpio(row.Cells(4).Text)
        TxtNombre.Text = obtenerValorLimpio(row.Cells(5).Text)
        TxtStock.Text = obtenerValorLimpio(row.Cells(7).Text)
        TxtPrecioVenta.Text = obtenerValorLimpio(row.Cells(6).Text)
        TxtDescripcion.Text = obtenerValorLimpio(row.Cells(8).Text)
        txtImagen.Text = obtenerValorLimpio(row.Cells(9).Text)

        If Not String.IsNullOrEmpty(txtImagen.Text) Then
            PicImagen.ImageUrl = "~/images/" & txtImagen.Text
        Else
            PicImagen.ImageUrl = ""
        End If

        BtnInsertar.Visible = False
        BtnActualizar.Visible = True

        e.Cancel = True
    End Sub

    Protected Sub BtnActualizar_Click(sender As Object, e As EventArgs) Handles BtnActualizar.Click
        Try
            If String.IsNullOrEmpty(TxtNombre.Text) Or String.IsNullOrEmpty(TxtStock.Text) Or String.IsNullOrEmpty(TxtPrecioVenta.Text) Or String.IsNullOrEmpty(TxtId.Text) Then
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Pop", "alert('Por favor, rellene todos los campos obligatorios.');", True)
                Return
            End If

            Dim Obj As New Articulo()
            Dim Neg As New NArticulo()

            Obj.IdArticulo = Convert.ToInt32(TxtId.Text)
            Obj.IdCategoria = CboCategoria.SelectedValue
            Obj.Codigo = TxtCodigo.Text
            Obj.Nombre = TxtNombre.Text
            Obj.Stock = TxtStock.Text
            Obj.PrecioVenta = TxtPrecioVenta.Text
            Obj.Descripcion = TxtDescripcion.Text
            Obj.Imagen = txtImagen.Text

            If Neg.Actualizar(Obj) Then
                If Not String.IsNullOrEmpty(txtImagen.Text) AndAlso Not String.IsNullOrEmpty(RutaOrigen) Then
                    RutaDestino = Path.Combine(Directorio, txtImagen.Text)
                    File.Copy(RutaOrigen, RutaDestino, True)
                End If
                Listar()
                LimpiarCampos()
            End If
        Catch ex As Exception
            ' Manejo de error
        End Try
    End Sub

    Protected Sub BtnCargarImagen_Click(sender As Object, e As EventArgs) Handles BtnCargarImagen.Click
        Dim fileDialog As New FileUpload()
        If fileDialog.HasFile Then
            RutaOrigen = fileDialog.PostedFile.FileName
            txtImagen.Text = Path.GetFileName(RutaOrigen)
            PicImagen.ImageUrl = "~/imagenes/" & txtImagen.Text
        End If
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