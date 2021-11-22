<%@ Page Title="Notifications" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Notifications.aspx.cs" Inherits="Soguba_Farms_Website_take_2.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>




        <h1 style="height: 41px">Daily Notifications:</h1>




    <body>

    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="Black" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="250px" NextPrevFormat="ShortMonth" Width="628px" BorderStyle="Solid" CellSpacing="1" SelectedDate="11/18/2021 09:57:30">
        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" Height="8pt" />
        <DayStyle BackColor="#CCCCCC" />
        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
        <OtherMonthDayStyle ForeColor="#999999" />
        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
        <TitleStyle BackColor="#333399" Font-Bold="True" Font-Size="12pt" ForeColor="White" BorderStyle="Solid" Height="12pt" />
        <TodayDayStyle BackColor="#999999" ForeColor="White" />
    </asp:Calendar>
    <div style="height: 40px">
    </div>



    </body>

    <div> &nbsp </div>
    <asp:GridView ID = "gridNotifications" runat = "server" AutoGenerateColumns="False" DataKeyNames="NoteID" DataSourceID="SqlNotifications" CellPadding="4" ForeColor="#333333" GridLines="None" Width="628px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="NoteID" HeaderText="NoteID" InsertVisible="False" ReadOnly="True" SortExpression="NoteID" />
            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:BoundField DataField="StaffID" HeaderText="StaffID" SortExpression="StaffID" />
            <asp:BoundField DataField="PigID" HeaderText="PigID" SortExpression="PigID" />
            <asp:CheckBoxField DataField="TaskComplete" HeaderText="TaskComplete" SortExpression="TaskComplete" />
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
  
    <asp:SqlDataSource ID="SqlNotifications" runat="server" ConnectionString="<%$ ConnectionStrings:group25ConnectionString %>" SelectCommand="SELECT * FROM [Notifications]"></asp:SqlDataSource>
  
    
   
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlNotificationDetails" ForeColor="#333333" GridLines="None" Width="629px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:BoundField DataField="StaffID" HeaderText="StaffID" SortExpression="StaffID" />
            <asp:BoundField DataField="PigID" HeaderText="PigID" SortExpression="PigID" />
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
    <asp:SqlDataSource ID="SqlNotificationDetails" runat="server" ConnectionString="<%$ ConnectionStrings:group25ConnectionString %>" SelectCommand="SELECT [Description], [StaffID], [PigID] FROM [Notifications] WHERE ([Date] = @Date)">
        <SelectParameters>
            <asp:ControlParameter ControlID="Calendar1" DbType="Date" Name="Date" PropertyName="SelectedDate" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlNotificationData" runat="server" ConnectionString="<%$ ConnectionStrings:group25ConnectionString %>" SelectCommand="SELECT * FROM [Notifications] WHERE ([Date] = @Date)">
        <SelectParameters>
            <asp:ControlParameter ControlID="Calendar1" DbType="Date" Name="Date" PropertyName="SelectedDate" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
