<%@ Page Title="Pigs" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Pigs.aspx.cs" Inherits="Soguba_Farms_Website_take_2.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>

 
    <asp:GridView ID = "Pigs" runat = "server" AutoGenerateColumns="False" DataKeyNames="PigID" DataSourceID="SqlPigs">
        <Columns>
            <asp:BoundField DataField="PigID" HeaderText="PigID" InsertVisible="False" ReadOnly="True" SortExpression="PigID" />
            <asp:BoundField DataField="Sex" HeaderText="Sex" SortExpression="Sex" />
            <asp:BoundField DataField="Breed" HeaderText="Breed" SortExpression="Breed" />
            <asp:BoundField DataField="DateofBirth" HeaderText="DateofBirth" SortExpression="DateofBirth" />
            <asp:BoundField DataField="Age" HeaderText="Age" SortExpression="Age" />
            <asp:BoundField DataField="BirthWeight" HeaderText="BirthWeight" SortExpression="BirthWeight" />
            <asp:BoundField DataField="CurrentWeight" HeaderText="CurrentWeight" SortExpression="CurrentWeight" />
            <asp:BoundField DataField="Accommodation" HeaderText="Accommodation" SortExpression="Accommodation" />
            <asp:BoundField DataField="SowAvgNumPigsPerLit" HeaderText="SowAvgNumPigsPerLit" SortExpression="SowAvgNumPigsPerLit" />
            <asp:BoundField DataField="SowAvgLitterWeight" HeaderText="SowAvgLitterWeight" SortExpression="SowAvgLitterWeight" />
            <asp:BoundField DataField="SowNumFarrows" HeaderText="SowNumFarrows" SortExpression="SowNumFarrows" />
            <asp:BoundField DataField="SowNumMiscarriages" HeaderText="SowNumMiscarriages" SortExpression="SowNumMiscarriages" />
            <asp:CheckBoxField DataField="SowPregnant" HeaderText="SowPregnant" SortExpression="SowPregnant" />
            <asp:BoundField DataField="BoarNumServices" HeaderText="BoarNumServices" SortExpression="BoarNumServices" />
            <asp:BoundField DataField="LitterID" HeaderText="LitterID" SortExpression="LitterID" />
            <asp:BoundField DataField="CauseOfDeath" HeaderText="CauseOfDeath" SortExpression="CauseOfDeath" />
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlPigs" runat="server" ConnectionString="<%$ ConnectionStrings:group25ConnectionString %>" SelectCommand="SELECT * FROM [Pig]"></asp:SqlDataSource>

</asp:Content>
