# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :dulivery,
  ecto_repos: [Dulivery.Repo]

# Configures the endpoint
config :dulivery, DuliveryWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "u8ANjFzNZorjUmC/xoU0HZiUvFGU4nFjPVgNug1XA93+DT6uumTIuXN/LQ4DB34D",
  render_errors: [view: DuliveryWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Dulivery.PubSub,
  live_view: [signing_salt: "9VlBJvF7"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
