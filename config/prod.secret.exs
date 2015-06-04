use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :greedo, Greedo.Endpoint,
  secret_key_base: "4jDvsZgg+ekURvZ9zH4mXr9SAkxKUZKJqGz78JtvVK/WHqM3zmk8OgA9qlAnEB5J"

# Configure your database
config :greedo, Greedo.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "greedo_prod"
