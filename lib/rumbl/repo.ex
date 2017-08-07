defmodule Rumbl.Repo do
  use Ecto.Repo, otp_app: :rumbl

  

  @doc """
  Dynamically loads the repository url from the
  DATABASE_URL environment variable.
  """
  def init(_, opts) do
    {:ok, Keyword.put(opts, :url, System.get_env("DATABASE_URL"))}
  end

  def all_v(Rumbl.User) do 
    [%Rumbl.User{id: "1", name: "Ashish", username: "ashish123", password: "elixir"},
     %Rumbl.User{id: "2", name: "Pankaj", username: "pankaj123", password: "elixir"},
     %Rumbl.User{id: "3", name: "Kartik", username: "kartik123", password: "elixir"},
     %Rumbl.User{id: "4", name: "Chandu", username: "chandu123", password: "elixir"}]
  end

  def all_v(_module), do: []

  def get_v(module, id) do
    Enum.find all_v(module), fn map -> map.id == id end 
  end

  def get_by_v(module, params) do 
    Enum.find all_v(module), fn map ->
      Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end)
    end 
  end
end
