defmodule MicroErp.Repo do
  use Ecto.Repo,
    otp_app: :micro_erp,
    adapter: Ecto.Adapters.SQLite3
end
