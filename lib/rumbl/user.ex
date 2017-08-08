defmodule Rumbl.User do
  use RumblWeb, :model

  schema "users" do
    field :name,          :string
    field :username,      :string
    field :password,      :string, virtual: true
    field :password_hash, :string

    timestamps
  end

  #CHANGE: Passing :empty is deprecated, use :invalid instead
  def changeset(model, params \\ :invalid) do
    model
    #CHANGE: cast/4 is deprecates, use cast/3 like below
    |> cast(params, [:name, :username])
    #CHANGE: Use validate required for presence
    |> validate_required([:name, :username])
    |> validate_length(:username, min: 1, max: 20)
  end
end