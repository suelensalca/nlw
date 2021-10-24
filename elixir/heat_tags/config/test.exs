import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :heat_tags, HeatTags.Repo,
  username: "postgres",
  password: "docker",
  database: "heat_tags_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "127.0.0.1",
  port: "5432",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :heat_tags, HeatTagsWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "wUeu3FNvw7x9jF/VIQBdd5QBu4Ramcw2XPG3UC+A1pgpdd6MfD873vx2IXhxaNl/",
  server: false

# In test we don't send emails.
config :heat_tags, HeatTags.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
