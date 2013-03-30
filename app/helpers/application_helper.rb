module ApplicationHelper
  def is_admin
    @auth.present? && @auth.is_admin
  end

  def intellinav
    links=""
    if @auth.present?

      if @auth.is_admin
        links += "<li>#{link_to('Show users', users_path)}</li>"
      else
        links += "<li class='has-flyout'>
        <a href='/teams'>Team</a>
        <a href='#' class='flyout-toggle'><span> </span></a>
        <ul class='flyout' style='display: none; '>
        <li>#{link_to('New Team', new_team_path)}</li>"
          @auth.teams.order(:name).each do |team|
            links += "<li>#{link_to(team.name, team)}</li>"
            end
          links += "</ul></li>"
          links += "<li class='has-flyout'>
          <a href='/teams'>Teams</a>
          <a href='#' class='flyout-toggle'><span> </span></a>
          <ul class='flyout' style='display: none; '>
          <li>#{link_to('All Teams', teams_path)}</li>"
          @auth.teams.order(:name).each do |team,|
            links += "<li>#{link_to(team.name, team)}</li>"
            end
            links += "</ul></li>"
      end
      links += "<li>#{link_to('Edit', edit_users_path)}</li>"
      links += "<li>#{link_to(@auth.name, login_path, :method => :delete, :confirm => "Logout?")}</li>"
    else
      "<li>#{link_to('Create Account', new_user_path)}</li>" +
      "<li>#{link_to('Login', login_path)}</li>"
      # "<li>#{link_to('Albums', albums_path)}</li>" +
      # "<li>#{link_to('Genres', genres_path)}</li>" +
      # "<li>#{link_to('Artists', artists_path)}</li>"
    end
  end
end