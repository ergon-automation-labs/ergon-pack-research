import Config

config :bot_army_library_runtime, :pack_mode, true

config :bot_army_feeds, :start_repo, true
config :bot_army_rss_polling, :start_repo, true

import_config "#{config_env()}.exs"