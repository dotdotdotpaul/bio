defmodule Bio.Ensembl.XRef do
  use Ecto.Model
  #import Ecto.Query
  #alias Bio.Repo

  @primary_key {:xref_id, :id, autogenerate: false}
  schema "xref" do
    belongs_to :external_db, Bio.Ensembl.ExternalDB, references: :external_db_id
    field :dbprimary_acc
    field :display_label
    field :version
    field :description
    field :info_type
    field :info_text

    has_many :genes, Bio.Ensembl.Gene, foreign_key: :display_xref_id
  end


end

