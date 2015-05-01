defmodule Elixirdocker.Mixfile do
  use Mix.Project

  def project do
    [app: :elixirdocker,
     version: "0.0.1",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [ mod: { Elixirdocker, [] },
      applications: [:cowboy, :ranch, :logger] ]
  end

  defp deps do
    [ { :cowboy, "1.0.0" } ]    
  end
end
