defmodule StaticServerElixir.MixProject do
  use Mix.Project

  def project do
    [
      app: :static_server_elixir,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {StaticServerElixir.Application, []}
    ]
  end

  defp deps do
    [
      {:plug_cowboy, "~> 2.1"},
      {:distillery, "~> 2.0", [runtime: false]}
    ]
  end
end
