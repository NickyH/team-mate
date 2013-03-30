// $().ready(function() {
//   $('#ex2').jqm({ajax: 'users/new', trigger: 'a.ex2trigger'});
//   $( ".draggable" ).draggable();
//   $( "#droppable" ).droppable({ drop: Drop });

// });

// function cancel_login_form()
// {
//   $('#drop').removeClass('open').attr("style", "");
//   $('#email').val("");
//   $('#password').val("");
// }

// function Drop(event, ui) {
//   var user_id = ui.draggable.find("img").attr("id");
//   var game_id = $('.game').data('game-id');
//   var token = $('#droppable').data('auth-token');
//   $(this)
//     .addClass("ui-state-highlight")
//     .find("p")
//     .html("Players added!");
//   $.ajax({
//      dataType: 'script'
//      type: 'post'
//      url: "/games/invite_player"
//      data: {authenticity_token:token, user_id:user_id, game_id:game_id}
//     }).done();
// }


 // $.ajax({
 //      dataType: 'json',
 //      type: "POST",
 //      url: "/addplayer",
 //      data: {user_id:id}
 //  }).done(function( msg ) {
 //    alert( "Data Saved: " + msg );
 //  });

 // ({
 //      drop: function( event, ui ) {
 //        $( this )
 //          .addClass( "ui-state-highlight" )
 //          .find( "p" )
 //            .html( "Players added!" );
 //            var draggableId = .draggable.ui-widget-content.attr("id");
 //            console.log(draggableId);
 //            // update_status(id);
 //            // team.push(this.data(id))
 //            // ajax({
 //            //   url: sendmessage/
 //            //   data: { user_ids: team}
 //            // })
 //      }
 //    });