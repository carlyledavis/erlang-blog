defmodule Blog.Mixfile do
  use Mix.Project

  def project do
    [app: :blog,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [applications: [:logger, :cowboy, :poison, :plug]]
  end

  defp deps do
    [{:cowboy, "~> 1.0.0"},
    {:plug, "~> 1.0"},
    {:poison, "~> 3.0"}]
  end
end
