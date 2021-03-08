defmodule Counter.Repo do
  use Ecto.Repo,
    otp_app: :counter,
    adapter: Ecto.Adapters.MyXQL
end
