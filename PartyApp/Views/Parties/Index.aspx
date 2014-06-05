<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PartyApp.Models.Party>>" %>

<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Upcoming Parties</h2>
    <ul>
    <% foreach (var party in Model) { %>
    <li>
    <%=Html.ActionLink(party.Title, "Details", new { id=party.PartyID }) %>
    on
    <%=Html.Encode(party.PartyDate.ToShortDateString())%>
    at
    <%=Html.Encode(party.PartyDate.ToShortTimeString())%>
    </li>
    <% } %>
    </ul>   
        
 </asp:Content>