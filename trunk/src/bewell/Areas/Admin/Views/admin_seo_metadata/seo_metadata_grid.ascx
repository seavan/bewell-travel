
<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<meridian.bewell.proto.seo_metadata>>" %>
<div style="padding-top: 30px; margin-top: 10px;  border-top: 1px dotted silver;" >
<%

    Html.Telerik().Grid<meridian.bewell.proto.seo_metadata>()
        .Name("t_meridian.bewellList")
        .DataBinding(dataBinding => dataBinding.Ajax()
        .Select("_Select", "admin_seo_metadata") 
        .Delete("_Delete", "admin_seo_metadata")
        .Update("_Update", "admin_seo_metadata")
        .Insert("_Insert", "admin_seo_metadata") 
        )
        .DataKeys(keys => keys.Add("id"))
        .Columns(
            c =>
                {
                    c.Bound(col => col.id).Width(80).Id();
                    c.Bound(col => col.entity_id).Hidden(true);
                    c.Bound(col => col.url);
                    c.Bound(col => col.title);
                    c.Bound(col => col.keywords);
                    c.Bound(col => col.description);
 

                    c.Bound(col => col.id).Edit("admin/admin_seo_metadata").Width(100);
                    c.Command(cmd =>
                                  {
                                      cmd.Delete();
                                  }
                        ).Width(100);
                }
        )

        .Resizable( rs => rs.Columns(true))
        .Sortable( st => st.OrderBy( so => so.Add(e => e.id).Descending()).Enabled(true))
        .Filterable(filtering => filtering.Filters(f => f.Add(e => e.entity_id).IsEqualTo(0)).Enabled(true))
        .Scrollable(scr => scr.Height(453))
        .Pageable(
            pager => pager.PageSize(10)
        )
        .ClientEvents(
        s =>
            s.OnDataBound("updateGrids")
            .OnEdit("gridEdit").OnRowDataBound("bindRow")
            )
        .Render();
%>
</div>


