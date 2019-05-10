defmodule GraphexWeb.GraphTypes do
  use Absinthe.Schema.Notation

  object :link do
    field :url, non_null(:string)
    field :description, non_null(:string)
  end
end
