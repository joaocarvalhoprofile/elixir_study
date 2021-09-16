defmodule Dulivery.Repo do
  use Ecto.Repo,
    otp_app: :dulivery,
    adapter: Ecto.Adapters.Postgres
end
