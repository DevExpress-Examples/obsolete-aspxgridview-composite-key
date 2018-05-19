Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls

Partial Public Class Grid_Editing_EditingWithCompositeKey
	Inherits System.Web.UI.Page
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

	End Sub
	Protected Sub ASPxGridView1_CustomUnboundColumnData(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridView.ASPxGridViewColumnDataEventArgs)
		If e.Column.FieldName = "CompositeKey" Then
			Dim firstName As String = Convert.ToString(e.GetListSourceFieldValue("FirstName"))
			Dim lastName As String = Convert.ToString(e.GetListSourceFieldValue("LastName"))
			Dim birthDate As String = Convert.ToString(e.GetListSourceFieldValue("BirthDate"))
			e.Value = firstName & "-" & lastName & "-" & birthDate
		End If
	End Sub
	Protected Sub ASPxGridView1_RowUpdating(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataUpdatingEventArgs)
		'Make the ASPxGridView know about the primary key fields: add proper name/value pairs to the Keys dictionary
		e.Keys.Clear()
		e.Keys.Add("FirstName", e.OldValues("FirstName"))
		e.Keys.Add("LastName", e.OldValues("LastName"))
		e.Keys.Add("BirthDate", e.OldValues("BirthDate"))

		Throw New InvalidOperationException("Data modifications are not allowed in the online demo")
	End Sub
	Protected Sub CheckBox1_CheckedChanged(ByVal sender As Object, ByVal e As EventArgs)
		ASPxGridView1.Columns("CompositeKey").Visible = (TryCast(sender, CheckBox)).Checked
	End Sub
End Class
