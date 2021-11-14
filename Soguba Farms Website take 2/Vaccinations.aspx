<%@ Page Title="Vaccinations" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Vaccinations.aspx.cs" Inherits="Soguba_Farms_Website_take_2.Vaccinations" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>

   <asp:GridView ID = "gridVaccinations" runat = "server" AutoGenerateColumns="False" DataKeyNames="pigVaccID" DataSourceID="SqlVaccinations">
       <Columns>
           <asp:BoundField DataField="pigVaccID" HeaderText="pigVaccID" InsertVisible="False" ReadOnly="True" SortExpression="pigVaccID" />
           <asp:BoundField DataField="pigID" HeaderText="pigID" SortExpression="pigID" />
           <asp:BoundField DataField="VaccineID" HeaderText="VaccineID" SortExpression="VaccineID" />
           <asp:BoundField DataField="staffID" HeaderText="staffID" SortExpression="staffID" />
           <asp:CheckBoxField DataField="administered" HeaderText="administered" SortExpression="administered" />
           <asp:BoundField DataField="dateAdministered" HeaderText="dateAdministered" SortExpression="dateAdministered" />
       </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlVaccinations" runat="server" ConnectionString="<%$ ConnectionStrings:group25ConnectionString %>" SelectCommand="SELECT * FROM [PigVaccination]"></asp:SqlDataSource>
</asp:Content>
