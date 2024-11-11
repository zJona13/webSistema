Imports Sistema

Public Class wfLogin
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnCancelar_Click(sender As Object, e As EventArgs) Handles btnCancelar.Click
        txtEmail.Text = ""
        txtClave.Text = ""
        lblMensaje.Text = ""
    End Sub

    Protected Sub btnAcceder_Click(sender As Object, e As EventArgs) Handles btnAcceder.Click
        Try
            Dim Email As String = txtEmail.Text.Trim()
            Dim Clave As String = txtClave.Text.Trim()
            Dim Neg As New Negocio.NUsuario()
            Dim Obj As Entidades.Usuario = Neg.Login(Email, Clave)

            If Obj Is Nothing Then
                lblMensaje.Text = "No existe un usuario con ese email o clave."
                lblMensaje.ForeColor = System.Drawing.Color.Red
            Else
                If Obj.Estado = False Then
                    lblMensaje.Text = "El usuario no está activo."
                    lblMensaje.ForeColor = System.Drawing.Color.Red
                Else
                    Session("IdUsuario") = Obj.IdUsuario
                    Session("Rol") = Obj.Rol
                    Session("Nombre") = Obj.Nombre
                    Response.Redirect("wfPrincipal.aspx")
                End If
            End If
        Catch ex As Exception
            lblMensaje.Text = "Error: " & ex.Message
            lblMensaje.ForeColor = System.Drawing.Color.Red
        End Try
    End Sub
End Class