window.app =
  document_ready: ->
    $('#form').on('click', 'a[data-clear-form]', app.clear_form)
    $('#teamlist').on('click', 'a[data-select-team]', app.select_team)
    $("a.reveal-link").trigger "click"
    app.make_drag_drop()

  make_drag_drop: ->
    $(".draggable").draggable()
    $("#droppable").droppable({ drop: (event, ui) ->

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
      )
    })

  clear_form: (e) ->
    e.preventDefault()
    $('#form').slideUp()

  select_team: (e) ->
    e.preventDefault()
    team = $(this).data('select-team')
    settings =
      dataType: 'script'
      type: 'get'
      url: '/teams/select_team'
      data: {team_name: team}
    $.ajax(settings)

$(document).ready(app.document_ready)
