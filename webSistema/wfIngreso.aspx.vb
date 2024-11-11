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
        ' Crear DataTable con las columnas especificadas
        Me.DtDetalle = New DataTable("Detalle")
        Me.DtDetalle.Columns.Add("idarticulo", GetType(Integer))
        Me.DtDetalle.Columns.Add("codigo", GetType(String))
        Me.DtDetalle.Columns.Add("articulo", GetType(String))
        Me.DtDetalle.Columns.Add("cantidad", GetType(Integer))
        Me.DtDetalle.Columns.Add("precio", GetType(Decimal))
        Me.DtDetalle.Columns.Add("importe", GetType(Decimal))

        ' Agregar una fila temporal si el DataTable está vacío para generar el encabezado
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

        ' Asignar DataTable al DataSource del GridView y enlazar datos
        DgvDetalle.DataSource = Me.DtDetalle
        DgvDetalle.DataBind()

        ' Configurar encabezados y tamaño de columnas
        DgvDetalle.HeaderRow.Cells(1).Text = "CODIGO"
        DgvDetalle.HeaderRow.Cells(2).Text = "ARTICULO"
        DgvDetalle.HeaderRow.Cells(3).Text = "CANTIDAD"
        DgvDetalle.HeaderRow.Cells(4).Text = "PRECIO"
        DgvDetalle.HeaderRow.Cells(5).Text = "IMPORTE"

        ' Configurar celdas de solo lectura
        For Each row As GridViewRow In DgvDetalle.Rows
            row.Cells(1).Enabled = False
            row.Cells(2).Enabled = False
            row.Cells(5).Enabled = False
        Next
    End Sub

    Protected Sub ConfirmarAccion(sender As Object, e As EventArgs)
        Dim accion As String = HiddenFieldAccion.Value
        Dim id As Integer = Convert.ToInt32(DgvListado.SelectedDataKey.Value)
        Dim Neg As New NIngreso()

        Try
            Select Case accion
                Case "anular"
                    Neg.Anular(id)
            End Select
            Listar() ' Actualiza la lista después de la acción
        Catch ex As Exception
            ' Manejo de error
        End Try
    End Sub

    Protected Sub BtnAnular_Click(sender As Object, e As EventArgs) Handles BtnAnular.Click
        Try
            Dim Neg As New NIngreso()
            Dim idIngreso As Integer = Convert.ToInt32(DgvListado.SelectedDataKey.Value)
            Neg.Anular(idIngreso)
            Listar() ' Actualizar la lista después de desactivar
        Catch ex As Exception
            ' Manejo de error
        End Try
    End Sub

    Protected Sub DgvListado_SelectedIndexChanged(sender As Object, e As EventArgs)
        ' Obtener el ID de la compra seleccionada
        Dim idCompra As Integer = Convert.ToInt32(DgvListado.SelectedDataKey.Value)

        ' Llamar al método para mostrar el detalle
        MostrarDetalle(idCompra)

        ' Hacer visible el panel de detalle
        PanelMostrarDetalle.Visible = True
    End Sub

    Private Sub MostrarDetalle(idCompra As Integer)
        Try
            ' Obtener los detalles de la compra
            Dim Neg As New NIngreso()
            Dim dtDetalle As DataTable = Neg.ListarDetalle(idCompra)

            ' Enlazar los datos al GridView de detalles
            DgvMostrarDetalle.DataSource = dtDetalle
            DgvMostrarDetalle.DataBind()

            ' Calcular Subtotal, Impuesto y Total
            Dim total As Decimal = 0
            Dim impuesto As Decimal = 0.18 ' Asumiendo que es el 18% como en el código original
            Dim subtotal As Decimal
            Dim totalImpuesto As Decimal

            ' Sumar los importes de cada artículo
            For Each row As DataRow In dtDetalle.Rows
                total += Convert.ToDecimal(row("importe"))
            Next

            ' Calcular subtotal y total de impuestos
            subtotal = Math.Round(total / (1 + impuesto), 2)
            totalImpuesto = Math.Round(total - subtotal, 2)

            ' Mostrar los valores en los Labels
            LblSubTotal.Text = subtotal.ToString("C", Globalization.CultureInfo.CreateSpecificCulture("es-PE"))
            LblTotalImpuesto.Text = totalImpuesto.ToString("C", Globalization.CultureInfo.CreateSpecificCulture("es-PE"))
            LblTotalGeneral.Text = total.ToString("C", Globalization.CultureInfo.CreateSpecificCulture("es-PE"))

        Catch ex As Exception
            ' Manejo de error
            ' Puedes mostrar un mensaje al usuario si es necesario
        End Try
    End Sub

End Class