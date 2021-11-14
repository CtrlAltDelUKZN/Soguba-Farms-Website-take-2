<%@ Page Title="Weaning" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind=".aspx.cs" Inherits="Soguba_Farms_Website_take_2.Weaning" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <asp:GridView ID = "gridWeaning" runat = "server" AutoGenerateColumns="False" DataKeyNames="WeaningID" DataSourceID="SqlWeaning">
        <Columns>
            <asp:BoundField DataField="WeaningID" HeaderText="WeaningID" InsertVisible="False" ReadOnly="True" SortExpression="WeaningID" />
            <asp:BoundField DataField="LitterID" HeaderText="LitterID" SortExpression="LitterID" />
            <asp:BoundField DataField="SowID" HeaderText="SowID" SortExpression="SowID" />
            <asp:BoundField DataField="NumberWeaned" HeaderText="NumberWeaned" SortExpression="NumberWeaned" />
            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
            <asp:BoundField DataField="AverageWeight" HeaderText="AverageWeight" SortExpression="AverageWeight" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlWeaning" runat="server" ConnectionString="<%$ ConnectionStrings:group25ConnectionString %>" SelectCommand="SELECT * FROM [Weaning]"></asp:SqlDataSource>
    </asp:Content>

