$(document).on('ready page:load', function () {
$( ".delete-user" ).click(function() {
  alert( "Handler for .click() called." );

  id = $(this).attr("user-id");
  alert(id);
$.ajax({
           url: "/admin/users/" + id,
           type: "DELETE",
           data: {'id': id},
           success: function(response){
              alert('success');
            },
           error: function(response) {
                        alert('fail');
                      },
    });
     event.preventDefault();


  return false;
});
       });



