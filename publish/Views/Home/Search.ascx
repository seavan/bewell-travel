<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<bewell.Models.ViewModels.ResortSearchViewModel>" %>
<%@ Import Namespace="bewell.Classes" %>
<% bool saveSearchValues = (string)ViewContext.ParentActionViewContext.RouteData.Values["action"] == "cureprofiles"; %>

<% Html.BeginForm("cureprofiles", "home", FormMethod.Get, new { id = "searchForm", @class = "b-head__search" }); %>  	
<div class="b-head__search__table">
    <div class="b-head__search__table__item title">
        поиск курорта
    </div>
    <div class="b-head__search__table__item b-head__search__table__item_select">
        <select class="b-head__search__select" name="CureProfileId" id="CureProfileId">
            <option value="0">что болит?</option>
            <% foreach (var cure in Model.CureProfiles) { %>
                <option value="<%= cure.id %>" <%= cure.id == Model.CureProfileId && saveSearchValues ? "selected='selected'" : "" %>><%= cure.title %></option>
            <% } %>
        </select>
    </div>
    <div class="b-head__search__table__item b-head__search__table__item_select">
        <select class="b-head__search__select" name="TerritoryId" id="TerritoryId">
            <option value="0">где лечим?</option>
            <% foreach (var territory in Model.Territories) { %>
                <option value="<%= territory.id %>" <%= territory.id == Model.TerritoryId && saveSearchValues ? "selected='selected'" : "" %>><%= territory.title %></option>
                <% foreach (var sub in territory.SubTerritories.Where(item => item.in_search).SortByDefault()) { %>
                    <option value="<%= sub.id %>" <%= sub.id == Model.TerritoryId && saveSearchValues ? "selected='selected'" : "" %>><%= "\xA0\xA0\xA0" + sub.title %></option>
                <% } %>
            <% } %>
        </select>
    </div>
    <div class="b-head__search__table__item b-head__search__table__item_button">
        <input id="search" type="submit" value="найти" class="button" />
    </div>
</div>
<% Html.EndForm(); %>

<script type="text/javascript">
    $("#search").on("click", function() {
        var selected = parseInt($("#CureProfileId").val()) > 0 || parseInt($("#TerritoryId").val()) > 0;
        if (!selected) {
            showPopupMessage('Критерии поиска', 'Укажите критерий поиска');
        }
        return selected;
    });
</script>