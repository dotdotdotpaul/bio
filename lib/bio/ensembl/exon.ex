defmodule Bio.Ensembl.Exon do
  use Ecto.Model
  import Ecto.Query

  @primary_key {:exon_id, :id, autogenerate: false}
  schema "exon" do
    belongs_to :seq_region, Bio.Ensembl.SeqRegion, references: :seq_region_id
    field :seq_region_start, :integer
    field :seq_region_end, :integer
    field :seq_region_strand, :integer
    field :phase, :integer
    field :end_phase, :integer
    field :is_current, :boolean
    field :is_constitutive, :boolean
    field :stable_id
    field :version, :integer
    field :created_date, Ecto.DateTime
    field :modified_date, Ecto.DateTime
  end
end

