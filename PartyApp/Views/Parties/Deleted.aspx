<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="server">
	Party Deleted
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Party Deleted</h2>
    <div>
    <p>Your party was successfully deleted.</p>
    </div>
    <div>
    <p><a href="/Parties">Click for Upcoming Parties</a></p>
    </div>

</asp:Content>
