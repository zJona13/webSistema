﻿Imports Sistema.Negocio

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

End Class