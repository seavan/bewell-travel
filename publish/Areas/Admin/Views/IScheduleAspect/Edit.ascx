<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<meridian.bewell.proto.IScheduleAspect>" %>
<%
    var prefix = Model.FieldName;
    var id = prefix + "Schedule";
    var saveFunction = "save" + id;
    var controller = "IScheduleAspect";
    var method = "Save";
    var parentProto = Model.GetParent().ProtoName;
    var parentId = Model.GetParent().id;
%>
<div id="<%= id %>" data-uri="/<%= controller %>/<%= method %>" data-prefix="<%= prefix %>"
    data-parent-id="<%= parentId %>" data-parent-proto="<%= parentProto %>" style="width: 750px; overflow-x: scroll">
  <p>расписание сохраняется на две недели вперед, одинаковое на каждый день</p>
  <table>
      
  <%
      var places = Model.GetAvalablePlaces();
      var scheduleAll = Model.GetPlacesSchedule();
      var startDate = DateTime.Now;
      var daysCount = 14;
      %>
      <tr>
          <th>место</th>
          <th>ред.</th>
          <%
              var cDate = startDate;
              for (int i = 0; i < daysCount; ++i)
              {
                  %>
                  <th><%= String.Format("{0:D2}.{1:D2}", cDate.Day, cDate.Month) %></th>
                  <%
                cDate = cDate.AddDays(1);
              }
                      
               %>
      </tr>
      <%
                  foreach (var p in places)
                  {
                      var fname = String.Format("{0}.{1}.all", Model.FieldName, p.id);
                      var schedule = scheduleAll.IndexOfKey(p.id) != -1 ? scheduleAll[p.id] : new List<DateTime>();
                      var scheduleLimited = schedule.Where(s => s >= startDate);
          
          %>
          <tr>
              <td style="width: 150px"><%= p.title%></td>
              <td>
                  <input type="text" id="<%= fname %>" name="<%= fname %>"/>
              </td>
              
          <%
               cDate = startDate;
              for (int i = 0; i < daysCount; ++i)
              {
                  var times = String.Join(", ", schedule.Where(s => s.Date == cDate.Date).OrderBy(s => s).Select(
                      s => String.Format("{0:D2}:{1:D2}", s.Hour, s.Minute)));
                  
                  %>
                  <td><%= times %></td>
                  <%
                cDate = cDate.AddDays(1);
              }
                      
               %>
          </tr>
          <%
                  }
       %>
  </table>
</div>
<div>
    <a class="_link" href="#" onclick="return saveFunction('#<%= id %>')" style="float: right">
        Сохранить расписание (автоматическое сохранение отключено)</a>
</div>
<script>
/*    if (saveCallbacks) {
        saveCallbacks.push(function () {
            saveFunction('#<%= id %>');
        });
    } */
</script>
