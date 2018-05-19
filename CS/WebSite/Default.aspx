<%-- BeginRegion --%>
<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="Grid_Editing_EditingWithCompositeKey" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v7.3, Version=7.3.12.0, Culture=neutral, PublicKeyToken=9B171C9FD64DA1D1" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v7.3, Version=7.3.12.0, Culture=neutral, PublicKeyToken=9B171C9FD64DA1D1" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%-- EndRegion --%>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>How to modify data when a composite key is used</title>
</head>
<body>
    <form id="form1" runat="server">
        
        <asp:CheckBox ID="CheckBox1" runat="server" Text="Show CompositeKey Column" AutoPostBack="True" Checked="True" OnCheckedChanged="CheckBox1_CheckedChanged" />

        <dxwgv:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False"
            DataSourceID="AccessDataSource1" KeyFieldName="CompositeKey" Width="100%" OnCustomUnboundColumnData="ASPxGridView1_CustomUnboundColumnData" OnRowUpdating="ASPxGridView1_RowUpdating" OnRowDeleting="ASPxGridView1_RowDeleting">
            <Columns>
                <dxwgv:GridViewCommandColumn VisibleIndex="0">
                    <EditButton Visible="True">
                    </EditButton>
                    <DeleteButton Visible="True">
                    </DeleteButton>
                </dxwgv:GridViewCommandColumn>
                <dxwgv:GridViewDataTextColumn FieldName="CompositeKey" UnboundType="String" VisibleIndex="1" ReadOnly="True">
                    <CellStyle BackColor="LightYellow">
                    </CellStyle>
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn Caption="Title Of Courtesy" FieldName="TitleOfCourtesy"
                    VisibleIndex="2">
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn Caption="First Name" FieldName="FirstName" VisibleIndex="3" ReadOnly="True">
                    <CellStyle BackColor="WhiteSmoke">
                    </CellStyle>
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn Caption="Last Name" FieldName="LastName" VisibleIndex="4" ReadOnly="True">
                    <CellStyle BackColor="WhiteSmoke">
                    </CellStyle>
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataDateColumn Caption="Birth Date" FieldName="BirthDate" VisibleIndex="5" ReadOnly="True">
                    <CellStyle BackColor="WhiteSmoke">
                    </CellStyle>
                </dxwgv:GridViewDataDateColumn>
                <dxwgv:GridViewDataTextColumn Caption="City" FieldName="City" VisibleIndex="6">
                </dxwgv:GridViewDataTextColumn>
            </Columns>
            <SettingsPager PageSize="5">
            </SettingsPager>
            <SettingsEditing Mode="Inline" />
        </dxwgv:ASPxGridView>

        <%-- BeginRegion DataSource --%>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
            SelectCommand="SELECT [TitleOfCourtesy], [FirstName], [LastName], [BirthDate], [City] FROM [Employees]"
            UpdateCommand="UPDATE [Employees] SET [TitleOfCourtesy] = ?, [City] = ? WHERE [FirstName] = ? AND [LastName] = ? AND [BirthDate] = ?"
            DeleteCommand="DELETE FROM [Employees] WHERE [FirstName] = ? AND [LastName] = ? AND [BirthDate] = ?">
            <UpdateParameters>
                <asp:Parameter Name="TitleOfCourtesy" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="BirthDate" Type="DateTime" />                
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="BirthDate" Type="DateTime" />                
            </DeleteParameters>
        </asp:AccessDataSource>
        <%-- EndRegion --%>
    </form>
</body>
</html>
