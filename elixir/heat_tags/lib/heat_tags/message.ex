defmodule HeatTags.Message do
  use Ecto.Schema

  import Ecto.Changeset

  @require_params [:message, :username, :email]

  @derive {Jason.Encoder, only: [:id] ++ @require_params}

  schema "messages" do
    field(:message, :string)
    field(:username, :string)
    field(:email, :string)

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @require_params)
    |> validate_required(@require_params)
    |> validate_length(:message, min: 1, max: 140)
    |> validate_format(:email, ~r/@/)
  end
end
