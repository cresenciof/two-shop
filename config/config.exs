# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config

  # Configure Mix tasks and generators
config :db,
  namespace: DB,
  ecto_repos: [DB.Repo]

config :api,
  ecto_repos: [DB.Repo],
  generators: [context_app: :db]


# Configures the endpoint
config :api, Api.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "zeXX2zWD/IhxTpc5Rtu2ZTCHaFZfw4gjheqG3iP1UEgHPinXbxNxq7VEL1fK0YxN",
  render_errors: [view: Api.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Api.PubSub,
  live_view: [signing_salt: "l64gR57J"]

config :admin,
  ecto_repos: [DB.Repo],
  generators: [context_app: :db]

# Configures the endpoint
config :admin, Admin.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "1ezRNAzVP3xkTvi8/wsbVBrLcFkBgVMAUlum2n/v0lTwcs/U8wIOw2sSHZj7rAtB",
  render_errors: [view: Admin.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Admin.PubSub,
  live_view: [signing_salt: "piGgCCJS"]

# Configure Mix tasks and generators

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
