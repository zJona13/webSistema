Imports Sistema.Datos
Imports Sistema.Negocio

Public Class wfArticulo
    Inherits System.Web.UI.Page

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
            CboCategoria.DataSource = Neg.Seleccionar
            CboCategoria.DataValueField = "idcategoria"
            CboCategoria.DataTextField = "nombre"
            CboCategoria.DataBind()
        Catch ex As Exception
            ' Manejo de error
        End Try
    End Sub
End Class