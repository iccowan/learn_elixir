defmodule WalkSatInterface.Repo do
  use Ecto.Repo,
    otp_app: :walk_sat_interface,
    adapter: Ecto.Adapters.Postgres
end
