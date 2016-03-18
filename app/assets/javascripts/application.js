// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery.min.js
//= require turbolinks
//= require bootstrap.min.js
//= require_tree .

function carregar_svg(){
  $('img.svg').each(function(){
    var $img = $(this);
    var imgID = $img.attr('id');
    var imgClass = $img.attr('class');
    var imgURL = $img.attr('src');

    $.get(imgURL, function(data) {
      var $svg = $(data).find('svg');
      if (typeof imgID !== 'undefined') { $svg = $svg.attr('id', imgID); }
      if (typeof imgClass !== 'undefined') { $svg = $svg.attr('class', imgClass+' replaced-svg'); }
      $svg = $svg.removeAttr('xmlns:a');
      $img.replaceWith($svg);
    });
  });
}
