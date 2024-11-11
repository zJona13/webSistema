Imports Sistema.Negocio

Public Class wfRol1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Listar()
        End If
    End Sub

    Private Sub Listar()
        Try
            Dim Neg As New NRol()
            Dim dt As DataTable = Neg.Listar()
            DgvListado.DataSource = dt
            DgvListado.DataBind()
            LblTotal.Text = "Total Registros: " & dt.Rows.Count.ToString()
        Catch ex As Exception
            LblTotal.Text = "Error: " & ex.Message
        End Try
    End Sub

End Class