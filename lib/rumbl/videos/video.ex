defmodule Rumbl.Videos.Video do
  # use Ecto.Schema
  # import Ecto.Changeset
  use RumblWeb, :model

  alias Rumbl.Videos.Video


  use RumblWeb, :model


  schema "videos" do
    field :description, :string
    field :title, :string
    field :url, :string
    # field :user_id, :id

    belongs_to :user, Rumbl.User 
    belongs_to :category, Rumbl.Videos.Category 

    timestamps()
  end

  @doc false
  def changeset(%Video{} = video, attrs) do
    video
    |> cast(attrs, [:url, :title, :description])
    |> validate_required([:url, :title, :description])
  end
end
