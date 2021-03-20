defmodule WalkSatInterface.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      WalkSatInterface.Repo,
      # Start the Telemetry supervisor
      WalkSatInterfaceWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: WalkSatInterface.PubSub},
      # Start the Endpoint (http/https)
      WalkSatInterfaceWeb.Endpoint
      # Start a worker by calling: WalkSatInterface.Worker.start_link(arg)
      # {WalkSatInterface.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: WalkSatInterface.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    WalkSatInterfaceWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
