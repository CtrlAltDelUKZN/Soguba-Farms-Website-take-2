﻿<%@ Page Title="Servicing" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Servicing.aspx.cs" Inherits="Soguba_Farms_Website_take_2.Servicing" %>

<script runat="server">

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try
        {
            SqlServicingData.Insert();
            lblError.Text = "Successful Insert";
        }
        catch (Exception)
        {

            lblError.Text = "Insert Error. Check you entered all the info correctly";
        }

        try
        {
            SqlNotifications.Insert();
        }
        catch (Exception)
        {

        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (cbSuccess.Checked)
        {
            try
            {
                SQLCreateLitter.Insert();
                SqlFarrowNotification.Insert();
                lblError.Text = "Successful Edit";
            }
            catch (Exception)
            {

            lblError.Text = "Update Error. Check you entered all the info correctly";
            }
        }
        SqlServicingData.Update();
    }

    protected void cbSuccess_CheckedChanged(object sender, EventArgs e)
    {

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblServiceID.Text = GridView1.SelectedRow.Cells[1].Text;
        Calendar2.SelectedDate = Calendar1.SelectedDate.AddDays(114);
    }

    protected void SqlGetLitID_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
</script>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <br />
    <h2><%: Title %>.</h2>

    <body>

        <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ServiceID" DataSourceID="SqlServicingData" ForeColor="#333333" GridLines="None" Width="734px" AllowPaging="True" AllowSorting="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
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
        <asp:SqlDataSource ID="SqlServicingData" runat="server" ConnectionString="<%$ ConnectionStrings:group25ConnectionString %>" DeleteCommand="DELETE FROM [Servicing] WHERE [ServiceID] = @original_ServiceID AND [BoarID] = @original_BoarID AND [SowID] = @original_SowID AND [StaffID] = @original_StaffID AND [Date] = @original_Date AND (([LitterID] = @original_LitterID) OR ([LitterID] IS NULL AND @original_LitterID IS NULL)) AND [Successful] = @original_Successful AND (([ExpectedDate] = @original_ExpectedDate) OR ([ExpectedDate] IS NULL AND @original_ExpectedDate IS NULL))" InsertCommand="INSERT INTO [Servicing] ([BoarID], [SowID], [StaffID], [Date], [Successful]) VALUES (@BoarID, @SowID, @StaffID, @Date, @Successful)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Servicing]" UpdateCommand="UPDATE Servicing SET BoarID = @BoarID, SowID = @SowID, StaffID = @StaffID, Date = @Date, LitterID = @LitterID, Successful = @Successful, ExpectedDate = @ExpectedDate WHERE (ServiceID = @original_ServiceID)">
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
                <asp:ControlParameter ControlID="ddlStaff" Name="StaffID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="Calendar1" DbType="Date" Name="Date" PropertyName="SelectedDate" />
                <asp:ControlParameter ControlID="cbSuccess" Name="Successful" PropertyName="Checked" Type="Boolean" />
            </InsertParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="ddlBoar" Name="BoarID" PropertyName="SelectedValue" Type="Int32" DefaultValue="" />
                <asp:ControlParameter ControlID="ddlSow" Name="SowID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlStaff" Name="StaffID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="Calendar1" DbType="Date" Name="Date" PropertyName="SelectedDate" DefaultValue="" />
                <asp:ControlParameter ControlID="ddlLitID" DefaultValue="0" Name="LitterID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="cbSuccess" DefaultValue="" Name="Successful" PropertyName="Checked" Type="Boolean" />
                <asp:ControlParameter ControlID="Calendar2" DbType="Date" Name="ExpectedDate" PropertyName="SelectedDate" DefaultValue="" />
                <asp:ControlParameter ControlID="lblServiceID" Name="original_ServiceID" PropertyName="Text" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>

        <br />
         <div>
        <asp:Label ID="lblServiceID" runat="server" Text="0"></asp:Label>
        <asp:Button ID="btnAdd" runat="server" Text="Insert" OnClick="btnAdd_Click" />
        <asp:Button ID="btnEdit" runat="server" Text="Update" OnClick="btnUpdate_Click"/>
        <br />
        <br />
        <asp:Label ID="lblSearch" runat="server" Text="Search"></asp:Label>
         &nbsp &nbsp &nbsp
        <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
        <asp:Label ID="lblError" runat="server"></asp:Label>
    </div>

    <div style ="width: 25%; float: left; ">
        <asp:Label ID="lblSowID" runat="server" Text="Sow ID"></asp:Label>
        &nbsp &nbsp &nbsp
        <asp:DropDownList ID="ddlSow" runat="server" DataSourceID="SqlSowID" DataTextField="PigID" DataValueField="PigID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlSowID" runat="server" ConnectionString="<%$ ConnectionStrings:group25ConnectionString %>" SelectCommand="SELECT [PigID] FROM [Pig] WHERE ([Sex] = @Sex)">
            <SelectParameters>
                <asp:Parameter DefaultValue="F" Name="Sex" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Label ID="lblPigID" runat="server" Text="Boar ID"></asp:Label>
        &nbsp &nbsp &nbsp
        <asp:DropDownList ID="ddlBoar" runat="server" DataSourceID="SqlBoar" DataTextField="PigID" DataValueField="PigID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlBoar" runat="server" ConnectionString="<%$ ConnectionStrings:group25ConnectionString %>" SelectCommand="SELECT [PigID] FROM [Pig] WHERE ([Sex] = @Sex)">
            <SelectParameters>
                <asp:Parameter DefaultValue="M" Name="Sex" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Label ID="lblStaffID" runat="server" Text="Staff ID"></asp:Label>
        &nbsp &nbsp &nbsp
        <asp:DropDownList ID="ddlStaff" runat="server" DataSourceID="SqlStaffID" DataTextField="StaffID" DataValueField="StaffID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlStaffID" runat="server" ConnectionString="<%$ ConnectionStrings:group25ConnectionString %>" SelectCommand="SELECT [StaffID] FROM [Employees]"></asp:SqlDataSource>
        <br />
        <asp:CheckBox ID="cbSuccess" runat="server" Text="Success" OnCheckedChanged="cbSuccess_CheckedChanged" AutoPostBack="True" />
        <br />
    </div>
            
   

    <div style ="width: 25%; float: left; ">

        <asp:SqlDataSource ID="SQLCreateLitter" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:group25ConnectionString %>" DeleteCommand="DELETE FROM [Litter] WHERE [LitterID] = @original_LitterID AND (([FarrowID] = @original_FarrowID) OR ([FarrowID] IS NULL AND @original_FarrowID IS NULL)) AND (([ServiceID] = @original_ServiceID) OR ([ServiceID] IS NULL AND @original_ServiceID IS NULL)) AND [CurrentAvgWeight] = @original_CurrentAvgWeight AND [NumberOfPiglets] = @original_NumberOfPiglets" InsertCommand="INSERT INTO [Litter] ([FarrowID], [ServiceID], [CurrentAvgWeight], [NumberOfPiglets]) VALUES (@FarrowID, @ServiceID, @CurrentAvgWeight, @NumberOfPiglets)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Litter]" UpdateCommand="UPDATE [Litter] SET [FarrowID] = @FarrowID, [ServiceID] = @ServiceID, [CurrentAvgWeight] = @CurrentAvgWeight, [NumberOfPiglets] = @NumberOfPiglets WHERE [LitterID] = @original_LitterID AND (([FarrowID] = @original_FarrowID) OR ([FarrowID] IS NULL AND @original_FarrowID IS NULL)) AND (([ServiceID] = @original_ServiceID) OR ([ServiceID] IS NULL AND @original_ServiceID IS NULL)) AND [CurrentAvgWeight] = @original_CurrentAvgWeight AND [NumberOfPiglets] = @original_NumberOfPiglets">
            <DeleteParameters>
                <asp:Parameter Name="original_LitterID" Type="Int32" />
                <asp:Parameter Name="original_FarrowID" Type="Int32" />
                <asp:Parameter Name="original_ServiceID" Type="Int32" />
                <asp:Parameter Name="original_CurrentAvgWeight" Type="Double" />
                <asp:Parameter Name="original_NumberOfPiglets" Type="Int16" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="FarrowID" Type="Int32" />
                <asp:ControlParameter ControlID="lblServiceID" Name="ServiceID" PropertyName="Text" Type="Int32" />
                <asp:Parameter DefaultValue="0" Name="CurrentAvgWeight" Type="Double" />
                <asp:Parameter DefaultValue="0" Name="NumberOfPiglets" Type="Int16" />
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

        <asp:SqlDataSource ID="SqlNotifications" runat="server" ConnectionString="<%$ ConnectionStrings:group25ConnectionString %>" DeleteCommand="DELETE FROM [Notifications] WHERE [NoteID] = @NoteID" InsertCommand="INSERT INTO [Notifications] ([Date], [Description], [StaffID], [PigID], [TaskComplete]) VALUES (@Date, @Description, @StaffID, @PigID, @TaskComplete)" SelectCommand="SELECT * FROM [Notifications]" UpdateCommand="UPDATE [Notifications] SET [Date] = @Date, [Description] = @Description, [StaffID] = @StaffID, [PigID] = @PigID, [TaskComplete] = @TaskComplete WHERE [NoteID] = @NoteID">
            <DeleteParameters>
                <asp:Parameter Name="NoteID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="Calendar1" DbType="Date" Name="Date" PropertyName="SelectedDate" />
                <asp:Parameter DefaultValue="Servicing" Name="Description" Type="String" />
                <asp:ControlParameter ControlID="ddlStaff" DefaultValue="" Name="StaffID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlSow" Name="PigID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="cbSuccess" DefaultValue="" Name="TaskComplete" PropertyName="Checked" Type="Boolean" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter DbType="Date" Name="Date" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="StaffID" Type="Int32" />
                <asp:Parameter Name="PigID" Type="Int32" />
                <asp:Parameter Name="TaskComplete" Type="Boolean" />
                <asp:Parameter Name="NoteID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlFarrowNotification" runat="server" ConnectionString="<%$ ConnectionStrings:group25ConnectionString %>" DeleteCommand="DELETE FROM [Notifications] WHERE [NoteID] = @NoteID" InsertCommand="INSERT INTO [Notifications] ([Date], [Description], [StaffID], [PigID], [TaskComplete]) VALUES (@Date, @Description, @StaffID, @PigID, @TaskComplete)" SelectCommand="SELECT * FROM [Notifications]" UpdateCommand="UPDATE [Notifications] SET [Date] = @Date, [Description] = @Description, [StaffID] = @StaffID, [PigID] = @PigID, [TaskComplete] = @TaskComplete WHERE [NoteID] = @NoteID">
            <DeleteParameters>
                <asp:Parameter Name="NoteID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="Calendar2" DbType="Date" Name="Date" PropertyName="SelectedDate" />
                <asp:Parameter DefaultValue="Farrowing" Name="Description" Type="String" />
                <asp:ControlParameter ControlID="ddlStaff" DefaultValue="" Name="StaffID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlSow" Name="PigID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="cbSuccess" DefaultValue="0" Name="TaskComplete" PropertyName="Checked" Type="Boolean" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter DbType="Date" Name="Date" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="StaffID" Type="Int32" />
                <asp:Parameter Name="PigID" Type="Int32" />
                <asp:Parameter Name="TaskComplete" Type="Boolean" />
                <asp:Parameter Name="NoteID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlGetLitID" runat="server" ConnectionString="<%$ ConnectionStrings:group25ConnectionString %>" SelectCommand="SELECT [LitterID] FROM [Litter] WHERE ([ServiceID] = @ServiceID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="lblServiceID" Name="ServiceID" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:DropDownList ID="ddlLitID" runat="server" DataSourceID="SqlGetLitID" AutoPostBack="True" DataTextField="LitterID" Visible="False">
        </asp:DropDownList>

        <asp:Calendar ID="Calendar2" runat="server" Visible="False"></asp:Calendar>

    </div>
        <br />
         <div style ="width: 35%; float: none; ">
        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" CellSpacing="1" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="160px" NextPrevFormat="ShortMonth" Width="330px" SelectedDate="2021-11-18">
            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" Height="8pt" />
            <DayStyle BackColor="#CCCCCC" />
            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
            <OtherMonthDayStyle ForeColor="#999999" />
            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
            <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" Font-Size="12pt" ForeColor="White" Height="12pt" />
            <TodayDayStyle BackColor="#999999" ForeColor="White" />
        </asp:Calendar>
    </div>

    </body>
  
   

    

    </asp:Content>
