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

function showPopupMessage(title, text, width) {
    var $message = $("#popup-message");
    var $darkness = $('.darkness');

    if (title) {
        $("#popup-message-title").html(title);
    }

    if (text) {
        $("#popup-message-text").html(text);
    }

    if (width) {
        $("#popup-message .popup__content").css("width", width);
    }

    $darkness.show();
    $message.show();
}

function changeState(area, cssClass) {
    var $listBox = $(".js-country-list-box");
    var $lands = area.closest(".js-country-map").find('.js-country-map-item').not('[data-land-id="' + area.data("land-id") + '"]');

    $lands.removeClass("b-active").removeClass("b-hover");

    var $land = area.closest(".js-country-map").find('.js-country-map-item[data-land-id="' + area.data("land-id") + '"]');

    $land.toggleClass(cssClass);

    $listBox.children().hide();

    if ($land.is(".b-active")) {
        $listBox.find('li[data-land-id="' + area.data("land-id") + '"]').show();
    }
};

$(function () {
    var $window = $(window);
    var $body = $('body');
    var $darkness = $('.darkness');

    var supportsTransition =
		(CSS && typeof CSS.supports === "function")
		&& (CSS.supports("transition", "all 1s 1s")
			|| CSS.supports("-webkit-transition", "all 1s 1s")
			|| CSS.supports("-moz-transition", "all 1s ease 1s")
			|| CSS.supports("-o-transition", "all 1s 1s")
			)
	;

    //popup 
    (function () {
        var $popupArticle = $('.js-popup-article');
        var $popupMap = $('.js-popup-map');
        var $popupCallMe = $('.js-popup-callme');
        var $popupSignup = $('.js-popup-signup');
        var $popupCountry = $('.js-popup-country');


        $body.on("click", ".js-popup-article-door", (function (e) {
            $darkness.show();
            $popupArticle.show();
        }));

        $body.on("click", ".js-popup-map-door", (function (e) {
            $door = $(this);
            $window = $door.next('.js-popup-map');
            if ($window.length > 0) {

                $darkness.show();
                $window.show();

                var localCoors = "";
                var $localCoorsField = $window.find("input[type=hidden][id^=baseCoordsField]");
                if ($localCoorsField.length > 0) localCoors = $localCoorsField.val();
                var localgroups = $window.find("input[type=hidden][id^=groupsField]").val();

                try {
                    if (localCoors != "" && localgroups != "" && typeof (localCoors) != "undefined" && typeof (localgroups) != "undefined") {

                        var index = $localCoorsField.attr("id").replace("baseCoordsField_", "", "gi");
                        $localCoorsField.prev().css('height', '454');
                        InitMap(jQuery.parseJSON(localCoors), jQuery.parseJSON(localgroups), index);
                    } else {
                        InitMap(bewellCoords, groups);
                    }


                } catch (e) {

                }
            }

        }));

        $body.on("click", ".js-popup-signup-door", (function (e) {
            $darkness.show();
            $popupSignup.show();
        }));

        $body.on("click", ".js-popup-country-door", (function (e) {
            $darkness.show();
            $popupCountry.show();
        }));

        $body.on("click", ".js-popup-callme-door", (function (e) {
            $darkness.show();
            $popupCallMe.show();
        }));

        $body.on("click", ".js-popup-close", (function (e) {
            $darkness.hide();
            $(this).closest('.js-popup').hide();
        }));

    })();

    //slide-toggle (footer map, search)
    (function () {
        var $slideToggleWrap = $('.js-slide-toggle');

        if (!supportsTransition) {
            $slideToggleWrap.find(".js-slide-toggle-content.b-close").removeClass("b-close").hide();
        }

        $slideToggleWrap.on("click", ".js-slide-toggle-door", (function (e) {
            var $this = $(this);
            var $wrap = $this.closest('.js-slide-toggle');
            var $content = $wrap.find(".js-slide-toggle-content");
            var $text = $this.find(".js-slide-toggle-door-text");

            $this.toggleClass('b-close');

            if ($text.length) {
                var textNew = $text.data("change");
                var textDef = $text.text();

                $text.data('change', textDef).attr('data-change', textDef);
                $text.text(textNew);
            }

            if (supportsTransition) {
                $content.toggleClass('b-close');
            } else {
                $content.slideToggle();
            }

        }));

    })();
    (function () {
        $('body').click(function (ev) {
            var $authBlock = $('.panel-top__item.auth__signin');

            if ($(ev.target).closest('.panel-top__item.auth__signin').length == 0) {
                $authBlock.find('.js-slide-toggle-door').addClass('b-close');
                $authBlock.find('.js-slide-toggle-content').addClass('b-close');

                $authBlock.find('#EMailAuth').val('');
                $authBlock.find('.field-validation-error').html('');
                $authBlock.find('#Password').val('');
                $authBlock.find('#Remember').removeAttr('checked');
                $authBlock.find('.b-form__checkbox > span').removeClass("checked");
            }
        });

        $('.b-form_login__button').on("click", " .b-form__checkbox > span", function (e) {
            $(this).toggleClass("checked");
        });
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

            if ($tabsItem.data("hash")) {
                document.location.hash = $tabsItem.data("hash");
            } else {
                document.location.hash = '';
            }

        }));

    })();
    //end tabs

    function animateLentaHor($block, srtLine) {
        var $view = $block.find('.js-lenta'),
            $blocks = $view.find('.js-lenta-item'),
            w = $blocks.outerWidth(true),
            blocksCount = $blocks.length,
            currentBlock = 1,
            currentMargin = 0,
            canMove = 1,
            $nextB = $block.find('.js-next span'),
            $prevB = $block.find('.js-prev span');

        $view.css({ marginLeft: currentMargin });

        if ($blocks.length <= srtLine) {
            $nextB.hide();
            $prevB.hide();
        }

        // next
        $block.on("click", ".js-next", (function (event) {
            if (canMove === 1 && currentBlock < blocksCount) {
                if ($block.hasClass("js-photo-lenta")) {
                    $prevB.removeClass("disabled-arrow-big");
                } else {
                    $prevB.removeClass("disabled-back-arrow");
                }

                canMove = 0;
                currentMargin -= w;

                $view.animate({ marginLeft: currentMargin }, function () {
                    canMove = 1;
                    currentBlock++;
                    if (currentBlock == blocksCount) {
                        if ($block.hasClass("js-photo-lenta")) {
                            $nextB.addClass("disabled-arrow-big");
                        } else {
                            $nextB.addClass("disabled-forward-arrow");
                        }
                    }
                });
            }

            event.stopImmediatePropagation();
        }));

        // prev
        $block.on("click", ".js-prev", (function (event) {
            if (canMove === 1 && currentBlock > 1) {
                if ($block.hasClass("js-photo-lenta")) {
                    $nextB.removeClass("disabled-arrow-big");
                } else {
                    $nextB.removeClass("disabled-forward-arrow");
                }
                canMove = 0;
                currentMargin += w;

                $view.animate({ marginLeft: currentMargin }, function () {
                    canMove = 1;
                    currentBlock--;
                    if (currentBlock == 1) {
                        if ($block.hasClass("js-photo-lenta")) {
                            $prevB.addClass("disabled-arrow-big");
                        } else {
                            $prevB.addClass("disabled-back-arrow");
                        }
                    }
                });
            }

            event.stopImmediatePropagation();
        }));

    };


    //gallery
    (function () {
        var $gallery = $('.js-gallery');
        var $popupGallery = $('.js-popup-gallery');

        //slideToggle preview
        $gallery.on("click", ".js-gallery-preview-door", (function (e) {
            var $this = $(this);
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
        $gallery.on("click", ".js-gallery-item", (function (e) {
            var $this = $(this);
            var $wrap = $this.closest('.js-gallery');
            var $img = $wrap.find("img");
            var indexCurItem = $wrap.find('.js-gallery-item').index($this);

            var urls = [];

            $img.each(function (i) {
                if ($(this).data('url')) {
                    urls.push($(this).data('url'));
                }
            });

            if (urls.length) {
                ImageLoader({
                    list: urls
							, complete: function () {
							    var $photoLentaWrap = $popupGallery.find('.js-photo-lenta');
							    var $photoLenta = $photoLentaWrap.find('.js-lenta');
							    var $curB;

							    $photoLenta.empty();

							    for (var i = 0; i < urls.length; i++) {
							        var bidImg = '<span class="js-lenta-item"><img src="' + urls[i] + '" alt="" /></span>';
							        $photoLenta.append(bidImg);
							    };

							    $curB = $photoLenta.find('.js-lenta-item:first');

							    for (var i = 0; i < indexCurItem; i++) {
							        $nextB = $curB.next();
							        $curB = $nextB;
							        $photoLenta.append($nextB.prev().eq(0));
							    }

							    animateLentaHor($photoLentaWrap, 1);

							    $popupGallery.show();
							    $darkness.show();

							}
                });
            }

        }));

    })();


    //faq lenta promo
    (function () {
        var $faqLentaWrap = $(".js-faq-lenta");

        animateLentaHor($faqLentaWrap, 1);
    })();

    //promo
    (function () {
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

        function slideInCurrent($newSlide) {
            var $anons = $newSlide.find(".js-promo-item-anons");
            var $pic = $newSlide.find(".js-promo-item-pic");
            var $bg = $bgs.eq($items.index($newSlide));

            $newSlide.addClass('cur');

            $bg.fadeIn(2000);

            window.setTimeout(function () {
                $anons.animate({ top: 63, opacity: 1 }, 700, function () {
                    go = 1;
                    $itemCur = $newSlide;
                });
            }, 450);

            $pic.animate({ top: 0, opacity: 1 }, 1000, null);
        };

        function slideOutCurrent($newSlide) {
            var $anons = $itemCur.find(".js-promo-item-anons");
            var $pic = $itemCur.find(".js-promo-item-pic");
            var $bg = $bgs.eq($items.index($itemCur));

            $bg.fadeOut(1500);

            $anons.animate({ opacity: 0 }, 300, function () {
                $anons.css({ top: 385 });
            });

            $pic.animate({ opacity: 0 }, 300, function () {
                $pic.css({ top: -385 });
                $itemCur.removeClass('cur');
                slideInCurrent($newSlide);
            });
        };

        function changePage($page) {
            $page.addClass('cur').siblings().removeClass('cur');
        };


        function beginAnimate() {
            $slideTimer = setInterval(function () {
                var $next;

                if ($items.index($itemCur) == $items.index($itemLast)) {
                    $next = $itemFirst;
                } else {
                    $next = $itemCur.next();
                }

                changePage($pages.eq($items.index($next)));
                slideOutCurrent($next);

            }, 7000);
        };

        $promoWrap.on("click", ".js-promo-page", (function () {
            var $this = $(this);
            var index = $pages.index($this);

            if (!$this.is(".cur") && go) {
                go = 0;
                changePage($this)
                slideOutCurrent($items.eq(index));
                clearInterval($slideTimer);
                beginAnimate();
            }
        }));


        $promoWrap.on("click", ".js-promo-next", (function () {
            var $this = $(this);
            var $next = $itemCur.next();

            if ($items.index($itemCur) == $items.index($itemLast)) {
                $next = $itemFirst;
            }

            if (go) {
                go = 0;
                changePage($pages.eq($items.index($next)));
                slideOutCurrent($next);
                clearInterval($slideTimer);
                beginAnimate();
            }
        }));


        $promoWrap.on("click", ".js-promo-prev", (function () {
            var $this = $(this);
            var $prev = $itemCur.prev();

            if ($items.index($itemCur) == $items.index($itemFirst)) {
                $prev = $itemLast;
            }

            if (go) {
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
    (function () {
        var $list = $(".js-article-list");

        $list.on("click", ".b-article-list__item__arrow", (function (e) {
            var $this = $(this);
            var $sublist = $this.parent().parent().find(".js-article-list-sub");

            $this.parent().toggleClass("b-active");
            $sublist.slideToggle();

        }));
    })();

    //comment
    (function () {
        var $list = $(".js-comment-list");

        $list.on("click", ".js-comment-list-door", (function (e) {
            var $this = $(this);
            var $textWrap = $this.parent();

            var textNew = $this.data("change");
            var textDef = $this.text();

            $this.data('change', textDef).attr('data-change', textDef);
            $this.text(textNew);

            $textWrap.toggleClass("b-active");

        }));

        $(document).on('submit', 'form.b-comment__form', function (ev) {
            $form = $(this);
            $no = $form.find('._noempty');
            for (var i = 0; i < $no.length; ++i) {
                if ($no.eq(i).val() == "") {
                    ev.preventDefault();
                    break;
                }
            }

        });

    })();


    //map
    (function () {
        var $map = $(".js-country-map");

        $map.on("click", "area", (function (event) {
            changeState($(this), "b-active");
            event.preventDefault();
        }));
    })();
});

//
function authCheckErrors() {
    $('.popup_signup .b-form__error, .auth__signin__popup .b-form__error').each(function () {
        var $this = $(this);
        if ($this.text() != "") {
            $this.prev().find('input').addClass('b-form__field_error');
        }
    });
}

function callmeCheckErrors() {
    $('.popup_callme .b-form__error, .callme__popup .b-form__error').each(function () {
        var $this = $(this);
        if ($this.text() != "") {
            $this.prev().find('input').addClass('b-form__field_error');
        }
    });

    $(".popup_callme").on("click", ".js-popup-close", function() {
        window.location = "/";
    });
}