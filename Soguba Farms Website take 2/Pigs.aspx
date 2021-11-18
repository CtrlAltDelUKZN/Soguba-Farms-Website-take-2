<%@ Page Title="Pigs" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Pigs.aspx.cs" Inherits="Soguba_Farms_Website_take_2.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>

    
    <div style ="width: 45%; float: left; ">

        <asp:Button ID="btnAdd" runat="server" BorderStyle="Outset" Text="Insert" OnClick="btnAdd_Click" />

        <asp:TextBox ID="txtSearch" runat="server" AutoPostBack="True"></asp:TextBox>

    </div>

    <div style ="width: 50%; float: left; ">

        <asp:Button ID="btnUpdate" runat="server" BorderStyle="Outset" Text="Edit" OnClick="btnUpdate_Click" />

    </div>

    <div style ="width: 45%; float: left; height: 202px;">

        <b>
            Pig Details
        </b>

        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="PigID" DataSourceID="SqlPigDetails" ForeColor="#333333" GridLines="None" Height="50px" Width="352px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
            <EditRowStyle BackColor="#999999" />
            <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="PigID" HeaderText="PigID" InsertVisible="False" ReadOnly="True" SortExpression="PigID" />
                <asp:BoundField DataField="SowNumFarrows" HeaderText="Number of Farrows" SortExpression="SowNumFarrows" />
                <asp:BoundField DataField="SowAvgNumPigsPerLit" HeaderText="Average Number of Piglets per Litter" SortExpression="SowAvgNumPigsPerLit" />
                <asp:BoundField DataField="SowNumMiscarriages" HeaderText="Number of Miscarriages" SortExpression="SowNumMiscarriages" />
                <asp:BoundField DataField="SowAvgLitterWeight" HeaderText="Average Litter Birth Weight" SortExpression="SowAvgLitterWeight" />
                <asp:CheckBoxField DataField="SowPregnant" HeaderText="Pig Pregnant" SortExpression="SowPregnant" />
                <asp:BoundField DataField="BoarNumServices" HeaderText="Number of Services" SortExpression="BoarNumServices" />
            </Fields>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlPigDetails" runat="server" ConnectionString="<%$ ConnectionStrings:group25ConnectionString %>" SelectCommand="SELECT [PigID], [SowAvgNumPigsPerLit], [SowAvgLitterWeight], [SowNumFarrows], [SowNumMiscarriages], [SowPregnant], [BoarNumServices] FROM [Pig] WHERE ([PigID] = @PigID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="Pigs" Name="PigID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:group25ConnectionString %>" DeleteCommand="DELETE FROM [Pig] WHERE [PigID] = @original_PigID AND [Sex] = @original_Sex AND [Breed] = @original_Breed AND [DateofBirth] = @original_DateofBirth AND (([Age] = @original_Age) OR ([Age] IS NULL AND @original_Age IS NULL)) AND [BirthWeight] = @original_BirthWeight AND [CurrentWeight] = @original_CurrentWeight AND [Accommodation] = @original_Accommodation AND (([SowAvgNumPigsPerLit] = @original_SowAvgNumPigsPerLit) OR ([SowAvgNumPigsPerLit] IS NULL AND @original_SowAvgNumPigsPerLit IS NULL)) AND (([SowAvgLitterWeight] = @original_SowAvgLitterWeight) OR ([SowAvgLitterWeight] IS NULL AND @original_SowAvgLitterWeight IS NULL)) AND (([SowNumFarrows] = @original_SowNumFarrows) OR ([SowNumFarrows] IS NULL AND @original_SowNumFarrows IS NULL)) AND (([SowNumMiscarriages] = @original_SowNumMiscarriages) OR ([SowNumMiscarriages] IS NULL AND @original_SowNumMiscarriages IS NULL)) AND (([SowPregnant] = @original_SowPregnant) OR ([SowPregnant] IS NULL AND @original_SowPregnant IS NULL)) AND (([BoarNumServices] = @original_BoarNumServices) OR ([BoarNumServices] IS NULL AND @original_BoarNumServices IS NULL)) AND (([LitterID] = @original_LitterID) OR ([LitterID] IS NULL AND @original_LitterID IS NULL)) AND (([CauseOfDeath] = @original_CauseOfDeath) OR ([CauseOfDeath] IS NULL AND @original_CauseOfDeath IS NULL))" InsertCommand="INSERT INTO [Pig] ([Sex], [Breed], [DateofBirth], [Age], [BirthWeight], [CurrentWeight], [Accommodation], [SowAvgNumPigsPerLit], [SowAvgLitterWeight], [SowNumFarrows], [SowNumMiscarriages], [SowPregnant], [BoarNumServices], [LitterID], [CauseOfDeath]) VALUES (@Sex, @Breed, @DateofBirth, @Age, @BirthWeight, @CurrentWeight, @Accommodation, @SowAvgNumPigsPerLit, @SowAvgLitterWeight, @SowNumFarrows, @SowNumMiscarriages, @SowPregnant, @BoarNumServices, @LitterID, @CauseOfDeath)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Pig]" UpdateCommand="UPDATE [Pig] SET [Sex] = @Sex, [Breed] = @Breed, [DateofBirth] = @DateofBirth, [Age] = @Age, [BirthWeight] = @BirthWeight, [CurrentWeight] = @CurrentWeight, [Accommodation] = @Accommodation, [SowAvgNumPigsPerLit] = @SowAvgNumPigsPerLit, [SowAvgLitterWeight] = @SowAvgLitterWeight, [SowNumFarrows] = @SowNumFarrows, [SowNumMiscarriages] = @SowNumMiscarriages, [SowPregnant] = @SowPregnant, [BoarNumServices] = @BoarNumServices, [LitterID] = @LitterID, [CauseOfDeath] = @CauseOfDeath WHERE [PigID] = @original_PigID AND [Sex] = @original_Sex AND [Breed] = @original_Breed AND [DateofBirth] = @original_DateofBirth AND (([Age] = @original_Age) OR ([Age] IS NULL AND @original_Age IS NULL)) AND [BirthWeight] = @original_BirthWeight AND [CurrentWeight] = @original_CurrentWeight AND [Accommodation] = @original_Accommodation AND (([SowAvgNumPigsPerLit] = @original_SowAvgNumPigsPerLit) OR ([SowAvgNumPigsPerLit] IS NULL AND @original_SowAvgNumPigsPerLit IS NULL)) AND (([SowAvgLitterWeight] = @original_SowAvgLitterWeight) OR ([SowAvgLitterWeight] IS NULL AND @original_SowAvgLitterWeight IS NULL)) AND (([SowNumFarrows] = @original_SowNumFarrows) OR ([SowNumFarrows] IS NULL AND @original_SowNumFarrows IS NULL)) AND (([SowNumMiscarriages] = @original_SowNumMiscarriages) OR ([SowNumMiscarriages] IS NULL AND @original_SowNumMiscarriages IS NULL)) AND (([SowPregnant] = @original_SowPregnant) OR ([SowPregnant] IS NULL AND @original_SowPregnant IS NULL)) AND (([BoarNumServices] = @original_BoarNumServices) OR ([BoarNumServices] IS NULL AND @original_BoarNumServices IS NULL)) AND (([LitterID] = @original_LitterID) OR ([LitterID] IS NULL AND @original_LitterID IS NULL)) AND (([CauseOfDeath] = @original_CauseOfDeath) OR ([CauseOfDeath] IS NULL AND @original_CauseOfDeath IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_PigID" Type="Int32" />
            <asp:Parameter Name="original_Sex" Type="String" />
            <asp:Parameter Name="original_Breed" Type="String" />
            <asp:Parameter DbType="Date" Name="original_DateofBirth" />
            <asp:Parameter Name="original_Age" Type="Int32" />
            <asp:Parameter Name="original_BirthWeight" Type="Double" />
            <asp:Parameter Name="original_CurrentWeight" Type="Double" />
            <asp:Parameter Name="original_Accommodation" Type="String" />
            <asp:Parameter Name="original_SowAvgNumPigsPerLit" Type="Double" />
            <asp:Parameter Name="original_SowAvgLitterWeight" Type="Double" />
            <asp:Parameter Name="original_SowNumFarrows" Type="Int32" />
            <asp:Parameter Name="original_SowNumMiscarriages" Type="Int32" />
            <asp:Parameter Name="original_SowPregnant" Type="Boolean" />
            <asp:Parameter Name="original_BoarNumServices" Type="Int32" />
            <asp:Parameter Name="original_LitterID" Type="Int32" />
            <asp:Parameter Name="original_CauseOfDeath" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="rbSex" Name="Sex" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlBreed" Name="Breed" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="Calendar1" DbType="Date" Name="DateofBirth" PropertyName="SelectedDate" />
            <asp:Parameter Name="Age" Type="Int32" />
            <asp:ControlParameter ControlID="txtBirthWeight" Name="BirthWeight" PropertyName="Text" Type="Double" />
            <asp:ControlParameter ControlID="txtCurrWeight" Name="CurrentWeight" PropertyName="Text" Type="Double" />
            <asp:ControlParameter ControlID="ddlAccomodation" Name="Accommodation" PropertyName="SelectedValue" Type="String" />
            <asp:Parameter Name="SowAvgNumPigsPerLit" Type="Double" />
            <asp:Parameter Name="SowAvgLitterWeight" Type="Double" />
            <asp:Parameter Name="SowNumFarrows" Type="Int32" />
            <asp:Parameter Name="SowNumMiscarriages" Type="Int32" />
            <asp:Parameter Name="SowPregnant" Type="Boolean" />
            <asp:Parameter Name="BoarNumServices" Type="Int32" />
            <asp:ControlParameter ControlID="ddlLitter" Name="LitterID" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="ddlStatus" Name="CauseOfDeath" PropertyName="SelectedValue" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="rbSex" Name="Sex" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlBreed" Name="Breed" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="Calendar1" DbType="Date" Name="DateofBirth" PropertyName="SelectedDate" />
            <asp:Parameter Name="Age" Type="Int32" />
            <asp:ControlParameter ControlID="txtBirthWeight" Name="BirthWeight" PropertyName="Text" Type="Double" />
            <asp:ControlParameter ControlID="txtCurrWeight" Name="CurrentWeight" PropertyName="Text" Type="Double" />
            <asp:ControlParameter ControlID="ddlAccomodation" Name="Accommodation" PropertyName="SelectedValue" Type="String" />
            <asp:Parameter Name="SowAvgNumPigsPerLit" Type="Double" />
            <asp:Parameter Name="SowAvgLitterWeight" Type="Double" />
            <asp:Parameter Name="SowNumFarrows" Type="Int32" />
            <asp:Parameter Name="SowNumMiscarriages" Type="Int32" />
            <asp:Parameter Name="SowPregnant" Type="Boolean" />
            <asp:Parameter Name="BoarNumServices" Type="Int32" />
            <asp:ControlParameter ControlID="ddlLitter" Name="LitterID" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="ddlStatus" Name="CauseOfDeath" PropertyName="SelectedValue" Type="String" />
            <asp:Parameter Name="original_PigID" Type="Int32" />
            <asp:Parameter Name="original_Sex" Type="String" />
            <asp:Parameter Name="original_Breed" Type="String" />
            <asp:Parameter DbType="Date" Name="original_DateofBirth" />
            <asp:Parameter Name="original_Age" Type="Int32" />
            <asp:Parameter Name="original_BirthWeight" Type="Double" />
            <asp:Parameter Name="original_CurrentWeight" Type="Double" />
            <asp:Parameter Name="original_Accommodation" Type="String" />
            <asp:Parameter Name="original_SowAvgNumPigsPerLit" Type="Double" />
            <asp:Parameter Name="original_SowAvgLitterWeight" Type="Double" />
            <asp:Parameter Name="original_SowNumFarrows" Type="Int32" />
            <asp:Parameter Name="original_SowNumMiscarriages" Type="Int32" />
            <asp:Parameter Name="original_SowPregnant" Type="Boolean" />
            <asp:Parameter Name="original_BoarNumServices" Type="Int32" />
            <asp:Parameter Name="original_LitterID" Type="Int32" />
            <asp:Parameter Name="original_CauseOfDeath" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

 
        <asp:SqlDataSource ID="SqlPigData" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:group25ConnectionString %>" DeleteCommand="DELETE FROM [Pig] WHERE [PigID] = @original_PigID AND [Sex] = @original_Sex AND [Breed] = @original_Breed AND [DateofBirth] = @original_DateofBirth AND (([Age] = @original_Age) OR ([Age] IS NULL AND @original_Age IS NULL)) AND [BirthWeight] = @original_BirthWeight AND [CurrentWeight] = @original_CurrentWeight AND [Accommodation] = @original_Accommodation AND (([SowAvgNumPigsPerLit] = @original_SowAvgNumPigsPerLit) OR ([SowAvgNumPigsPerLit] IS NULL AND @original_SowAvgNumPigsPerLit IS NULL)) AND (([SowAvgLitterWeight] = @original_SowAvgLitterWeight) OR ([SowAvgLitterWeight] IS NULL AND @original_SowAvgLitterWeight IS NULL)) AND (([SowNumFarrows] = @original_SowNumFarrows) OR ([SowNumFarrows] IS NULL AND @original_SowNumFarrows IS NULL)) AND (([SowNumMiscarriages] = @original_SowNumMiscarriages) OR ([SowNumMiscarriages] IS NULL AND @original_SowNumMiscarriages IS NULL)) AND (([SowPregnant] = @original_SowPregnant) OR ([SowPregnant] IS NULL AND @original_SowPregnant IS NULL)) AND (([BoarNumServices] = @original_BoarNumServices) OR ([BoarNumServices] IS NULL AND @original_BoarNumServices IS NULL)) AND (([LitterID] = @original_LitterID) OR ([LitterID] IS NULL AND @original_LitterID IS NULL)) AND (([CauseOfDeath] = @original_CauseOfDeath) OR ([CauseOfDeath] IS NULL AND @original_CauseOfDeath IS NULL))" InsertCommand="INSERT INTO [Pig] ([Sex], [Breed], [DateofBirth], [Age], [BirthWeight], [CurrentWeight], [Accommodation], [SowAvgNumPigsPerLit], [SowAvgLitterWeight], [SowNumFarrows], [SowNumMiscarriages], [SowPregnant], [BoarNumServices], [LitterID], [CauseOfDeath]) VALUES (@Sex, @Breed, @DateofBirth, @Age, @BirthWeight, @CurrentWeight, @Accommodation, @SowAvgNumPigsPerLit, @SowAvgLitterWeight, @SowNumFarrows, @SowNumMiscarriages, @SowPregnant, @BoarNumServices, @LitterID, @CauseOfDeath)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Pig] WHERE ([PigID] = @PigID)" UpdateCommand="UPDATE [Pig] SET [Sex] = @Sex, [Breed] = @Breed, [DateofBirth] = @DateofBirth, [Age] = @Age, [BirthWeight] = @BirthWeight, [CurrentWeight] = @CurrentWeight, [Accommodation] = @Accommodation, [SowAvgNumPigsPerLit] = @SowAvgNumPigsPerLit, [SowAvgLitterWeight] = @SowAvgLitterWeight, [SowNumFarrows] = @SowNumFarrows, [SowNumMiscarriages] = @SowNumMiscarriages, [SowPregnant] = @SowPregnant, [BoarNumServices] = @BoarNumServices, [LitterID] = @LitterID, [CauseOfDeath] = @CauseOfDeath WHERE [PigID] = @original_PigID AND [Sex] = @original_Sex AND [Breed] = @original_Breed AND [DateofBirth] = @original_DateofBirth AND (([Age] = @original_Age) OR ([Age] IS NULL AND @original_Age IS NULL)) AND [BirthWeight] = @original_BirthWeight AND [CurrentWeight] = @original_CurrentWeight AND [Accommodation] = @original_Accommodation AND (([SowAvgNumPigsPerLit] = @original_SowAvgNumPigsPerLit) OR ([SowAvgNumPigsPerLit] IS NULL AND @original_SowAvgNumPigsPerLit IS NULL)) AND (([SowAvgLitterWeight] = @original_SowAvgLitterWeight) OR ([SowAvgLitterWeight] IS NULL AND @original_SowAvgLitterWeight IS NULL)) AND (([SowNumFarrows] = @original_SowNumFarrows) OR ([SowNumFarrows] IS NULL AND @original_SowNumFarrows IS NULL)) AND (([SowNumMiscarriages] = @original_SowNumMiscarriages) OR ([SowNumMiscarriages] IS NULL AND @original_SowNumMiscarriages IS NULL)) AND (([SowPregnant] = @original_SowPregnant) OR ([SowPregnant] IS NULL AND @original_SowPregnant IS NULL)) AND (([BoarNumServices] = @original_BoarNumServices) OR ([BoarNumServices] IS NULL AND @original_BoarNumServices IS NULL)) AND (([LitterID] = @original_LitterID) OR ([LitterID] IS NULL AND @original_LitterID IS NULL)) AND (([CauseOfDeath] = @original_CauseOfDeath) OR ([CauseOfDeath] IS NULL AND @original_CauseOfDeath IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_PigID" Type="Int32" />
                <asp:Parameter Name="original_Sex" Type="String" />
                <asp:Parameter Name="original_Breed" Type="String" />
                <asp:Parameter DbType="Date" Name="original_DateofBirth" />
                <asp:Parameter Name="original_Age" Type="Int32" />
                <asp:Parameter Name="original_BirthWeight" Type="Double" />
                <asp:Parameter Name="original_CurrentWeight" Type="Double" />
                <asp:Parameter Name="original_Accommodation" Type="String" />
                <asp:Parameter Name="original_SowAvgNumPigsPerLit" Type="Double" />
                <asp:Parameter Name="original_SowAvgLitterWeight" Type="Double" />
                <asp:Parameter Name="original_SowNumFarrows" Type="Int32" />
                <asp:Parameter Name="original_SowNumMiscarriages" Type="Int32" />
                <asp:Parameter Name="original_SowPregnant" Type="Boolean" />
                <asp:Parameter Name="original_BoarNumServices" Type="Int32" />
                <asp:Parameter Name="original_LitterID" Type="Int32" />
                <asp:Parameter Name="original_CauseOfDeath" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Sex" Type="String" />
                <asp:Parameter Name="Breed" Type="String" />
                <asp:Parameter DbType="Date" Name="DateofBirth" />
                <asp:Parameter Name="Age" Type="Int32" />
                <asp:Parameter Name="BirthWeight" Type="Double" />
                <asp:Parameter Name="CurrentWeight" Type="Double" />
                <asp:Parameter Name="Accommodation" Type="String" />
                <asp:Parameter Name="SowAvgNumPigsPerLit" Type="Double" />
                <asp:Parameter Name="SowAvgLitterWeight" Type="Double" />
                <asp:Parameter Name="SowNumFarrows" Type="Int32" />
                <asp:Parameter Name="SowNumMiscarriages" Type="Int32" />
                <asp:Parameter Name="SowPregnant" Type="Boolean" />
                <asp:Parameter Name="BoarNumServices" Type="Int32" />
                <asp:Parameter Name="LitterID" Type="Int32" />
                <asp:Parameter Name="CauseOfDeath" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="txtSearch" Name="PigID" PropertyName="Text" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Sex" Type="String" />
                <asp:Parameter Name="Breed" Type="String" />
                <asp:Parameter DbType="Date" Name="DateofBirth" />
                <asp:Parameter Name="Age" Type="Int32" />
                <asp:Parameter Name="BirthWeight" Type="Double" />
                <asp:Parameter Name="CurrentWeight" Type="Double" />
                <asp:Parameter Name="Accommodation" Type="String" />
                <asp:Parameter Name="SowAvgNumPigsPerLit" Type="Double" />
                <asp:Parameter Name="SowAvgLitterWeight" Type="Double" />
                <asp:Parameter Name="SowNumFarrows" Type="Int32" />
                <asp:Parameter Name="SowNumMiscarriages" Type="Int32" />
                <asp:Parameter Name="SowPregnant" Type="Boolean" />
                <asp:Parameter Name="BoarNumServices" Type="Int32" />
                <asp:Parameter Name="LitterID" Type="Int32" />
                <asp:Parameter Name="CauseOfDeath" Type="String" />
                <asp:Parameter Name="original_PigID" Type="Int32" />
                <asp:Parameter Name="original_Sex" Type="String" />
                <asp:Parameter Name="original_Breed" Type="String" />
                <asp:Parameter DbType="Date" Name="original_DateofBirth" />
                <asp:Parameter Name="original_Age" Type="Int32" />
                <asp:Parameter Name="original_BirthWeight" Type="Double" />
                <asp:Parameter Name="original_CurrentWeight" Type="Double" />
                <asp:Parameter Name="original_Accommodation" Type="String" />
                <asp:Parameter Name="original_SowAvgNumPigsPerLit" Type="Double" />
                <asp:Parameter Name="original_SowAvgLitterWeight" Type="Double" />
                <asp:Parameter Name="original_SowNumFarrows" Type="Int32" />
                <asp:Parameter Name="original_SowNumMiscarriages" Type="Int32" />
                <asp:Parameter Name="original_SowPregnant" Type="Boolean" />
                <asp:Parameter Name="original_BoarNumServices" Type="Int32" />
                <asp:Parameter Name="original_LitterID" Type="Int32" />
                <asp:Parameter Name="original_CauseOfDeath" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>

 
    </div>

    <div style ="width: 10%; float: left; height: 198px;">

        <asp:RadioButtonList ID="rbSex" runat="server">
            <asp:ListItem Selected="True" Value="F">Female</asp:ListItem>
            <asp:ListItem Value="M">Male</asp:ListItem>
        </asp:RadioButtonList>
        <asp:DropDownList ID="ddlBreed" runat="server">
            <asp:ListItem>B35</asp:ListItem>
            <asp:ListItem>D25</asp:ListItem>
            <asp:ListItem>A6</asp:ListItem>
        </asp:DropDownList>
        <asp:TextBox ID="txtBirthWeight" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtCurrWeight" runat="server"></asp:TextBox>
        <asp:DropDownList ID="ddlAccomodation" runat="server">
            <asp:ListItem>Birthing House</asp:ListItem>
            <asp:ListItem>Breeding Shelter</asp:ListItem>
        </asp:DropDownList>
        <asp:DropDownList ID="ddlLitter" runat="server" DataSourceID="SqlDDLLitterID" DataTextField="LitterID" DataValueField="LitterID">
        </asp:DropDownList>
        <asp:DropDownList ID="ddlStatus" runat="server">
            <asp:ListItem>Alive</asp:ListItem>
            <asp:ListItem>Sold</asp:ListItem>
            <asp:ListItem>Dead</asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDDLLitterID" runat="server" ConnectionString="<%$ ConnectionStrings:group25ConnectionString %>" SelectCommand="SELECT [LitterID] FROM [Litter]"></asp:SqlDataSource>

    </div>

    <div style ="width: 40%; float: right; height: 192px;">

        <asp:Label ID="lblDate" runat="server" Text="Date"></asp:Label>
        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" CellSpacing="1" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="149px" NextPrevFormat="ShortMonth" Width="413px">
            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" Height="8pt" />
            <DayStyle BackColor="#CCCCCC" />
            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
            <OtherMonthDayStyle ForeColor="#999999" />
            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
            <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" Font-Size="12pt" ForeColor="White" Height="12pt" />
            <TodayDayStyle BackColor="#999999" ForeColor="White" />
        </asp:Calendar>

    </div>

 
    <asp:GridView ID = "Pigs" runat = "server" AutoGenerateColumns="False" DataKeyNames="PigID" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1263px" OnSelectedIndexChanged="Pigs_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="PigID" HeaderText="PigID" InsertVisible="False" ReadOnly="True" SortExpression="PigID" />
            <asp:BoundField DataField="Sex" HeaderText="Sex" SortExpression="Sex" />
            <asp:BoundField DataField="Breed" HeaderText="Breed" SortExpression="Breed" />
            <asp:BoundField DataField="DateofBirth" HeaderText="DateofBirth" SortExpression="DateofBirth" />
            <asp:BoundField DataField="Age" HeaderText="Age" SortExpression="Age" />
            <asp:BoundField DataField="BirthWeight" HeaderText="BirthWeight" SortExpression="BirthWeight" />
            <asp:BoundField DataField="CurrentWeight" HeaderText="CurrentWeight" SortExpression="CurrentWeight" />
            <asp:BoundField DataField="Accommodation" HeaderText="Accommodation" SortExpression="Accommodation" />
            <asp:BoundField DataField="LitterID" HeaderText="LitterID" SortExpression="LitterID" />
            <asp:BoundField DataField="CauseOfDeath" HeaderText="Status" SortExpression="CauseOfDeath" />
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

    </asp:Content>
