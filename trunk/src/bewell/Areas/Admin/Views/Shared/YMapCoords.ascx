﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%@ Import Namespace="admin.db" %>

<%
    var fname = ViewData.TemplateInfo.GetFullHtmlFieldName(string.Empty);
    var geo = ViewData["parentModel"] as meridian.bewell.proto.IGeoLocation;
    var parent = ViewData["parentModel"] as IDatabaseEntity;
%>

<div xmlns="http://www.w3.org/1999/xhtml" xmlns:str="http://exslt.org/strings" id="YMapsID" style="width:690px;height:450px" class="YMaps" 
data-uri="/IMapAspect/Save" data-prefix="<%= fname %>" data-parent-id="<%= parent.id %>" data-parent-proto="<%= parent.ProtoName %>" data-curcoords="<%: geo.GeoLocationCoordinates %>"></div>

<%--<script type="text/javascript" src="http://api-maps.yandex.ru/1.1/index.xml?key=ANpUFEkBAAAAf7jmJwMAHGZHrcKNDsbEqEVjEUtCmufxQMwAAAAAAAAAAAAvVrubVT4btztbduoIgTLAeFILaQ==&modules=pmap"></script>--%>
  <script type="text/javascript">

      var YMaps = { location: { longitude: 37.617671, latitude: 55.755768, zoom: 10, city: 'Москва', region: 'Москва и Московская область', country: 'Россия'} };

      (function () {
          var Internal = {
              MapData: {
                  userKey: 'ANpUFEkBAAAAf7jmJwMAHGZHrcKNDsbEqEVjEUtCmufxQMwAAAAAAAAAAAAvVrubVT4btztbduoIgTLAeFILaQ==',
                  versionPath: 'http://api-maps.yandex.ru/1.1.21/',
                  modulePath: 'http:\/\/api-maps.yandex.ru\/modules\/1.1\/',
                  dataVersion: '3.141.04.10.1',
                  tileUrlTemplates: {
                      map: 'http://vec0%d.maps.yandex.net/tiles?l=map&%c&%g',
                      sat: 'http://sat0%d.maps.yandex.net/tiles?l=sat&%c&%g',
                      skl: 'http://vec0%d.maps.yandex.net/tiles?l=skl&%c&%g'
                  },
                  printerHost: '\/\/static-maps.yandex.ru\/1.x\/'
              },
              onerror: function (message) { alert(message); }
          };
          Internal.ModuleData = {
              data: {
                  cacheParam: '3.141.04.10.1',
                  files: { js: ['$[versionPath]xml/data.xml'] }
              },
              core: {
                  depends: ['data'],
                  files: {
                      js: ['$[versionPath]_YMaps.js'],
                      css: ['$[versionPath]_YMaps.css'],
                      ieCss: ['$[versionPath]_YMaps-ie.css']
                  }
              }
          };
          Internal.ModuleData['pmap'] = { version: '', depends: ['core'], fileList: { js: [{ file: '$[modulePath]pmap\/_pmap.js'}], css: [] }, options: { "tileUrlTemplates": { "pmap": "http://0%d.pvec.maps.yandex.net/?l=pmap&%c&%g", "pskl": "http://0%d.pvec.maps.yandex.net/?l=pskl&%c&%g" }, "searchUrl": "http://psearch-maps.yandex.ru/1.x/", "userKey": "ANpUFEkBAAAAf7jmJwMAHGZHrcKNDsbEqEVjEUtCmufxQMwAAAAAAAAAAAAvVrubVT4btztbduoIgTLAeFILaQ==" }, cacheParam: '1.1-2.0' };

          (function (s, j) { var m = j.ModuleData, r = {}, y = navigator.userAgent.toLowerCase(), n = y.indexOf("msie") != -1 && y.indexOf("opera") == -1, z = n && (!document.documentMode || document.documentMode < 8), k = document.createElement("div"), a = { ie: z, css3: !n && (k.style.boxShadow != undefined || k.style.MozBoxShadow != undefined || k.style.WebkitBoxShadow != undefined) }, e = document.getElementsByTagName("head")[0], q = [], v = +new Date; s.load = function (B, D) { if (!arguments.length || typeof (arguments[0]) == "function") { D = arguments[0]; B = ["core"] } if (typeof (B) == "string") { B = [B] } var G = D && B.length > 1 ? t(B, D) : D; for (var E = 0, C = B.length; E < C; E++) { var F = w(B[E]); if (F.ready) { if (G) { G() } } else { if (G) { F.callbacks.push(G) } p(B[E]) } } f() }; function t(B, C) { return function () { for (var E = 0, D = B.length; E < D; E++) { if (!w(B[E]).ready) { return } } C() } } function p(D) { if (u(D, q) == -1) { q.push(D); if (m[D]) { for (var C = 0, E = m[D].depends || [], B = E.length; C < B; C++) { p(E[C]) } } } } function f() { var C = [], F = [], E, B; for (E = 0, B = q.length; E < B; E++) { var D = q[E], G = w(D); if (G.loading != 2) { if (m[D]) { G.loading = 2; F.push(D) } else { if (G.loading != 1) { G.loading = 1; C.push(D) } } } } if (C.length) { h(C) } for (E = 0, B = F.length; E < B; E++) { g(F[E]) } } function b(D) { var E = D.match.split(" "); for (var C = 0, B = E.length; C < B; C++) { if (!a[E[C]]) { return false } } return true } function c(G, B, D) { if (G) { for (var E = 0, C = G.length, F; E < C; E++) { F = G[E]; if (!F.match || b(F)) { B([F.file], D); break } } } } function g(D) { var F = m[D]; if (F.error) { j.onerror(F.error.message); return } var E = F.files, C = F.fileList, B = F.cacheParam; if (C) { c(C.css, l, B); c(C.js, d, B) } else { F.sendInternal = true; if (z && E.ieCss) { l(E.ieCss, B) } else { if (E.css) { l(E.css, B) } } d(E.js || [], B) } } function h(F) { var E = "jsonp" + v++, B, G, D, C = F.length; window[E] = function (J) { for (var I = 0, H = J.length, K; I < H; I++) { K = J[I].data; K.sendInternal = !K.fileList; m[J[I].name] = K } for (I = 0; I < H; I++) { var K = m[F[I]]; if (K) { var L = K.depends || []; for (D = 0; D < L.length; D++) { p(L[D]) } } } f(); window.setTimeout(function () { window[E] = undefined; try { delete window[E] } catch (M) { } if (B) { B.parentNode.removeChild(B) } }, 0) }; B = d([j.MapData.modulePath + "aggregate/modules.jsonp.xml?key=" + j.MapData.userKey + "&modules=" + F.join("~") + "&jsonp=" + E])[0] } s.onLoad = function (C, B) { if (u(C, q) != -1 && m[C]) { w(C).maker = B; A() } }; function w(B) { if (!r[B]) { r[B] = { ready: 0, callbacks: [], maker: null, loading: 0} } return r[B] } function A() { var C = 1; while (C) { C = 0; for (var E = 0; E < q.length; E++) { var D = q[E], F = w(D); if (F.maker && !F.ready && i(D)) { o(D); C = 1 } } } var B = []; for (var E = 0; E < q.length; E++) { if (!w(q[E]).ready) { B.push(q[E]) } } q = B } function i(D) { for (var C = 0, E = m[D].depends || [], B = E.length; C < B; C++) { if (!w(E[C]).ready) { return 0 } } return 1 } function o(D) { var F = w(D), E = m[D], B = E.options || {}; if (E.sendInternal) { F.maker(s, j, B) } else { F.maker(s, B) } F.ready = 1; for (var C = 0; C < F.callbacks.length; C++) { F.callbacks[C]() } } function x(C, B) { return C.replace("$[versionPath]", j.MapData.versionPath).replace("$[modulePath]", j.MapData.modulePath) + (B ? "?v=" + B : "") } function d(C, E) { var F = []; for (var G = 0, D = C.length; G < D; G++) { if (!j.useDocumentWrite) { var B = document.createElement("script"); B.charset = "utf-8"; B.src = x(C[G], E); F.push(B); e.insertBefore(B, e.firstChild) } else { document.write('<script type="text/javascript" charset="utf-8" src="' + x(C[G], E) + '"><\/script>') } } return F } function l(E, C) { for (var D = 0, B = E.length; D < B; D++) { if (!j.useDocumentWrite) { var F = document.createElement("link"); F.rel = "stylesheet"; F.href = x(E[D], C); e.insertBefore(F, e.firstChild) } else { document.write('<link rel="stylesheet" href="' + x(E[D], C) + '"/>') } } } s.Module = { CORE: "core", HOTSPOTS: "hotspots", TRAFFIC: "traffic" }; function u(E, B) { for (var D = 0, C = B.length; D < C; D++) { if (B[D] == E) { return D } } return -1 } })(YMaps, Internal);
          Internal.useDocumentWrite = 1; YMaps.load('core'); YMaps.load('pmap'); delete Internal.useDocumentWrite;
      })();

  </script>
  <link rel="stylesheet" href="http://api-maps.yandex.ru/1.1.21/_YMaps.css"/>
  <script type="text/javascript" charset="utf-8" src="http://api-maps.yandex.ru/1.1.21/_YMaps.js"></script>
  <script type="text/javascript" charset="utf-8" src="http://api-maps.yandex.ru/1.1.21/xml/data.xml?v=3.141.04.6.9"></script>
  <script type="text/javascript" charset="utf-8" src="http://api-maps.yandex.ru/modules/1.1/pmap/_pmap.js?v=1.1-2.0"></script>
  <script type="text/javascript" src="/content/js/ygetlonglat.js"></script>
  