﻿<%@ Page Title="Weaning" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind=".aspx.cs" Inherits="Soguba_Farms_Website_take_2.Weaning" %>

<script runat="server">

    protected void btnInsert_Click(object sender, EventArgs e)
    {
        try
        {
            SqlWeaning.Insert();
            lblError.Text = "Successful Insert";
        }
        catch (Exception)
        {

            lblError.Text = "Insert Error. Check you entered all the info correctly";
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            SqlWeaning.Update();
            lblError.Text = "Successful Edit";
        }
        catch (Exception)
        {

            lblError.Text = "Update Error. Check you entered all the info correctly";
        }
    }

    protected void ddlLit_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtNum.Text = GridView2.Rows[0].Cells[2].Text.ToString();
        txtAvgWeight.Text = GridView2.Rows[0].Cells[1].Text.ToString();
    }
</script>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <br />
    <h2><%: Title %>.</h2>



    <body>


        
    <div style="width: 45%; float: none; ">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="WeaningID" DataSourceID="SqlWeaning" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True" Width="745px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="WeaningID" HeaderText="WeaningID" InsertVisible="False" ReadOnly="True" SortExpression="WeaningID" />
                <asp:BoundField DataField="LitterID" HeaderText="LitterID" SortExpression="LitterID" />
                <asp:BoundField DataField="SowID" HeaderText="SowID" SortExpression="SowID" />
                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                <asp:BoundField DataField="NumberWeaned" HeaderText="NumberWeaned" SortExpression="NumberWeaned" />
                <asp:BoundField DataField="AverageWeight" HeaderText="AverageWeight" SortExpression="AverageWeight" />
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
        <asp:SqlDataSource ID="SqlWeaning" runat="server" ConnectionString="<%$ ConnectionStrings:group25ConnectionString %>" DeleteCommand="DELETE FROM [Weaning] WHERE [WeaningID] = @original_WeaningID AND (([LitterID] = @original_LitterID) OR ([LitterID] IS NULL AND @original_LitterID IS NULL)) AND (([SowID] = @original_SowID) OR ([SowID] IS NULL AND @original_SowID IS NULL)) AND [NumberWeaned] = @original_NumberWeaned AND [Date] = @original_Date AND [AverageWeight] = @original_AverageWeight" InsertCommand="INSERT INTO [Weaning] ([LitterID], [SowID], [NumberWeaned], [Date], [AverageWeight]) VALUES (@LitterID, @SowID, @NumberWeaned, @Date, @AverageWeight)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Weaning]" UpdateCommand="UPDATE [Weaning] SET [LitterID] = @LitterID, [SowID] = @SowID, [NumberWeaned] = @NumberWeaned, [Date] = @Date, [AverageWeight] = @AverageWeight WHERE [WeaningID] = @original_WeaningID">
            <DeleteParameters>
                <asp:Parameter Name="original_WeaningID" Type="Int32" />
                <asp:Parameter Name="original_LitterID" Type="Int32" />
                <asp:Parameter Name="original_SowID" Type="Int32" />
                <asp:Parameter Name="original_NumberWeaned" Type="Int16" />
                <asp:Parameter DbType="Date" Name="original_Date" />
                <asp:Parameter Name="original_AverageWeight" Type="Double" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="ddlLit" Name="LitterID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlSow" Name="SowID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="txtNum" Name="NumberWeaned" PropertyName="Text" Type="Int16" />
                <asp:ControlParameter ControlID="Calendar1" DbType="Date" Name="Date" PropertyName="SelectedDate" />
                <asp:ControlParameter ControlID="txtAvgWeight" Name="AverageWeight" PropertyName="Text" Type="Double" />
            </InsertParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="ddlLit" Name="LitterID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlSow" Name="SowID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="txtNum" Name="NumberWeaned" PropertyName="Text" Type="Int16" />
                <asp:ControlParameter ControlID="Calendar1" DbType="Date" Name="Date" PropertyName="SelectedDate" />
                <asp:ControlParameter ControlID="txtAvgWeight" Name="AverageWeight" PropertyName="Text" Type="Double" />
                <asp:ControlParameter ControlID="GridView1" Name="original_WeaningID" PropertyName="SelectedValue" Type="Int32" />
                <asp:Parameter Name="original_LitterID" Type="Int32" />
                <asp:Parameter Name="original_SowID" Type="Int32" />
                <asp:Parameter Name="original_NumberWeaned" Type="Int16" />
                <asp:Parameter DbType="Date" Name="original_Date" />
                <asp:Parameter Name="original_AverageWeight" Type="Double" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
        <br />
        <div style ="width: 45%; float: left; ">
        <asp:Button ID="btnInsert" runat="server" Text="Insert" OnClick="btnInsert_Click" />
        <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
        <asp:Label ID="lblError" runat="server"></asp:Label>
            <br />
    </div>

    </body>
    

    <div style ="width: 45%; float: left; "></div>

    <div style ="width: 45%; float: left; height: 20px;">
         <asp:Label ID="lblLitterID" runat="server" Text="Litter ID"></asp:Label>
        &nbsp  &nbsp  &nbsp
        <asp:DropDownList ID="ddlLit" runat="server" DataSourceID="SqlLitID" DataTextField="LitterID" DataValueField="LitterID" OnSelectedIndexChanged="ddlLit_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
       <br />
        <asp:Label ID="lblSowID" runat="server" Text="Sow ID"></asp:Label>
        &nbsp  &nbsp  &nbsp
        <asp:DropDownList ID="ddlSow" runat="server" DataSourceID="SqlSowID" DataTextField="PigID" DataValueField="PigID" AutoPostBack="True"></asp:DropDownList>
        <br />
        <asp:Label ID="lblNum" runat="server" Text="Number Weaned"></asp:Label>
        &nbsp  &nbsp  &nbsp
        <asp:TextBox ID="txtNum" runat="server"></asp:TextBox>
        <br />
         <asp:Label ID="lblAvgWeight" runat="server" Text="Average Weight"></asp:Label>
        &nbsp  &nbsp  &nbsp
        <asp:TextBox ID="txtAvgWeight" runat="server"></asp:TextBox>
        <asp:SqlDataSource ID="SqlSowID" runat="server" ConnectionString="<%$ ConnectionStrings:group25ConnectionString %>" SelectCommand="SELECT [PigID] FROM [Pig] WHERE ([Sex] = @Sex)">
            <SelectParameters>
                <asp:Parameter DefaultValue="F" Name="Sex" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlLitID" runat="server" ConnectionString="<%$ ConnectionStrings:group25ConnectionString %>" SelectCommand="SELECT [LitterID], [CurrentAvgWeight], [NumberOfPiglets] FROM [Litter]"></asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlLitterInfo" runat="server" ConnectionString="<%$ ConnectionStrings:group25ConnectionString %>" SelectCommand="SELECT [LitterID], [CurrentAvgWeight], [NumberOfPiglets] FROM [Litter] WHERE ([LitterID] = @LitterID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlLit" Name="LitterID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <br />
    <div style ="width: 45%; float: none; ">
        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" CellSpacing="1" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="250px" NextPrevFormat="ShortMonth" Width="330px" SelectedDate="11/18/2021 09:56:23">
            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" Height="8pt" />
            <DayStyle BackColor="#CCCCCC" />
            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
            <OtherMonthDayStyle ForeColor="#999999" />
            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
            <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" Font-Size="12pt" ForeColor="White" Height="12pt" />
            <TodayDayStyle BackColor="#999999" ForeColor="White" />
        </asp:Calendar>
    </div>
    <br />

    <div style ="width: 45%; float: none"; >
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="LitterID" DataSourceID="SqlLitterInfo" Visible="False" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="LitterID" HeaderText="LitterID" InsertVisible="False" ReadOnly="True" SortExpression="LitterID" />
                <asp:BoundField DataField="CurrentAvgWeight" HeaderText="CurrentAvgWeight" SortExpression="CurrentAvgWeight" />
                <asp:BoundField DataField="NumberOfPiglets" HeaderText="NumberOfPiglets" SortExpression="NumberOfPiglets" />
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
    </div>

</asp:Content>

