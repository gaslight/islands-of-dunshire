defmodule IslandsOfDunshire.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false
  import Supervisor.Spec

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Starts a worker by calling: IslandsOfDunshire.Worker.start_link(arg)
      # {IslandsOfDunshire.Worker, arg},
      worker(GuessAgent, [], restart: :permanent)
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: IslandsOfDunshire.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
