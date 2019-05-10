defmodule GraphexWeb.FooResolver do

  def all_links(_root, _args, _info) do
    links = [
      %{ url: 'wp.pl', descripion: "wp portal"},
      %{ url: 'google.com', descripion: "search"}
    ]
    {:ok, links}
  end
end
