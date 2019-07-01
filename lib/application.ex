defmodule StaticServerElixir.Application do
  @moduledoc false
  use Application

  def start(_type, _args) do
		# Customize port in config.exs.
		cfg_port = Application.get_env(:static_server_elixir, :port)
    children = [
      {Plug.Cowboy, scheme: :http, plug: StaticServerElixir.Router, options: [port: cfg_port]}
    ]
    options = [
      # In case of multiple children, all will be restarted when one crashes.
      strategy: :one_for_all,
      name: __MODULE__
    ]
    Supervisor.start_link(children, options)
  end
end
