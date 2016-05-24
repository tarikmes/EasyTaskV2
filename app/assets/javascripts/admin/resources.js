 $(document).on('ready page:load', function () {
    $(function() {    
        $('#input-search').on('keyup', function() {
          var rex = new RegExp($(this).val(), 'i');
            $('.searchable-container .items').hide();
            $('.searchable-container .items').filter(function() {
                return rex.test($(this).text());
            }).show();
        });
    });



$(function() {
    var action;
    $(".number-spinner button").mousedown(function () {
        btn = $(this);
        input = btn.closest('.number-spinner').find('input');
        btn.closest('.number-spinner').find('button').prop("disabled", false);

      if (btn.attr('data-dir') == 'up') {
            action = setInterval(function(){
                if ( input.attr('max') == undefined || parseInt(input.val()) < parseInt(input.attr('max')) ) {
                    input.val(parseInt(input.val())+1);
                }else{
                    btn.prop("disabled", true);
                    clearInterval(action);
                }
            }, 50);
            return false;
      } else {
            action = setInterval(function(){
                if ( input.attr('min') == undefined || parseInt(input.val()) > parseInt(input.attr('min')) ) {
                    input.val(parseInt(input.val())-1);
                }else{
                    btn.prop("disabled", true);
                    clearInterval(action);
                }
            }, 50);
            return false;
      }
    }).mouseup(function(){
        clearInterval(action);
        return false;
    });
});




});
