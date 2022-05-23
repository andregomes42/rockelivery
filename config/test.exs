use Mix.Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :rockelivery, Rockelivery.Repo,
  username: "inciclemaster",
  password: "incicle-pass",
  database: "rockelivery",
  hostname: "localhost",
  port: "55432",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

# Configure the database for Github Actions
if System.get_env("GITHUB_ACTIONS") do
  config :app, Rockelivery.Repo
    username: "postgres",
    password: "postgres"
end

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :rockelivery, RockeliveryWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
