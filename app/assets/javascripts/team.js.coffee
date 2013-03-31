class Home
  @document_ready: ->
    $('#form').on('click', 'a[data-clear-form]', Home.clear_form)
    $('#teamlist').on('click', 'a[data-select-team]', Home.select_team)
    $("a.reveal-link").trigger "click"
    $(".draggable").draggable();
    $("#droppable").droppable({ drop: Drop = (event, ui) ->
      user_id = ui.draggable.find("img").attr("id")
      game_id = $(".game").data("game-id")
      token = $("#droppable").data("auth-token")
      console.log(user_id, game_id, token)
      $(this).addClass("ui-state-highlight").find("p").html "Players added!"
      $.ajax(
        dataType: "script"
        type: "post"
        url: "/games/invite_player"
        data:
          authenticity_token: token
          user_id: user_id
          game_id: game_id
      ).done()
     });

  @clear_form: (e) ->
    e.preventDefault()
    $('#form').empty()

  @select_team: (e) ->
    e.preventDefault()
    team = $(this).data('select-team')
    select_team =
      dataType: 'script'
      type: 'get'
      url: '/teams/select_team'
      data: {team_name: team}
    $.ajax(select_team)


$(document).ready(Home.document_ready)



