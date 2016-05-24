$(document).on('ready page:load', function () {
$("#task_parent_task_id").show();

$("#task_estimate").show()
    $('#task_is_parent').on('change', function() {
      if ( this.value == '1')
        {
          $("#task_parent_task_id").hide();

          $("#task_estimate").hide()
        }
        else
        {
          $("#task_parent_task_id").show();

          $("#task_estimate").show()
        }
    });


    $( "#resources_dd" ).change(function() {
  //console.log(gon.resources);

  var selectedResource = $(gon.resources).filter(function()
 {
     return this.id == $("#resources_dd").val();;
 }).first();

  $("#task_quantity").val(selectedResource[0].quantity)
});
});
