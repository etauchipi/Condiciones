

Public Class _Default
    Inherits Page

    Private _Calificacion As Int16
    Private _Valido As Boolean
    Private rRegistro As wsCondiciones.Registro
    Private wServicio As wsCondiciones.IwsCondicionesClient

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        Me.imgClasif.Visible = False
        Me.clasificacion.Visible = False
        Me.lblAlerta.Visible = False
        Me.fecha.Visible = False
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        Limpiar()

    End Sub

    Private Sub Limpiar()

        Me.tbIdentificacion.Text = String.Empty
        Me.rblQuinceDias.ClearSelection()
        Me.rblPruebasDx.ClearSelection()
        Me.rblSintomas.ClearSelection()
        Me.rblTipoId.ClearSelection()
        Me.rblTipoIngreso.ClearSelection()
        Me.clasificacion.Visible = False
        Me.fecha.Visible = False
        Me.imgClasif.Visible = False
        Me.lblAlerta.Visible = False
        imgClasif.ImageUrl = ""
        _Valido = False
        _Calificacion = 0
        Me.panelMain.Visible = True
        Me.BtFinalizar.Visible = True

    End Sub

    Private Sub Puntaje()

        Try
            _Calificacion = rblSintomas.SelectedValue
            _Calificacion += rblPruebasDx.SelectedValue
            _Calificacion += rblQuinceDias.SelectedValue
        Catch ex As Exception
            _Calificacion = -1
        End Try

    End Sub

    Private Sub Validar()

        Dim nVal As Int16
        _Valido = True

        nVal = -1

        Try
            nVal = rblTipoId.SelectedValue
            nVal += rblTipoIngreso.SelectedValue
        Catch ex As Exception
            _Valido = False
        End Try

        If (_Valido) Then

            If ((tbIdentificacion.Text = String.Empty)) Then
                _Valido = False
            End If
        End If

    End Sub

    Protected Sub BtFinalizar_Click(sender As Object, e As EventArgs) Handles BtFinalizar.Click

        Me.lblAlerta.Visible = False

        Validar()

        If (_Valido) Then

            Puntaje()

            If (_Calificacion > 0) Then
                imgClasif.ImageUrl = "~/Images/blue.png"
            Else
                If (_Calificacion < 0) Then
                    _Valido = False
                    imgClasif.ImageUrl = ""
                    Me.lblAlerta.Visible = True
                Else
                    imgClasif.ImageUrl = "~/Images/green.png"
                End If
            End If
        Else
            Me.lblAlerta.Visible = True
            imgClasif.ImageUrl = ""
        End If

        If (imgClasif.ImageUrl <> "") Then
            imgClasif.Visible = True
            Me.clasificacion.Visible = True
            Me.fecha.Visible = True
            Me.panelMain.Visible = False
            Me.BtFinalizar.Visible = False
        Else
            imgClasif.Visible = False
        End If

        If (_Valido) Then
            EnviarData()
            Me.fecha.Text = "Fecha: " & Now().ToLongDateString & " - " & Now().ToLongTimeString
        End If

    End Sub

    Private Sub EnviarData()

        rRegistro = New wsCondiciones.Registro
        wServicio = New wsCondiciones.IwsCondicionesClient

        rRegistro.Azul = IIf(_Calificacion > 0, True, False)
        rRegistro.Sintomas = IIf(rblSintomas.SelectedValue = 1, True, False)
        rRegistro.Prueba = IIf(rblPruebasDx.SelectedValue = 1, True, False)
        rRegistro.Contacto = IIf(rblQuinceDias.SelectedValue = 1, True, False)
        rRegistro.Empleado = IIf(rblTipoIngreso.SelectedValue = 1, False, True)
        rRegistro.TipoIde = rblTipoId.SelectedItem.Text.Trim()
        rRegistro.Identificacion = tbIdentificacion.Text.Trim()

        Try
            wServicio.Set_Ingreso(rRegistro)
        Catch ex As Exception

        End Try


    End Sub


End Class