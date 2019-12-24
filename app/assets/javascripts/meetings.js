$(document).on("turbolinks:load", function(){
  $('#meetings').click(function(event){
    $(this).addClass("active");
    $('#calendars').removeClass("active");
    var cont = []
    $('.table').find('a').each(function(){
      var value = $(this).text();
      var link = $(this).attr('href');
      cont.push('<tr><td>' + '<a href=' + link + ' >' + value + '</a>' + '</td></tr>')
      event.preventDefault();
      ($('#calendar').html(cont));
    });
    
  });

  $("#calendars").click(function(){
    $(this).addClass('active');
    $('#meetings').removeClass('active');
  })
});