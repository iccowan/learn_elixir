# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :walk_sat_interface,
  ecto_repos: [WalkSatInterface.Repo]

# Configures the endpoint
config :walk_sat_interface, WalkSatInterfaceWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "SHTBHVC7VBseCJcN4lpSteXealSKE5ms1+xz1CMraziaXuewIpUrKtdgLO7EUO0L",
  render_errors: [view: WalkSatInterfaceWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: WalkSatInterface.PubSub,
  live_view: [signing_salt: "wTt3czRl"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
