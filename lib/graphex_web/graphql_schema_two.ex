defmodule GraphexWeb.GraphqlSchemaTwo do
  use Absinthe.Schema

  alias GraphexWeb.FooResolver

  import_sdl("""
    type Query {
      "A list of links"
      all_links_two: [Link!]!
    }
    type Link {
      url: String!
      description: String!
    }
  """)

  def decorations(%{identifier: :all_links_two}, [%{identifier: :query} | _]) do
    {:resolve, &FooResolver.all_links/3}
  end

  def decorations(_node, _ancestors) do
    []
  end

  # object :link do
  #   field :url, non_null(:string)
  #   field :description, non_null(:string)
  # end

  # query do
  #   field :all_links, non_null(list_of(non_null(:link))) do
  #     resolve &FooResolver.all_links/3
  #   end
  # end
end
