<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<meridian.bewell.impl.Classes.GalleryPhotos>" %>
<div class="b-f-gallery js-gallery">
    <div class="clearFix">
        <% int i = 0;
           foreach (var photo in Model.Photos.Take(3))
           { %>
            <div class="b-f-gallery__item js-gallery-item <%= i == 2 ? "b-f-gallery__item_last" : string.Empty %>">
                <div class="b-f-gallery__item__in">
                    <img src="<%= i == 0 ? photo.PhotoUrl : photo.PreviewUrl %>" alt="" data-url="<%= photo.PhotoUrl %>"></div>
                <i class="b-f-gallery__item__hover"></i>
            </div>
        <% i++;
           } %>
    </div>
    
    <% if (Model.Photos.Count > 3)
       { %>
       <div class="b-f-gallery__preview js-gallery-preview">
        <div class="js-slide-toggle-content-in">
            <% foreach (var photo in Model.Photos.Skip(3))
               { %>
               <div class="b-f-gallery__preview__item js-gallery-item">
                   <div class="b-f-gallery__preview__item__in">
                       <img src="<%= photo.PreviewUrl %>" alt="" data-url="<%= photo.PhotoUrl %>"></div>
                   <i class="b-f-gallery__item__hover"></i>
               </div>
            <% } %>
        </div>
    </div>
    <div class="b-f-gallery__link js-gallery-preview-door">
        <span class="js-gallery-preview-door-text" data-change="Скрыть фотографии">Показать сразу все фотографии</span>
        <i class="b-arrow b-f-gallery__link__arrow"></i>
    </div>
    <% } %>
</div>

<!--popups-->
<div class="darkness"></div>
<div class="popup popup_gallery js-popup js-popup-gallery">
	<div class="popup__table">
		<div class="popup__table__cell">
			<div class="popup__content">
				<div class="popup__close js-popup-close" title="Закрыть">Закрыть</div>
				<div class="popup__content__in b-content">
					<h2><%= Model.Title %></h2>
					<!---->
					<div class="b-photo-lenta js-photo-lenta">
						<div class="b-photo-lenta__arrow b-photo-lenta__arrow_prev button js-prev" title="Назад"><span class="disabled-arrow-big">Предыдущее фото</span></div>
						<div class="b-photo-lenta__arrow b-photo-lenta__arrow_next button js-next" title="Вперед"><span>Следующее фото</span></div>

						<div class="b-photo-lenta__wrap">
							<div class="b-photo-lenta__lenta js-lenta"></div>
						</div>
					</div>
					<!--/-->
				</div>
			</div>
		</div>
	</div>
</div>
<!--/popups-->
