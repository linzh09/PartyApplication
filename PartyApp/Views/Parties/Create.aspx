<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<PartyApp.Models.Party>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="server">
	Host a Party
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
<h2>Host a Dinner</h2>
<%=Html.ValidationSummary("Please correct the errors and try again.") %>
    <% using (Html.BeginForm()) { %>  
    <fieldset>
    <div id="partyDiv">
     <p>   
        <label for="Title">Dinner Title:</label>
        <%=Html.TextBox("Title") %>
        <%=Html.ValidationMessage("Title", "*Required") %>        
        </p>

        <p>
        <label for="PartyDate">PartyDate:</label>
        <%=Html.TextBox("PartyDate", String.Format("{0:g}", Model.PartyDate))%>
        <%=Html.ValidationMessage("PartyDate", "*Required")%>
        </p>

        <p>
        <label for="Description">Description:</label>
        <%=Html.TextArea("Description") %>
        <%=Html.ValidationMessage("Description", "*Required")%>
        </p>
        <p>
        <label for="Address">Address:</label>
        <%=Html.TextBox("Address") %>
        <%=Html.ValidationMessage("Address", "*Required")%>
        </p>
        <p>
        <label for="Country">Country:</label>
        <%=Html.TextBox("Country") %>
        <%=Html.ValidationMessage("Country", "*Required")%>
        </p>
        <p>
        <label for="Contact">Contact:</label>
        <%=Html.TextBox("Contact") %>
        <%=Html.ValidationMessage("Contact", "*Required")%>
        </p>
        <p>
        <label for="Latitude">Latitude:</label>
        <%=Html.TextBox("Latitude") %>
        <%=Html.ValidationMessage("Latitude", "*") %>
        </p>
        <p>
        <label for="Longitude">Longitude:</label>
        <%=Html.TextBox("Longitude") %>
        <%=Html.ValidationMessage("Longitude", "*") %>
        </p>
        
        
        <p>
        <input type="submit" value="Save"/>
        </p>
        </div>
        <div id="mapDiv">
        <%Html.RenderPartial("Map"); %>
        </div>           
      
        </fieldset>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#Address").blur(function (evt) {
                    $("#Latitude").val("");
                    $("#Longitude").val("");

                    var address = jQuery.trim($("#Address").val());
                    if (address.length < 1)
                        return;

                    FindAddressOnMap(address);
                });
            });
        </script>  
       
      
       
        <% }
        %>

        </asp:Content>