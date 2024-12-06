Imports Sistema.Negocio

Public Class wfIngreso
    Inherits System.Web.UI.Page

    Private DtDetalle As DataTable
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Listar()
            CrearTablaDetalle()
        End If
    End Sub

    Private Sub Listar()
        Try
            Dim Neg As New NIngreso()
            Dim dt As DataTable = Neg.Listar()
            DgvListado.DataSource = dt
            DgvListado.DataBind()
        Catch ex As Exception
            ' Manejo de error
        End Try
    End Sub

    Private Sub CrearTablaDetalle()
        Me.DtDetalle = New DataTable("Detalle")
        Me.DtDetalle.Columns.Add("idarticulo", GetType(Integer))
        Me.DtDetalle.Columns.Add("codigo", GetType(String))
        Me.DtDetalle.Columns.Add("articulo", GetType(String))
        Me.DtDetalle.Columns.Add("cantidad", GetType(Integer))
        Me.DtDetalle.Columns.Add("precio", GetType(Decimal))
        Me.DtDetalle.Columns.Add("importe", GetType(Decimal))

        If Me.DtDetalle.Rows.Count = 0 Then
            Dim row As DataRow = Me.DtDetalle.NewRow()
            row("idarticulo") = 0
            row("codigo") = ""
            row("articulo") = ""
            row("cantidad") = 0
            row("precio") = 0
            row("importe") = 0
            Me.DtDetalle.Rows.Add(row)
        End If

        DgvDetalle.DataSource = Me.DtDetalle
        DgvDetalle.DataBind()

        DgvDetalle.HeaderRow.Cells(1).Text = "CODIGO"
        DgvDetalle.HeaderRow.Cells(2).Text = "ARTICULO"
        DgvDetalle.HeaderRow.Cells(3).Text = "CANTIDAD"
        DgvDetalle.HeaderRow.Cells(4).Text = "PRECIO"
        DgvDetalle.HeaderRow.Cells(5).Text = "IMPORTE"

        For Each row As GridViewRow In DgvDetalle.Rows
            row.Cells(1).Enabled = False
            row.Cells(2).Enabled = False
            row.Cells(5).Enabled = False
        Next
    End Sub

    Protected Sub BtnAnular_Click(sender As Object, e As EventArgs) Handles BtnAnular.Click
        Try
            Dim Neg As New NIngreso()
            Dim idIngreso As Integer = Convert.ToInt32(DgvListado.SelectedDataKey.Value)
            Neg.Anular(idIngreso)
            Listar()
            DgvListado.SelectedIndex = -1
        Catch ex As Exception
            ' Manejo de error
        End Try
    End Sub

    Protected Sub DgvListado_SelectedIndexChanged(sender As Object, e As EventArgs)
        Dim idCompra As Integer = Convert.ToInt32(DgvListado.SelectedDataKey.Value)

        MostrarDetalle(idCompra)

        PanelMostrarDetalle.Visible = True
    End Sub

    Private Sub MostrarDetalle(idCompra As Integer)
        Try
            Dim Neg As New NIngreso()
            Dim dtDetalle As DataTable = Neg.ListarDetalle(idCompra)

            DgvMostrarDetalle.DataSource = dtDetalle
            DgvMostrarDetalle.DataBind()

            Dim total As Decimal = 0
            Dim impuesto As Decimal = 0.18
            Dim subtotal As Decimal
            Dim totalImpuesto As Decimal

            For Each row As DataRow In dtDetalle.Rows
                total += Convert.ToDecimal(row("importe"))
            Next

            subtotal = Math.Round(total / (1 + impuesto), 2)
            totalImpuesto = Math.Round(total - subtotal, 2)

            LblSubTotal.Text = subtotal.ToString("C", Globalization.CultureInfo.CreateSpecificCulture("es-PE"))
            LblTotalImpuesto.Text = totalImpuesto.ToString("C", Globalization.CultureInfo.CreateSpecificCulture("es-PE"))
            LblTotalGeneral.Text = total.ToString("C", Globalization.CultureInfo.CreateSpecificCulture("es-PE"))

        Catch ex As Exception
            ' Manejo de error
            ' Puedes mostrar un mensaje al usuario si es necesario
        End Try
    End Sub

    Protected Sub DgvListado_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        Try
            DgvListado.PageIndex = e.NewPageIndex
            Listar()
        Catch ex As Exception
            ' Manejo de error
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Error", $"alert('Error al cambiar de página: {ex.Message}');", True)
        End Try
    End Sub
End Class