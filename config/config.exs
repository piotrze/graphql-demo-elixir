# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :graphex,
  ecto_repos: [Graphex.Repo]

# Configures the endpoint
config :graphex, GraphexWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "nIiS5vo2fxZc9qVX6ihxzO1F7ZszYU/94XgngxYM8Zy5fbhoQaIrez5ZLeZbAGLK",
  render_errors: [view: GraphexWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Graphex.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
