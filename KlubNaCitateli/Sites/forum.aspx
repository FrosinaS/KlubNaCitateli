﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="forum.aspx.cs" Inherits="KlubNaCitateli.Sites.forum" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/forum.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div id="header">
        <asp:Label ID="Label1" runat="server" CssClass="headerLabel" Text="Readers club forum">
        </asp:Label>
    </div>
    <div id="Div1" class="maintopics">
        <div class="naslov">
            Off topic</div>
        <div id="Div2" class="topic">
            <div class="thread">
                <label id="Label2" runat="server">
                    General</label><br />
                <label id="Label3" runat="server">
                    Threads:</label>
                <label id="Label4" runat="server">
                    50</label>
                <label runat="server" id="Label5">
                    Posts</label>
                <label id="Label6" runat="server">
                    1200</label>
                <div style="display: none;" class="id">
                </div>
            </div>
            <div class="mostCommCat">
                <a href="#">Bla bla</a><br />
                <label>
                    Posts:</label><label>1368</label><div style="display: none;" class="id">
                        id</div>
            </div>
            <div class="nodiv">
            </div>
        </div>
    </div>
    <div id="Div3" class="maintopics">
        <div class="naslov">
            Off topic</div>
        <div id="Div4" class="topic">
            <div class="thread">
                <label id="Label7" runat="server">
                    General</label><br />
                <label id="Label8" runat="server">
                    Threads:</label>
                <label id="Label9" runat="server">
                    50</label>
                <label runat="server" id="Label10">
                    Posts</label>
                <label id="Label11" runat="server">
                    1200</label>
                <div style="display: none;" class="id">
                </div>
            </div>
            <div class="mostCommCat">
                <a href="#">Bla bla</a><br />
                <label>
                    Posts:</label><label>1368</label><div style="display: none;" class="id">
                        id</div>
            </div>
            <div class="nodiv">
            </div>
        </div>
    </div>
    <div id="topics3" class="maintopics">
        <div class="naslov">
            Off topic</div>
        <div id="Div8" class="topic">
            <div class="thread">
                <label id="Label37" runat="server">
                    General</label><br />
                <label id="Label38" runat="server">
                    Threads:</label>
                <label id="Label39" runat="server">
                    50</label>
                <label runat="server" id="Label40">
                    Posts</label>
                <label id="Label41" runat="server">
                    1200</label>
                <div style="display: none;" class="id">
                </div>
            </div>
            <div class="mostCommCat">
                <a href="#">Bla bla</a><br />
                <label>
                    Posts:</label><label>1368</label><div style="display: none;" class="id">
                        id</div>
            </div>
            <div class="nodiv">
            </div>
        </div>
    </div>
</asp:Content>
