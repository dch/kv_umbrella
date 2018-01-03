all:
	mix do deps.get, deps.compile, compile
	env MIX_ENV=prod mix release --env=prod
	_build/prod/rel/kv_umbrella/bin/kv_umbrella console
