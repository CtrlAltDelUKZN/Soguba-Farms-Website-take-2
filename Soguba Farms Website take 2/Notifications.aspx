<%@ Page Title="Notifications" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Notifications.aspx.cs" Inherits="Soguba_Farms_Website_take_2.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <div> &nbsp </div>
    <asp:GridView ID = "gridNotifications" runat = "server" AutoGenerateColumns="False" DataKeyNames="NoteID" DataSourceID="SqlNotifications">
        <Columns>
            <asp:BoundField DataField="NoteID" HeaderText="NoteID" InsertVisible="False" ReadOnly="True" SortExpression="NoteID" />
            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:BoundField DataField="StaffID" HeaderText="StaffID" SortExpression="StaffID" />
            <asp:BoundField DataField="PigID" HeaderText="PigID" SortExpression="PigID" />
            <asp:CheckBoxField DataField="TaskComplete" HeaderText="TaskComplete" SortExpression="TaskComplete" />
        </Columns>
    </asp:GridView>
  
    <asp:SqlDataSource ID="SqlNotifications" runat="server" ConnectionString="<%$ ConnectionStrings:group25ConnectionString %>" SelectCommand="SELECT * FROM [Notifications]"></asp:SqlDataSource>
  
</asp:Content>
