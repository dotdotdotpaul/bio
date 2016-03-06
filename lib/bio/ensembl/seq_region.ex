defmodule Bio.Ensembl.SeqRegion do
  use Ecto.Model
  import Ecto.Query
  #alias Bio.Repo
  alias Bio.Ensembl.Slice

  @primary_key {:seq_region_id, :id, autogenerate: false}
  schema "seq_region" do
    field :name
    belongs_to :coord_system, Bio.Ensembl.CoordSystem, references: :seq_region_id
    field :length, :integer
    has_one :dna, Bio.Ensembl.DNA
  end

  def slice(region = %Bio.Ensembl.SeqRegion{}) do
    Slice.new(region)
  end


end

