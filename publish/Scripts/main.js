function ImageLoader( _cfg ){

	var count = 0;    
	var total = 0;

	if(_cfg.list){ 
		total = _cfg.list.length;
	} 
	_cfg.images = [];

	function onLoad(){
		count++;
		if( count == total )
			if( _cfg.hasOwnProperty('complete') )
				_cfg.complete();
	};

	for(var i=0; i< total; i++ ){
		newImg = new Image();
		newImg.onload = newImg.onerror = newImg.onabort = onLoad;
		newImg.src = _cfg.list[i];
 
		_cfg.images.push( newImg );
	};
};



$( function() {
	var $window = $(window);
	var $body = $('body');
	var $darkness = $('.darkness');

	var supportsTransition =
		(CSS && typeof CSS.supports === "function")
		&& ( CSS.supports("transition", "all 1s 1s")
			|| CSS.supports("-webkit-transition", "all 1s 1s")
			|| CSS.supports("-moz-transition", "all 1s ease 1s")
			|| CSS.supports("-o-transition", "all 1s 1s")
			)
	;

//popup 
	(function(){
		var $popupArticle = $('.js-popup-article');
		var $popupMap = $('.js-popup-map');
		var $popupSignup = $('.js-popup-signup');
		var $popupCountry = $('.js-popup-country');

		$body.on ("click", ".js-popup-article-door", (function(e){						
			$darkness.show();
			$popupArticle.show();
		}));

		$body.on ("click", ".js-popup-map-door", (function(e){						
			$darkness.show();
			$popupMap.show();
		}));

		$body.on ("click", ".js-popup-signup-door", (function(e){						
			$darkness.show();
			$popupSignup.show();
		}));

		$body.on ("click", ".js-popup-country-door", (function(e){						
			$darkness.show();
			$popupCountry.show();
		}));

		$body.on ("click", ".js-popup-close", (function(e){						
			$darkness.hide();
			$(this).closest('.js-popup').hide();
		})); 

	})();

//slide-toggle (footer map, search)
	(function(){
		var $slideToggleWrap = $('.js-slide-toggle');

		if(!supportsTransition) { 
			$slideToggleWrap.find(".js-slide-toggle-content.b-close").removeClass("b-close").hide();
		}

		$slideToggleWrap.on ("click", ".js-slide-toggle-door", (function(e){
			var $this = $(this);
			var $wrap = $this.closest('.js-slide-toggle');
			var $content = $wrap.find(".js-slide-toggle-content");
			var $text = $this.find(".js-slide-toggle-door-text");

			$this.toggleClass('b-close');

			if($text.length) {
				var textNew = $text.data("change");
				var textDef = $text.text();
				
				$text.data('change', textDef).attr('data-change', textDef);
				$text.text(textNew);
			}

			if(supportsTransition) {
				$content.toggleClass('b-close');	
			} else {
				$content.slideToggle();	
			}

		}));		

	})();

    //tabs
    (function () {
        var $wrap = $('.js-tabs');

        $('.js-tabs-content').children().hide().find(".js-tabs-active").show();
        $('.js-tabs-content').find(".js-tabs-active").show();

        $wrap.on("click", ".js-tabs-item", (function (e) {
            var $tabsItem = $(this);
            $tabsItem.addClass("b-active").siblings().removeClass("b-active");

            $('.js-tabs-content').find('#' + $tabsItem.data("tab")).show().siblings().hide();
        }));

    })();
    //end tabs

	function animateLentaHor( $block, srtLine){
		var $view = $block.find('.js-lenta');
		var $blocks = $view.find('.js-lenta-item');
		var $nextB, $prevB;

		var w = $blocks.outerWidth(true);
		var go=1;

		$view.css({ marginLeft: 0});

		if( $blocks.length <= srtLine ){
			$block.find('.js-next').hide();
			$block.find('.js-prev').hide();
		} 

		// next
		$block.on ("click", ".js-next", (function(event){		
			if(go===1){
				go=0;
			
				$nextB = $view.find('.js-lenta-item:first').next();
				$view.animate({ marginLeft: -w }, function(){				
					$view.css({ marginLeft:0 }).append($nextB.prev().eq(0));
					go=1;
				});	
			}

			event.stopImmediatePropagation();
		}));

		// prev
		$block.on ("click", ".js-prev", (function(event){	
			if(go===1){
				go=0;

				$prevB = $view.find('.js-lenta-item:last');
				$view.css({ marginLeft:-w }).prepend($prevB.eq(0)).stop().animate({marginLeft: 0}, 500, function(){ go=1; });
			}

			event.stopImmediatePropagation();
		}));

	};


//gallery
	(function(){
		var $gallery = $('.js-gallery');
		var $popupGallery = $('.js-popup-gallery');

		//slideToggle preview
		$gallery.on ("click", ".js-gallery-preview-door", (function(e){		
			var $this =  $(this);
			var $wrap = $this.closest('.js-gallery');
			var $preview = $wrap.find(".js-gallery-preview");
			var $text = $this.find(".js-gallery-preview-door-text");
			var textNew = $text.data("change");
			var textDef = $text.text();
			
			$this.toggleClass('b-close');
			$text.data('change', textDef).attr('data-change', textDef);
			$text.text(textNew);

			$preview.slideToggle();
		}));	
		

		//photo-lenta
		$gallery.on ("click", ".js-gallery-item", (function(e){		
			var $this =  $(this);
			var $wrap = $this.closest('.js-gallery');
			var $img = $wrap.find("img");
			var indexCurItem = $wrap.find('.js-gallery-item').index($this);

			var urls = [];

			$img.each(function(i){
				if($(this).data('url')) {
					urls.push($(this).data('url'));
				}
			});

			if(urls.length) {
				ImageLoader({
							list : urls
							, complete : function(){					
								var $photoLentaWrap = $popupGallery.find('.js-photo-lenta');
								var $photoLenta = $photoLentaWrap.find('.js-lenta');
								var $curB;

								$photoLenta.empty();

								for(var i=0; i< urls.length; i++ ){
									var bidImg = '<span class="js-lenta-item"><img src="'+ urls[i] +'" alt="" /></span>';
									$photoLenta.append(bidImg);
								};

								$curB = $photoLenta.find('.js-lenta-item:first');

								for(var i=0; i< indexCurItem; i++ ){
									$nextB = $curB.next();
									$curB = $nextB;
									$photoLenta.append($nextB.prev().eq(0));
								}

								animateLentaHor( $photoLentaWrap, 1);
								
								$popupGallery.show();
								$darkness.show();
								
							}
				});
			}

		}));

	})();


//faq lenta promo
	(function(){
		var $faqLentaWrap = $(".js-faq-lenta");
		
		animateLentaHor( $faqLentaWrap, 1);
	})();

//promo
	(function(){
		var $promoWrap = $(".js-promo");
		var $pages = $promoWrap.find('.js-promo-page'); 
		var $items = $promoWrap.find('.js-promo-item'); 
		var $bgs = $promoWrap.find('.js-promo-bg'); 
		var $itemFirst = $promoWrap.find('.js-promo-item:first'); 
		var $itemLast = $promoWrap.find('.js-promo-item:last'); 
		var $itemCur = $itemFirst;

		var go = 1;

		$pages.eq(0).addClass('cur');

		$itemFirst.find('.js-promo-item-anons').css({ top: 63, opacity: 1 });
		$itemFirst.find('.js-promo-item-pic').css({ top: 0, opacity: 1 });
		$itemFirst.addClass('cur');
		$bgs.eq(0).addClass('cur').show();

		function slideInCurrent( $newSlide ){
			var $anons = $newSlide.find(".js-promo-item-anons");
			var $pic = $newSlide.find(".js-promo-item-pic");
			var $bg = $bgs.eq($items.index($newSlide));
			
			$newSlide.addClass('cur');

			$bg.fadeIn(2000);

			window.setTimeout(function(){
				$anons.animate({ top: 63, opacity: 1 }, 700, function(){
					go = 1;
					$itemCur = $newSlide;
				});
			}, 450);

			$pic.animate({ top: 0, opacity: 1 }, 1000, null);
		};

		function slideOutCurrent( $newSlide ){
			var $anons = $itemCur.find(".js-promo-item-anons");
			var $pic = $itemCur.find(".js-promo-item-pic");
			var $bg = $bgs.eq($items.index($itemCur));

			$bg.fadeOut(1500);

			$anons.animate({ opacity: 0 }, 300, function(){
				$anons.css({ top: 385 });
			});

			$pic.animate({ opacity: 0 }, 300, function(){
				$pic.css({ top: -385 });
				$itemCur.removeClass('cur');
				slideInCurrent($newSlide);
			});
		};

		function changePage( $page ){
			$page.addClass('cur').siblings().removeClass('cur');
		};


		function beginAnimate(){	
			$slideTimer = setInterval(function() {		
				var $next;

				if ( $items.index($itemCur) == $items.index($itemLast) )
				{
					$next = $itemFirst;
				} else {
					$next = $itemCur.next();
				}	
				
				changePage($pages.eq($items.index($next)));
				slideOutCurrent($next);
		
			}, 7000);		
		};

		$promoWrap.on ("click", ".js-promo-page", (function(){	
			var $this = $(this);
			var index = $pages.index($this);
			
			if(!$this.is(".cur") && go){
				go = 0;
				changePage($this)
				slideOutCurrent($items.eq(index));	
				clearInterval($slideTimer);
				beginAnimate();
			}
		}));

		
		$promoWrap.on ("click", ".js-promo-next", (function(){	
			var $this = $(this);
			var $next = $itemCur.next();
		
			if($items.index($itemCur) == $items.index($itemLast)) {
				$next = $itemFirst;
			}

			if(go){
				go = 0;
				changePage($pages.eq($items.index($next)));
				slideOutCurrent($next);
				clearInterval($slideTimer);
				beginAnimate();
			}
		}));


		$promoWrap.on ("click", ".js-promo-prev", (function(){	
			var $this = $(this);
			var $prev = $itemCur.prev();
		
			if($items.index($itemCur) == $items.index($itemFirst)) {
				$prev = $itemLast;
			}

			if(go){
				go = 0;
				changePage($pages.eq($items.index($prev)));
				slideOutCurrent($prev);
				clearInterval($slideTimer);
				beginAnimate();
			}

		}));

		beginAnimate();
		
	})();

//priroda_lechit b-article-list
	(function(){
		var $list = $(".js-article-list");

		$list.on("click", ".b-article-list__item__arrow", (function (e) {						
			var $this = $(this);
			var $sublist = $this.parent().parent().find(".js-article-list-sub");

			$this.parent().toggleClass("b-active");
			$sublist.slideToggle();

		}));
	})();

//comment
	(function(){
		var $list = $(".js-comment-list");
		
		$list.on ("click", ".js-comment-list-door", (function(e){						
			var $this = $(this);
			var $textWrap = $this.parent();
				
			var textNew = $this.data("change");
			var textDef = $this.text();
				
			$this.data('change', textDef).attr('data-change', textDef);
			$this.text(textNew);

			$textWrap.toggleClass("b-active");

		}));
	})();


//map
	(function(){
		var $map = $(".js-country-map");
		var $area = $map.find("area");
		var $listBox = $(".js-country-list-box");
		var cssClassActive = "b-active";
		var cssClassHover = "b-hover";

		function changeState(area, cssClass){
			var $land = area.closest(".js-country-map").find('.js-country-map-item[data-land-id="'+ area.data("land-id") +'"]');

			$land.toggleClass(cssClass);

			if(cssClass == cssClassActive) {
				var $listActive = $listBox.find('input[data-land-id="'+ area.data("land-id") +'"]');
				var checked = !!($land.is("." + cssClassActive));
				
				$listActive.each(function(i){
					$listActive[i].checked = checked;
				});
			}
		};

		$area.hover(function(e) {		
			changeState($(this), cssClassHover);
		}, function(e){
			changeState($(this), cssClassHover);
		});

		$map.on ("click", "area", (function(event){						
			changeState($(this), cssClassActive);
			event.preventDefault();
		}));

		$listBox.on ("change", ".js-country-list-item", (function(e){						
			var $input = $(this);
			var $land = $map.find('.js-country-map-item[data-land-id="'+ $input.data("land-id") +'"]');	
			
			if($input.is(":checked")) {
				$land.addClass(cssClassActive);
			} else {
				var $inputActiveLand = $listBox.find('input[data-land-id="'+ $input.data("land-id") +'"]:checked');
				
				if($inputActiveLand.length == 0){
					$land.removeClass(cssClassActive);
				} 
			}
		}));		

	})();

});