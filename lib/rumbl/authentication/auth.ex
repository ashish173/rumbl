defmodule Rumbl.Auth do
  import Plug.Conn
  require Logger

  def init(opts) do
    Keyword.fetch!(opts, :repo)
  end

  def call(conn, repo) do
    Logger.debug "CONN IN CALL #{inspect conn}"
    user_id = get_session(conn, :user_id)
    user    = user_id && repo.get_v(Rumbl.User, user_id)
    Logger.debug "USER IN CALL #{inspect user}"
    assign(conn, :current_user, user)
  end

  def login(conn, user) do
    # IO.puts "User logging in #{user}"
    Logger.debug "USER IN LOGIN #{inspect user}"
    conn
    |> assign(:current_user, user)
    |> put_session(:user_id, user.id)
    # |> configure_session(renew: true) 
    Logger.debug "CONN AFTER SET #{inspect conn}"
    conn
  end
end