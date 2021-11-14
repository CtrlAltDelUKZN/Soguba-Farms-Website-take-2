<%@ Page Title="Servicing" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind=".aspx.cs" Inherits="Soguba_Farms_Website_take_2.Servicing" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
  
    <asp:GridView ID = "gridServicing" runat = "server" AutoGenerateColumns="False" DataKeyNames="ServiceID" DataSourceID="SqlServicing">
        <Columns>
            <asp:BoundField DataField="ServiceID" HeaderText="ServiceID" InsertVisible="False" ReadOnly="True" SortExpression="ServiceID" />
            <asp:BoundField DataField="BoarID" HeaderText="BoarID" SortExpression="BoarID" />
            <asp:BoundField DataField="SowID" HeaderText="SowID" SortExpression="SowID" />
            <asp:BoundField DataField="StaffID" HeaderText="StaffID" SortExpression="StaffID" />
            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
            <asp:BoundField DataField="LitterID" HeaderText="LitterID" SortExpression="LitterID" />
            <asp:CheckBoxField DataField="Successful" HeaderText="Successful" SortExpression="Successful" />
            <asp:BoundField DataField="ExpectedDate" HeaderText="ExpectedDate" SortExpression="ExpectedDate" />
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlServicing" runat="server" ConnectionString="<%$ ConnectionStrings:group25ConnectionString %>" SelectCommand="SELECT * FROM [Servicing]"></asp:SqlDataSource>

</asp:Content>
