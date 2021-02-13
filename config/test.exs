use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :api, Api.Endpoint,
  http: [port: 4004],
  server: false

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :admin, Admin.Endpoint,
  http: [port: 4005],
  server: false

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :db, DB.Repo,
  username: "steeve",
  password: "Mishibebe69",
  database: "two_shop_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox


# Print only warnings and errors during test
config :logger, level: :warn
