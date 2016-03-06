defmodule Bio.Ensembl.Gene do
  use Ecto.Model
  import Ecto.Query
  alias Bio.Repo

  @primary_key {:gene_id, :id, autogenerate: false}
  schema "gene" do
    field :biotype
    field :analysis_id, :integer
    belongs_to :seq_region, Bio.Ensembl.SeqRegion, references: :seq_region_id
    field :seq_region_start, :integer
    field :seq_region_end, :integer
    field :seq_region_strand, :integer
    belongs_to :display_xref, Bio.Ensembl.XRef, references: :xref_id
    field :source
    field :status
    field :description
    field :is_current, :boolean
    field :canonical_transcript_id, :integer
    field :stable_id
    field :version, :integer
    field :created_date, Ecto.DateTime
    field :modified_date, Ecto.DateTime
  end

  def from_name(name) do
    query = from xdb in Bio.Ensembl.ExternalDB,
            where: xdb.db_display_name == ^"HGNC Symbol",
            select: xdb.external_db_id
    hgnc_db = Repo.all(query)
    query = from x in Bio.Ensembl.XRef,
            where: x.external_db_id in ^hgnc_db,
            where: x.display_label == ^name,
            select: x.xref_id
    xrefs = Repo.all(query)
    query = from g in Bio.Ensembl.Gene,
            join: sr in assoc(g, :seq_region),
            where: g.status == "KNOWN",
            where: sr.name in ^Bio.chromosomes,
            where: g.display_xref_id in ^xrefs
    Repo.all(query)
  end
  def from_name!(name) do
    [found | rest] = from_name(name)
    cond do
      length(rest) > 1 -> 
        raise RuntimeError, message: "#{length(rest) + 1} genes found named #{name}"
      is_nil(found) -> 
        raise RuntimeError, message: "No gene found named #{name}"
      true ->
        found
    end
  end

end

