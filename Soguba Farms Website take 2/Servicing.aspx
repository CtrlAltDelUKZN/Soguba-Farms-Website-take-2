﻿<%@ Page Title="Servicing" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind=".aspx.cs" Inherits="Soguba_Farms_Website_take_2.Servicing" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
  
    <div>
        <asp:Button ID="btnAdd" runat="server" Text="Insert" />
        <asp:Button ID="btnEdit" runat="server" Text="Update" />
        <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
    </div>

    <div style ="width: 25%; float: left; ">

        <asp:DropDownList ID="ddlSow" runat="server" DataSourceID="SqlSowID" DataTextField="PigID" DataValueField="PigID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlSowID" runat="server" ConnectionString="<%$ ConnectionStrings:group25ConnectionString %>" SelectCommand="SELECT [PigID] FROM [Pig] WHERE ([Sex] = @Sex)">
            <SelectParameters>
                <asp:Parameter DefaultValue="F" Name="Sex" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:DropDownList ID="ddlBoar" runat="server" DataSourceID="SqlBoar" DataTextField="PigID" DataValueField="PigID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlBoar" runat="server" ConnectionString="<%$ ConnectionStrings:group25ConnectionString %>" SelectCommand="SELECT [PigID] FROM [Pig] WHERE ([Sex] = @Sex)">
            <SelectParameters>
                <asp:Parameter DefaultValue="M" Name="Sex" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:DropDownList ID="ddlStaff" runat="server" DataSourceID="SqlStaffID" DataTextField="StaffID" DataValueField="StaffID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlStaffID" runat="server" ConnectionString="<%$ ConnectionStrings:group25ConnectionString %>" SelectCommand="SELECT [StaffID] FROM [Employees]"></asp:SqlDataSource>

        <asp:CheckBox ID="cbSuccess" runat="server" Text="Success" OnCheckedChanged="cbSuccess_CheckedChanged" />

    </div>
            
    <div style ="width: 35%; float: left; ">
        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" CellSpacing="1" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="160px" NextPrevFormat="ShortMonth" Width="330px">
            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" Height="8pt" />
            <DayStyle BackColor="#CCCCCC" />
            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
            <OtherMonthDayStyle ForeColor="#999999" />
            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
            <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" Font-Size="12pt" ForeColor="White" Height="12pt" />
            <TodayDayStyle BackColor="#999999" ForeColor="White" />
        </asp:Calendar>
    </div>

    <div style ="width: 25%; float: left; ">

        <asp:SqlDataSource ID="SqlCreateLitter" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:group25ConnectionString %>" DeleteCommand="DELETE FROM [Litter] WHERE [LitterID] = @original_LitterID AND (([FarrowID] = @original_FarrowID) OR ([FarrowID] IS NULL AND @original_FarrowID IS NULL)) AND (([ServiceID] = @original_ServiceID) OR ([ServiceID] IS NULL AND @original_ServiceID IS NULL)) AND [CurrentAvgWeight] = @original_CurrentAvgWeight AND [NumberOfPiglets] = @original_NumberOfPiglets" InsertCommand="INSERT INTO [Litter] ([LitterID], [FarrowID], [ServiceID], [CurrentAvgWeight], [NumberOfPiglets]) VALUES (@LitterID, @FarrowID, @ServiceID, @CurrentAvgWeight, @NumberOfPiglets)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Litter]" UpdateCommand="UPDATE [Litter] SET [FarrowID] = @FarrowID, [ServiceID] = @ServiceID, [CurrentAvgWeight] = @CurrentAvgWeight, [NumberOfPiglets] = @NumberOfPiglets WHERE [LitterID] = @original_LitterID AND (([FarrowID] = @original_FarrowID) OR ([FarrowID] IS NULL AND @original_FarrowID IS NULL)) AND (([ServiceID] = @original_ServiceID) OR ([ServiceID] IS NULL AND @original_ServiceID IS NULL)) AND [CurrentAvgWeight] = @original_CurrentAvgWeight AND [NumberOfPiglets] = @original_NumberOfPiglets">
            <DeleteParameters>
                <asp:Parameter Name="original_LitterID" Type="Int32" />
                <asp:Parameter Name="original_FarrowID" Type="Int32" />
                <asp:Parameter Name="original_ServiceID" Type="Int32" />
                <asp:Parameter Name="original_CurrentAvgWeight" Type="Double" />
                <asp:Parameter Name="original_NumberOfPiglets" Type="Int16" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="LitterID" Type="Int32" />
                <asp:Parameter Name="FarrowID" Type="Int32" />
                <asp:Parameter Name="ServiceID" Type="Int32" />
                <asp:Parameter Name="CurrentAvgWeight" Type="Double" />
                <asp:Parameter Name="NumberOfPiglets" Type="Int16" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="FarrowID" Type="Int32" />
                <asp:Parameter Name="ServiceID" Type="Int32" />
                <asp:Parameter Name="CurrentAvgWeight" Type="Double" />
                <asp:Parameter Name="NumberOfPiglets" Type="Int16" />
                <asp:Parameter Name="original_LitterID" Type="Int32" />
                <asp:Parameter Name="original_FarrowID" Type="Int32" />
                <asp:Parameter Name="original_ServiceID" Type="Int32" />
                <asp:Parameter Name="original_CurrentAvgWeight" Type="Double" />
                <asp:Parameter Name="original_NumberOfPiglets" Type="Int16" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:Label ID="lblTest" runat="server" Text="Label"></asp:Label>

    </div>

    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ServiceID" DataSourceID="SqlWeaningData" ForeColor="#333333" GridLines="None" Width="734px" AllowPaging="True" AllowSorting="True">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="ServiceID" HeaderText="ServiceID" InsertVisible="False" ReadOnly="True" SortExpression="ServiceID" />
                <asp:BoundField DataField="BoarID" HeaderText="BoarID" SortExpression="BoarID" />
                <asp:BoundField DataField="SowID" HeaderText="SowID" SortExpression="SowID" />
                <asp:BoundField DataField="StaffID" HeaderText="StaffID" SortExpression="StaffID" />
                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                <asp:BoundField DataField="LitterID" HeaderText="LitterID" SortExpression="LitterID" />
                <asp:CheckBoxField DataField="Successful" HeaderText="Successful" SortExpression="Successful" />
                <asp:BoundField DataField="ExpectedDate" HeaderText="ExpectedDate" SortExpression="ExpectedDate" />
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
        <asp:SqlDataSource ID="SqlWeaningData" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:group25ConnectionString %>" DeleteCommand="DELETE FROM [Servicing] WHERE [ServiceID] = @original_ServiceID AND [BoarID] = @original_BoarID AND [SowID] = @original_SowID AND [StaffID] = @original_StaffID AND [Date] = @original_Date AND (([LitterID] = @original_LitterID) OR ([LitterID] IS NULL AND @original_LitterID IS NULL)) AND [Successful] = @original_Successful AND (([ExpectedDate] = @original_ExpectedDate) OR ([ExpectedDate] IS NULL AND @original_ExpectedDate IS NULL))" InsertCommand="INSERT INTO [Servicing] ([BoarID], [SowID], [StaffID], [Date], [LitterID], [Successful], [ExpectedDate]) VALUES (@BoarID, @SowID, @StaffID, @Date, @LitterID, @Successful, @ExpectedDate)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Servicing]" UpdateCommand="UPDATE [Servicing] SET [BoarID] = @BoarID, [SowID] = @SowID, [StaffID] = @StaffID, [Date] = @Date, [LitterID] = @LitterID, [Successful] = @Successful, [ExpectedDate] = @ExpectedDate WHERE [ServiceID] = @original_ServiceID AND [BoarID] = @original_BoarID AND [SowID] = @original_SowID AND [StaffID] = @original_StaffID AND [Date] = @original_Date AND (([LitterID] = @original_LitterID) OR ([LitterID] IS NULL AND @original_LitterID IS NULL)) AND [Successful] = @original_Successful AND (([ExpectedDate] = @original_ExpectedDate) OR ([ExpectedDate] IS NULL AND @original_ExpectedDate IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_ServiceID" Type="Int32" />
                <asp:Parameter Name="original_BoarID" Type="Int32" />
                <asp:Parameter Name="original_SowID" Type="Int32" />
                <asp:Parameter Name="original_StaffID" Type="Int32" />
                <asp:Parameter DbType="Date" Name="original_Date" />
                <asp:Parameter Name="original_LitterID" Type="Int32" />
                <asp:Parameter Name="original_Successful" Type="Boolean" />
                <asp:Parameter DbType="Date" Name="original_ExpectedDate" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="ddlBoar" Name="BoarID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlSow" Name="SowID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter Name="StaffID" Type="Int32" />
                <asp:ControlParameter ControlID="Calendar1" DbType="Date" Name="Date" PropertyName="SelectedDate" />
                <asp:Parameter Name="LitterID" Type="Int32" />
                <asp:Parameter Name="Successful" Type="Boolean" />
                <asp:Parameter DbType="Date" Name="ExpectedDate" />
            </InsertParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="ddlBoar" Name="BoarID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlSow" Name="SowID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter Name="StaffID" Type="Int32" />
                <asp:ControlParameter ControlID="Calendar1" DbType="Date" Name="Date" PropertyName="SelectedDate" />
                <asp:Parameter Name="LitterID" Type="Int32" />
                <asp:ControlParameter ControlID="cbSuccess" Name="Successful" PropertyName="Checked" Type="Boolean" />
                <asp:Parameter Name="ExpectedDate" DbType="Date" />
                <asp:Parameter Name="original_ServiceID" Type="Int32" />
                <asp:Parameter Name="original_BoarID" Type="Int32" />
                <asp:Parameter Name="original_SowID" Type="Int32" />
                <asp:Parameter Name="original_StaffID" Type="Int32" />
                <asp:Parameter DbType="Date" Name="original_Date" />
                <asp:Parameter Name="original_LitterID" Type="Int32" />
                <asp:Parameter Name="original_Successful" Type="Boolean" />
                <asp:Parameter DbType="Date" Name="original_ExpectedDate" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>

    </asp:Content>
