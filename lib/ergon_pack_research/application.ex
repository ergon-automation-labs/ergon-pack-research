defmodule ErgonPackResearch.Application do
  @moduledoc """
  Research pack supervisor.

  Starts a single Health.Responder for the entire VM when in pack mode.
  """
  use Application

  @version Mix.Project.config()[:version]

  @impl true
  def start(_type, _args) do
    children =
      if Application.get_env(:bot_army_library_runtime, :pack_mode, false) do
        [
          {BotArmyRuntime.Health.Responder, [bot_name: :research_pack, version: @version]}
        ]
      else
        []
      end

    opts = [strategy: :one_for_one, name: ErgonPackResearch.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
