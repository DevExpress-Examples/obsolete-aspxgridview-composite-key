using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Grid_Editing_EditingWithCompositeKey : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ASPxGridView1_CustomUnboundColumnData(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewColumnDataEventArgs e) {
        if (e.Column.FieldName == "CompositeKey") {
            string firstName = Convert.ToString(e.GetListSourceFieldValue("FirstName"));
            string lastName = Convert.ToString(e.GetListSourceFieldValue("LastName"));
            string birthDate = Convert.ToString(e.GetListSourceFieldValue("BirthDate"));
            e.Value = firstName + "-" + lastName + "-" + birthDate;
        }
    }
    protected void ASPxGridView1_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e) {
        //Make the ASPxGridView know about the primary key fields: add proper name/value pairs to the Keys dictionary
        e.Keys.Clear();
        e.Keys.Add("FirstName", e.OldValues["FirstName"]);
        e.Keys.Add("LastName", e.OldValues["LastName"]);
        e.Keys.Add("BirthDate", e.OldValues["BirthDate"]);

        throw new InvalidOperationException("Data modifications are not allowed in the online demo");
    }
    protected void CheckBox1_CheckedChanged(object sender, EventArgs e) {
        ASPxGridView1.Columns["CompositeKey"].Visible = (sender as CheckBox).Checked;
    }
    protected void ASPxGridView1_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
    {
        //Make the ASPxGridView know about the primary key fields: add proper name/value pairs to the Keys dictionary
        e.Keys.Clear();
        e.Keys.Add("FirstName", e.Values["FirstName"]);
        e.Keys.Add("LastName", e.Values["LastName"]);
        e.Keys.Add("BirthDate", e.Values["BirthDate"]);

        throw new InvalidOperationException("Data modifications are not allowed in the online demo");
    }
}
