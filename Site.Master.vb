Imports System.Reflection
Imports System.Reflection.Assembly

Public Class SiteMaster
    Inherits MasterPage
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

        Dim _sVersion = FileVersionInfo.GetVersionInfo(GetType(About).Assembly.Location)

        Page.Title = System.Reflection.Assembly.GetExecutingAssembly.GetName().Name
        Page.Title += " - Ver. "
        Page.Title += System.Reflection.Assembly.GetExecutingAssembly.GetName().Version.ToString
        Me.lblFooter1.Text = _sVersion.CompanyName.ToString
        Me.lblFooter1.Text += " - "
        Me.lblFooter1.Text += _sVersion.ProductName.ToString
        Me.lblFooter1.Text += " - Ver. "
        Me.lblFooter1.Text += _sVersion.ProductVersion.ToString
        Me.lblFooter1.Text += " - "
        Me.lblFooter1.Text += _sVersion.Comments.ToString

    End Sub

End Class