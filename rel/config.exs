Path.join(["rel", "plugins", "*.exs"])
|> Path.wildcard()
|> Enum.map(&Code.eval_file(&1))

use Mix.Releases.Config,
    default_release: :default,
    default_environment: Mix.env()

environment :dev do
  set dev_mode: true
  set include_erts: false
  set cookie: :"nomnomnom"
end

environment :prod do
  set include_erts: true
  set include_src: false
  set cookie: :"nomnomnom"
end

release :kv_umbrella do
  set version: "0.1.0"
  set applications: [
    :runtime_tools,
    kv: :permanent,
    kv_server: :permanent
  ]
end

