defmodule Bio.Ensembl.ExternalDB do
  use Ecto.Schema

  @primary_key {:external_db_id, :id, autogenerate: false}
  schema "external_db" do
    field :db_name
    field :db_release
    field :status
    field :priority, :integer
    field :db_display_name
    field :type
    field :secondary_db_name
    field :secondary_db_table
    field :description
    has_many :xrefs, Bio.Ensembl.XRef
  end

end

