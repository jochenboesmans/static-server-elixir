defmodule StaticServerElixir.Router do
  @moduledoc false
  use Plug.Router

  # Serves all files in priv/static at `/route-to-file` with the best possible compression
  # depending on the `accept-encoding` header of the request.
  plug(Plug.Static,
    at: "/",
    from: {:static_server_elixir, "priv/static"},
    gzip: true,
    brotli: true
  )

  plug(:match)
  plug(:dispatch)

  # Serves index.html at the root route.
  # Route should be relative to release dir.
  get("/", do: send_file(conn, 200, "lib/static_server_elixir-0.1.0/priv/static/index.html"))
  match(_, do: send_resp(conn, 404, "Not found."))
end
