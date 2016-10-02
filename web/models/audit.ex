defmodule Models.Audit do
  use Ecto.Model
  import Ecto.Query
  alias AuditApi.Repo

  @derive {Poison.Encoder, except: [:__meta__]}
  @primary_key {:id, :binary_id, autogenerate: true}
  schema "user" do
    # field :id
    field :email, :string
    field :status, :boolean
    field :openstack_id, :string
    field :name, :string 
    field :address, :string
    field :phone, :string
    field :phone_number, :string

    field :phone_verified, :boolean
    field :email_verified, :boolean
    field :payment_verified, :boolean

    field :created_at, Ecto.DateTime
    field :trial_started_at, Ecto.DateTime
    field :trial_expired_at, Ecto.DateTime
    field :level, :integer
    field :credit_balance, :float
    field :bill_day, :integer
    field :referral_code, :string
  end

  # get all data from db with pagination
  @spec all(map) :: list

  def all(params) do
    pages = __MODULE__ |> Query.Audit.filter(%Models.Audit{}, params, [:email, :status, 
        :openstack_id, :name, :address, :phone, :phone_number, :phone_verified, 
        :payment_verified, :created_at, :trial_started_at,:trial_expired_at, 
        :referral_code, :bill_day, :credit_balance, :level])
                       |> order_by([item], asc: item.created_at)
                       |> Repo.paginate(params)
    %{
      meta: %{
        total_records: pages.total_pages,
        page_size: pages.page_size,
        page: pages.page_number,
        page_count: pages.page_number
      },
      records: pages.entries
    }
  end


  def flush(email) do
    Helpers.Redis.flush(:erlang.whereis(Helpers.Redis),email)
    :ok
  end
end

