window.addEventListener('DOMContentLoaded', function(){

  //画面がロードされてからイベントを発生
 
   $('#preview').on('click', function() {
     var content = $('#mark-down-area').val();
 
     $.ajax({
       url: '/api/articles/preview',
       dataType: 'json',
      type: 'GET',
       data: { body: content }
     })
     .done(function(html) {
 
       $('#preview-area').toggleClass("open");
       $('#preview-area').append(html.body);
 
       $('#markdown').fadeToggle();
       $('#preview').fadeToggle();
     })
     .fail(function() {
       alert('プレビューを表示できませんでした。');
     })
   })
 
 
   $('#markdown').on('click', function() {
     $('#preview-area').empty();
     $('#preview-area').toggleClass("open");
     $('#preview').fadeToggle();
     $('#markdown').fadeToggle();
   })
 });
 