defmodule Bio.Ensembl.Translation do
  use Ecto.Model
  import Ecto.Query

  @primary_key {:translation_id, :id, autogenerate: false}
  schema "translation" do
    belongs_to :transcript, Bio.Ensembl.Transcript, references: :transcript_id
    field :seq_start, :integer
    belongs_to :start_exon, Bio.Ensembl.Exon, references: :exon_id
    field :seq_end, :integer
    belongs_to :end_exon, Bio.Ensembl.Exon, references: :exon_id
    field :stable_id
    field :version, :integer
    field :created_date, Ecto.DateTime
    field :modified_date, Ecto.DateTime
  end
end

