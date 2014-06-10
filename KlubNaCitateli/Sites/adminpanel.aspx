﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="adminpanel.aspx.cs" Inherits="KlubNaCitateli.Sites.adminpanel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/adminPanel.css" rel="stylesheet" type="text/css" />
    <script src="<%= Page.ResolveClientUrl("../Scripts/AdminPanel.js") %>" type="text/javascript">
    </script>
    <script type="text/javascript">
        $(document).ready(function () {

            function onSuccess(result) {
                alert(result);
            }

            $("#add").click(function () {

                var bookField = $("#<%=bookField.ClientID %>").val();
                var bookIdsField = $("#<%=bookIdsField.ClientID %>").val();

                var tags = $("#<%=tbTags.ClientID %>").val();
                var categories = "";
                var regex = "^[a-zA-Z]+(?:,[a-zA-Z]+)*$";

                $("#<%=cblCategories.ClientID %> input[type=checkbox]:checked").each(function () {
                    var currentValue = $(this).parent().find('label').text();
                    if (currentValue != '')
                        categories += currentValue + ",";
                });

                if (categories == "") {
                        alert("You must choose at least one category.");
                    }
                else if (tags.match(regex) == null) {
                        alert("You must add tags.");
                }

                else {
                    var service = new KlubNaCitateli.BookService();

                    if (bookField != "") {
                        service.DoWork(tags, categories, bookField, onSuccess);
                        $("#<%=bookField.ClientID %>").val("");
                        $("#dialog-form").dialog("close");
                    }
                    else if(bookIdsField != "") {
                        service.AddAllBooks(tags, categories, bookIdsField, onSuccess);
                        $("#<%=bookIdsField.ClientID %>").val("");
                        $("#dialog-form").dialog("close");
                    }
                }
            });

            $("#close").click(function () {
                $("#<%=bookField.ClientID %>").val("");
                $("#dialog-form").dialog("close");
            });

            $("#dialog-form").dialog({
                autoOpen: false,
                minHeight: "auto",
                show: "slide",
                width: 380,
                modal: true
            });
        });
    </script>

    <style>
        fieldset { padding:0; border:1; margin-top:25px; }
        input.text { margin-bottom:12px; width:95%; padding: .4em; }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    
    <asp:Label ID="lblError" runat="server" Text="lblError" Visible="False"></asp:Label>
    <asp:HiddenField ID="bookField" runat="server" />
    <asp:HiddenField ID="bookIdsField" runat="server" />

    <div id="dialog-form" >
    <label id="title">Choose categories and tags</label>
      <form action="adminpanel.aspx">
          <fieldset id="fieldSet1" >
          <legend>Categories</legend>
            <label id="category" for="category">Choose category</label>
             <asp:CheckBoxList ID="cblCategories" name="category" runat="server" CssClass="cblCategories">
             </asp:CheckBoxList>
             </fieldset>
             <fieldset id="fieldSet2">
             <legend>Tags</legend>
             <label id="tags" for="tags">Write tags</label>
             <asp:TextBox ID="tbTags" name="tags" runat="server" placeholder="Tag1,Tag2,.." CssClass="tbTags"></asp:TextBox>
             <br /><label id="separateLabel">Separate the tags using comma.</label>
          </fieldset>
          <br />
          <div id="buttons">
          <input type="button" id="add" value="Add" />
          <input type="button" id="close" value="Cancel" />
          </div>
       </form>
    </div>

    <fieldset>
        <legend>Manage Categories</legend>
        <asp:TextBox ID="tbCategory" runat="server"></asp:TextBox>
        <asp:Button ID="btnAddCategory" runat="server" Text="Add category" 
            onclick="btnAddCategory_Click" />

        <asp:RegularExpressionValidator ID="revCategory" runat="server" 
            ErrorMessage="The category name must only consist of characters." 
            ControlToValidate="tbCategory" ForeColor="Red" 
            ValidationExpression="^[A-z]+$" ValidationGroup="vGroup1" Display="None"></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="rfvCategory" runat="server" 
            ErrorMessage="The input must not be empty." ControlToValidate="tbCategory" 
            ForeColor="Red" ValidationGroup="vGroup1" Display="None"></asp:RequiredFieldValidator>
        
        <asp:ValidationSummary ID="vSummary1" runat="server" ValidationGroup="vGroup1" 
            DisplayMode="List" ForeColor="Red" />
        
        <asp:GridView ID="gvCategories" runat="server" CellPadding="4" 
            ForeColor="#333333" GridLines="None" DataKeyNames="IDCategory" 
            onrowcancelingedit="gvCategories_RowCancelingEdit" 
            onrowdeleting="gvCategories_RowDeleting" onrowediting="gvCategories_RowEditing" 
            onrowupdating="gvCategories_RowUpdating">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField HeaderText="Manage" ShowEditButton="True" />
                <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" />
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
        </fieldset>

        <fieldset>
        <legend>Add Books from Google.books DB</legend>
        <asp:TextBox ID="tbSearchBooks" runat="server"></asp:TextBox>
        <asp:Button ID="btnSearch" runat="server" Text="Search" 
            onclick="btnSearch_Click" />

        <asp:RequiredFieldValidator ID="rfvSearchBooks" runat="server" 
            ErrorMessage="The input must not be empty." ControlToValidate="tbSearchBooks" 
            ForeColor="Red" Display="None" ValidationGroup="vGroup2"></asp:RequiredFieldValidator>
        <asp:ValidationSummary ID="vSummary2" runat="server" ValidationGroup="vGroup2" 
                DisplayMode="List" ForeColor="Red" />

        <asp:LinkButton ID="addAllBooks" runat="server" Visible="false" 
                onclick="addAllBooks_Click">Add all Books</asp:LinkButton>

        <asp:GridView ID="gvBooks" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataKeyNames="ISBN" ForeColor="#333333" GridLines="None" 
                onselectedindexchanged="gvBooks_SelectedIndexChanged" AllowPaging="True" 
                onpageindexchanging="gvBooks_PageIndexChanging" PageSize="5">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="ISBN" HeaderText="ISBN" />
                <asp:BoundField DataField="Name" HeaderText="Name" />
                <asp:BoundField DataField="Language" HeaderText="Language" />
                <asp:BoundField DataField="YearPublished" HeaderText="Year Published" />
                <asp:ImageField DataImageUrlField="ThumbnailSrc" HeaderText="Thumbnail">
                </asp:ImageField>
                <asp:CommandField HeaderText="Add to database" SelectText="add" 
                    ShowSelectButton="True" />
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
    </fieldset>

    <fieldset>
        <legend>Manage Users</legend>

    </fieldset>
    <asp:ScriptManager runat="server" ID="scriptManager">
        <Services>
            <asp:ServiceReference Path="../Services/BookService.svc" />
        </Services>      
    </asp:ScriptManager>
</asp:Content>
