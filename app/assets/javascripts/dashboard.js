if ($('.morris-area-chart').length) {
  Morris.Area({
    element: 'morris-area-chart',
    data: [{
      period: '2010',
      iphone: 0,
      ipad: 0,
      itouch: 0
    }, {
      period: '2011',
      iphone: 75,
      ipad: 65,
      itouch: 30
    }, {
      period: '2012',
      iphone: 32,
      ipad: 22,
      itouch: 12
    }, {
      period: '2013',
      iphone: 75,
      ipad: 65,
      itouch: 30
    }, {
      period: '2014',
      iphone: 32,
      ipad: 22,
      itouch: 12
    }, {
      period: '2015',
      iphone: 75,
      ipad: 65,
      itouch: 30
    }, {
      period: '2016',
      iphone: 0,
      ipad: 0,
      itouch: 0
    }],
    xkey: 'period',
    ykeys: ['iphone', 'ipad', 'itouch'],
    labels: ['iPhone', 'iPad', 'iPod Touch'],
    pointSize: 0,
    fillOpacity: 0.9,
    pointStrokeColors: ['#e7e8ef', '#51e4ff', '#16198d'],
    behaveLikeLine: true,
    gridLineColor: '#eef0f2',
    lineWidth: 0,
    hideHover: 'auto',
    lineColors: ['#e7e8ef', '#51e4ff', '#16198d'],
    resize: true

  });
};

$('.vcarousel').carousel({ interval: 3000 });


$(function() {
  $(window).bind("load resize", function() {
    topOffset = 50;
    width = (this.window.innerWidth > 0) ? this.window.innerWidth : this.screen.width;
    if (width < 768) {
      $('div.navbar-collapse').addClass('collapse');
      topOffset = 100; // 2-row-menu
    } else {
      $('div.navbar-collapse').removeClass('collapse');
    }

    height = ((this.window.innerHeight > 0) ? this.window.innerHeight : this.screen.height) - 1;
    height = height - topOffset;
    if (height < 1) height = 1;
    if (height > topOffset) {
      $("#page-wrapper").css("min-height", (height) + "px");
    }
  });

  if($(".tinymce").length > 0){
   tinymce.init({
     selector: "textarea.tinymce",
     theme: "modern",
     height:300,
     plugins: [
     "advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker",
     "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
     "save table contextmenu directionality emoticons template paste textcolor"
     ],
     toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | l      ink image | print preview media fullpage | forecolor backcolor emoticons",

   });
  }

  var url = window.location;
  var element = $('ul.nav a').filter(function() {
    return this.href == url || url.href.indexOf(this.href) == 0;
  }).addClass('active').parent().parent().addClass('in').parent();
  if (element.is('li')) {
    element.addClass('active');
  }
});

$(function() {
  $(window).bind("load resize", function() {
    width = (this.window.innerWidth > 0) ? this.window.innerWidth : this.screen.width;
    if (width < 1025) {
      $('body').addClass('content-wrapper');
      $(".open-close i").removeClass('icon-arrow-left-circle');
      $(".logo span").hide();
    } else {
      $('body').removeClass('content-wrapper');
      $(".open-close i").addClass('icon-arrow-left-circle');
      $(".logo span").show();
    }
  });


});

$(document).ready(function() {
  // Sidebar open close
  $(".open-close").click(function() {
    $(".open-close i").toggleClass("icon-arrow-left-circle");
    $(".logo span").toggle();
    $("body").toggleClass("content-wrapper");
  });

  // Collapse Panels

  (function($, window, document) {
    var panelSelector = '[data-perform="panel-collapse"]';

    $(panelSelector).each(function() {
      var $this = $(this),
        parent = $this.closest('.panel'),
        wrapper = parent.find('.panel-wrapper'),
        collapseOpts = { toggle: false };

      if (!wrapper.length) {
        wrapper =
          parent.children('.panel-heading').nextAll()
          .wrapAll('<div/>')
          .parent()
          .addClass('panel-wrapper');
        collapseOpts = {};
      }
      wrapper
        .collapse(collapseOpts)
        .on('hide.bs.collapse', function() {
          $this.children('i').removeClass('ti-minus').addClass('ti-plus');
        })
        .on('show.bs.collapse', function() {
          $this.children('i').removeClass('ti-plus').addClass('ti-minus');
        });
    });
    $(document).on('click', panelSelector, function(e) {
      e.preventDefault();
      var parent = $(this).closest('.panel');
      var wrapper = parent.find('.panel-wrapper');
      wrapper.collapse('toggle');
    });
  }(jQuery, window, document));




  var elems = Array.prototype.slice.call(document.querySelectorAll('.js-switch'));
  $('.js-switch').each(function() {
    new Switchery($(this)[0], $(this).data());

  });
  //Nicescroll
  $(".sidebar").niceScroll({ cursorcolor: '#ccc', cursorwidth: '5px', cursorborderradius: '0px' });

});
