defmodule RumblWeb.UserController do
  use RumblWeb, :controller

  alias Rumbl.Repo
  alias Rumbl.User

  def index(conn, _params) do
    # users = Repo.all_v(Rumbl.User)
    users = Repo.all(Rumbl.User)
    render conn, "index.html", users: users
  end

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, "new.html", changeset: changeset
  end

  def show(conn, %{"id" => id}) do
    user = Repo.get(Rumbl.User, id)
    render conn, "show.html", user: user
  end
end