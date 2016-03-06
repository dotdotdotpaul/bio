defmodule Bio.Ensembl.DNA do
  use Ecto.Model
  import Ecto.Query

  # DNA contains, well, DNA sequences.  This table maps 1-1 with the
  # SeqRegion data but ONLY for SeqRegion data that is from the "contig"
  # CoordSystem.

  @primary_key false
  schema "dna" do
    field :sequence
    belongs_to :seq_region, Bio.Ensembl.SeqRegion, references: :seq_region_id
  end

end
    
