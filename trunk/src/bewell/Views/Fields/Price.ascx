<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<meridian.bewell.proto.prices>" %>
<%@ Import Namespace="bewell.Models.ViewModels" %>

<% if (Model.price > 0) { %>
   <span class="b-price__num"><%= Model.price.ToString("## ###") %></span> руб.
   <% if (!string.IsNullOrEmpty(Model.comment)) { %>
      <span class="b-price__inf">(<%= Model.comment %>)</span>
   <% }
   Html.RenderPartial("Widgets/InfoBanner",
              new InfoBannerViewModel { Message = "Внимание! Стоимость зависит от даты заезда, варианта размещения и типа питания. Для точного расчета обратитесь к нашему специалисту." });
  } %>
