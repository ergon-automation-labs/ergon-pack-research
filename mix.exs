defmodule ErgonPackResearch.MixProject do
  use Mix.Project

  @version "0.1.0"

  def project do
    [
      app: :ergon_pack_research,
      version: @version,
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      releases: [
        research_pack: [
          applications: [
            bot_army_library_runtime: :permanent,
            bot_army_library_core: :permanent,
            bot_army_library_learning: :permanent,
            bot_army_feeds: :permanent,
            bot_army_rss_polling: :permanent,
            ergon_pack_research: :permanent
          ]
        ]
      ]
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {ErgonPackResearch.Application, []}
    ]
  end

  defp deps do
    [
      {:bot_army_library_core, path: "../bot_army_library_core"},
      {:bot_army_library_runtime, path: "../bot_army_library_runtime"},
      {:bot_army_library_learning, path: "../bot_army_library_learning"},
      {:bot_army_feeds, path: "../bot_army_feeds"},
      {:bot_army_rss_polling, path: "../bot_army_rss_polling"}
    ]
  end
end
