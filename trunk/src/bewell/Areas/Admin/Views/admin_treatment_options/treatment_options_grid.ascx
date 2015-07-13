﻿
<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<meridian.bewell.proto.treatment_options>>" %>
<div style="padding-top: 30px; margin-top: 10px;  border-top: 1px dotted silver;" >
<%

    Html.Telerik().Grid<meridian.bewell.proto.treatment_options>()
        .Name("t_meridian.bewellList")
        .DataBinding(dataBinding => dataBinding.Ajax()
        .Select("_Select", "admin_treatment_options") 
        .Delete("_Delete", "admin_treatment_options")
        .Update("_Update", "admin_treatment_options")
        .Insert("_Insert", "admin_treatment_options") 
        )
        .DataKeys(keys => keys.Add("id"))
        .Columns(
            c =>
                {
                    c.Bound(col => col.id).Width(80).Id();
                    c.Bound(col => col.title);
 

                    c.Bound(col => col.id).Edit("admin/admin_treatment_options").Width(100);
                    c.Command(cmd =>
                                  {
                                      cmd.Delete();
                                  }
                        ).Width(100);
                }
        )

        .Resizable( rs => rs.Columns(true))
        .Sortable( st => st.OrderBy( so => so.Add(e => e.id).Descending()).Enabled(true))
        .Filterable()
        .Scrollable( scr => scr.Height(453) )
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

