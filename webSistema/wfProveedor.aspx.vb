Imports Sistema.Negocio

Public Class wfProveedor
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Listar()
        End If
    End Sub

    Private Sub Listar()
        Try
            Dim Neg As New NPersona()
            Dim dt As DataTable = Neg.ListarProveedores()
            DgvListado.DataSource = dt
            DgvListado.DataBind()
        Catch ex As Exception
            ' Manejo de error
        End Try
    End Sub

End Class