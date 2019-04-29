# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :live_chat,
  ecto_repos: [LiveChat.Repo]

# Configures the endpoint
config :live_chat, LiveChatWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "rHmr6ERlssWw3xpkcmFgcy+IduhZOF8V2NN7ReqiC3o5zIYZQTpPJ+5viFAO7cBr",
  render_errors: [view: LiveChatWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: LiveChat.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "OR3+pUjjTmnG9LX605bGwidZWr0bf/mi"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Live View
config :phoenix, :template_engines, leex: Phoenix.LiveView.Engine

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
