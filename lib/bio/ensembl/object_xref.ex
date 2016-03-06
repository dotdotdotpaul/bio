defmodule Bio.Ensembl.ObjectXRef do
  use Ecto.Schema
  import Ecto.Query
  alias Bio.Repo
  alias Bio.Ensembl.ObjectXRef

  @primary_key { :object_xref_id, :id, autogenerate: false }
  schema "object_xref" do
    field :ensembl_id, :integer  # polymorphic belongs_to
    field :ensembl_object_type   # polymorphic belongs_to
    belongs_to :xref, Bio.Ensembl.XRef, references: :xref_id
    field :linkage_annotation
    field :analysis_id, :integer # Future belongs_to
  end

  def object(ox = %ObjectXRef{ensembl_object_type: "Gene"}) do
    Bio.Ensembl.Gene |> Repo.get(ox.ensembl_id)
  end
  
  def object(ox = %ObjectXRef{ensembl_object_type: "Transcript"}) do
    Bio.Ensembl.Transcript |> Repo.get(ox.ensembl_id)
  end
  
  def object(ox = %ObjectXRef{ensembl_object_type: "Translation"}) do
    Bio.Ensembl.Translation |> Repo.get(ox.ensembl_id)
  end

end

