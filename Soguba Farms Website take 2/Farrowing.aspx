﻿<%@ Page Title="Vaccinations" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Farrowing.aspx.cs" Inherits="Soguba_Farms_Website_take_2.Vaccinations" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>

    <div style ="width: 45%; float: left; ">
        <asp:Button ID="Button1" runat="server" Text="Button" />
        <asp:Button ID="Button2" runat="server" Text="Button" />
        <asp:TextBox ID="txtSearch" runat="server" AutoPostBack="True"></asp:TextBox>
    </div>

    <div></div>

    <div style ="width: 25%; float: left; ">
        <asp:Label ID="lblFarrowID" runat="server" Text="FarrowID"></asp:Label>
        <asp:DropDownList ID="ddlLitID" runat="server" DataSourceID="SqlLitD" DataTextField="LitterID" DataValueField="LitterID"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlLitD" runat="server" ConnectionString="<%$ ConnectionStrings:group25ConnectionString %>" SelectCommand="SELECT [LitterID] FROM [Litter]"></asp:SqlDataSource>
        <asp:TextBox ID="txtWeight" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtLive" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtStill" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtWeak" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtMummified" runat="server"></asp:TextBox>
    </div>

    <div style ="width: 45%; float: left; ">
        <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
    </div>

    <div style ="width: 90%; float: left;">

        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="FarrowID" DataSourceID="SqlFarrowing" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="FarrowID" HeaderText="FarrowID" InsertVisible="False" ReadOnly="True" SortExpression="FarrowID" />
                <asp:BoundField DataField="LitterID" HeaderText="LitterID" SortExpression="LitterID" />
                <asp:BoundField DataField="AverageWeight" HeaderText="AverageWeight" SortExpression="AverageWeight" />
                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                <asp:BoundField DataField="LiveBorn" HeaderText="LiveBorn" SortExpression="LiveBorn" />
                <asp:BoundField DataField="StillBorn" HeaderText="StillBorn" SortExpression="StillBorn" />
                <asp:BoundField DataField="WeakBorn" HeaderText="WeakBorn" SortExpression="WeakBorn" />
                <asp:BoundField DataField="Mummified" HeaderText="Mummified" SortExpression="Mummified" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlFarrowing" runat="server" ConnectionString="<%$ ConnectionStrings:group25ConnectionString %>" DeleteCommand="DELETE FROM [Farrowing] WHERE [FarrowID] = @original_FarrowID AND (([LitterID] = @original_LitterID) OR ([LitterID] IS NULL AND @original_LitterID IS NULL)) AND [AverageWeight] = @original_AverageWeight AND [Date] = @original_Date AND [LiveBorn] = @original_LiveBorn AND [StillBorn] = @original_StillBorn AND [WeakBorn] = @original_WeakBorn AND [Mummified] = @original_Mummified" InsertCommand="INSERT INTO [Farrowing] ([LitterID], [AverageWeight], [Date], [LiveBorn], [StillBorn], [WeakBorn], [Mummified]) VALUES (@LitterID, @AverageWeight, @Date, @LiveBorn, @StillBorn, @WeakBorn, @Mummified)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM Farrowing" UpdateCommand="UPDATE [Farrowing] SET [LitterID] = @LitterID, [AverageWeight] = @AverageWeight, [Date] = @Date, [LiveBorn] = @LiveBorn, [StillBorn] = @StillBorn, [WeakBorn] = @WeakBorn, [Mummified] = @Mummified WHERE [FarrowID] = @original_FarrowID">
            <DeleteParameters>
                <asp:Parameter Name="original_FarrowID" Type="Int32" />
                <asp:Parameter Name="original_LitterID" Type="Int32" />
                <asp:Parameter Name="original_AverageWeight" Type="Double" />
                <asp:Parameter DbType="Date" Name="original_Date" />
                <asp:Parameter Name="original_LiveBorn" Type="Int16" />
                <asp:Parameter Name="original_StillBorn" Type="Int16" />
                <asp:Parameter Name="original_WeakBorn" Type="Int16" />
                <asp:Parameter Name="original_Mummified" Type="Int16" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="ddlLitID" Name="LitterID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="txtWeight" Name="AverageWeight" PropertyName="Text" Type="Double" />
                <asp:ControlParameter ControlID="Calendar1" DbType="Date" Name="Date" PropertyName="SelectedDate" />
                <asp:ControlParameter ControlID="txtLive" Name="LiveBorn" PropertyName="Text" Type="Int16" />
                <asp:ControlParameter ControlID="txtStill" Name="StillBorn" PropertyName="Text" Type="Int16" />
                <asp:ControlParameter ControlID="txtWeak" Name="WeakBorn" PropertyName="Text" Type="Int16" />
                <asp:ControlParameter ControlID="txtMummified" Name="Mummified" PropertyName="Text" Type="Int16" />
            </InsertParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="ddlLitID" Name="LitterID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="txtWeight" Name="AverageWeight" PropertyName="Text" Type="Double" />
                <asp:ControlParameter ControlID="Calendar1" DbType="Date" Name="Date" PropertyName="SelectedDate" />
                <asp:ControlParameter ControlID="txtLive" Name="LiveBorn" PropertyName="Text" Type="Int16" />
                <asp:ControlParameter ControlID="txtStill" Name="StillBorn" PropertyName="Text" Type="Int16" />
                <asp:ControlParameter ControlID="txtWeak" Name="WeakBorn" PropertyName="Text" Type="Int16" />
                <asp:ControlParameter ControlID="txtMummified" Name="Mummified" PropertyName="Text" Type="Int16" />
                <asp:ControlParameter ControlID="lblFarrowID" Name="original_FarrowID" PropertyName="Text" Type="Int32" />
                <asp:Parameter Name="original_LitterID" Type="Int32" />
                <asp:Parameter Name="original_AverageWeight" Type="Double" />
                <asp:Parameter DbType="Date" Name="original_Date" />
                <asp:Parameter Name="original_LiveBorn" Type="Int16" />
                <asp:Parameter Name="original_StillBorn" Type="Int16" />
                <asp:Parameter Name="original_WeakBorn" Type="Int16" />
                <asp:Parameter Name="original_Mummified" Type="Int16" />
            </UpdateParameters>
        </asp:SqlDataSource>

    </div>

   </asp:Content>