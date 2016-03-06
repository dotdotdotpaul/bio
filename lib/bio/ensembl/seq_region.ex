defmodule Bio.Ensembl.SeqRegion do
  use Ecto.Model
  import Ecto.Query
  #alias Bio.Repo

  @primary_key {:seq_region_id, :id, autogenerate: false}
  schema "seq_region" do
    field :name
    belongs_to :coord_system, Bio.Ensembl.CoordSystem, references: :seq_region_id
    field :length, :integer
  end


end

