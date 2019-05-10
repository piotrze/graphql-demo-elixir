defmodule GraphexWeb.GraphqlSchemaStatic do
  use Absinthe.Schema
  alias GraphexWeb.FooResolver
  import_types GraphexWeb.GraphTypes

  query do
    field :all_links, non_null(list_of(non_null(:link))) do
      resolve &FooResolver.all_links/3
    end
  end

  subscription do
    field :links_feed, :link do
      config fn _, _ ->
        {:ok, topic: true}
      end
    end
  end
end
