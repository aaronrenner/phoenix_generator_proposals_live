defmodule DemoLiveApp.Repo do
  use Ecto.Repo,
    otp_app: :demo_live_app,
    adapter: Ecto.Adapters.Postgres
end
