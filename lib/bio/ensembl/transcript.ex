defmodule Bio.Ensembl.Transcript do
  use Ecto.Model
  import Ecto.Query

  @primary_key {:transcript_id, :id, autogenerate: false}
  schema "transcript" do
    belongs_to :gene, Bio.Ensembl.Gene, references: :gene_id
    field :analysis_id, :integer # future belongs_to.
    belongs_to :seq_region, Bio.Ensembl.SeqRegion, references: :seq_region_id
    field :seq_region_start, :integer
    field :seq_region_end, :integer
    field :seq_region_strand, :integer
    belongs_to :display_xref, Bio.Ensembl.XRef, references: :xref_id
    field :source
    field :biotype
    field :status
    field :description
    field :is_current, :boolean
    belongs_to :canonical_translation, Bio.Ensembl.Translation, references: :translation_id
    field :created_date, Ecto.DateTime
    field :modified_date, Ecto.DateTime

    has_many :translations, Bio.Ensembl.Translation, foreign_key: :transcript_id
  end

end

