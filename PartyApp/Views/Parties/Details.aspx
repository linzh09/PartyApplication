<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<PartyApp.Models.Party>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Details:<%=Html.Encode(Model.Title) %>
</asp:Content>

<asp:Content ID="details" ContentPlaceHolderID="MainContent" runat="server">
<div id="dinnerDiv">

    <h2><%=Html.Encode(Model.Title) %></h2>

   
    <p>
    <strong>When:</strong>
    <%=Model.PartyDate.ToShortDateString() %>
    <strong>@</strong>
    </p>
    <p>
    <strong>Where:</strong>
    <%=Html.Encode(Model.Address) %>,
    <%=Html.Encode(Model.Country) %>
    </p>
    <p>
    <strong>Description:</strong>
    <%=Html.Encode(Model.Description) %>
    </p>
    <p>
    <strong>Organizer:</strong>
    <%=Html.Encode(Model.HostedBy) %>
    (<%=Html.Encode(Model.Contact) %>)
    </p>
    
    <% if (Model.IsHostedBy(Context.User.Identity.Name)) { %>
    <%: Html.ActionLink("Edit", "Edit", new { id=Model.PartyID }) %> |
    <%= Html.ActionLink("Delete Party", "Delete", new {id=Model.PartyID}) %>
   <% } %>
   </div>
   <div id="mapDiv">
   <%Html.RenderPartial("map"); %>
   </div>
   
   

   <script src="/Scripts/MicrosoftAjax.js" type="text/javascript"></script>
    <script src="/Scripts/MicrosoftMvcAjax.js" type="text/javascript"></script>
    <script type="text/javascript">
    function AnimateResMessage()
    {
     $("#ReservationMessage").animate({ fontSize: "1.5em" }, 400);
     }
      </script>
    
    <div id="ReservationMessage">
   <% if (Request.IsAuthenticated) { %>
    <% if (Model.IsUserRegistered(Context.User.Identity.Name)) { %>
    <p>You are registred for this Party!</p>
    <% } else { %>
     <%=Ajax.ActionLink("Reservation for this event", "Register", "res", new { id = Model.PartyID }, new AjaxOptions { UpdateTargetId = "ReservationMessage",OnSuccess="AnimateResMessage"})%>
    <% } %>
    <% } else { %>
    <a href="/Account/Logon">Logon</a> to reservation for this event.
    <% } %>
    </div>
    
    

</asp:Content>

