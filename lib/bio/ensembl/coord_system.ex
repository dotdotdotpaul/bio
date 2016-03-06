defmodule Bio.Ensembl.CoordSystem do
  use Ecto.Model
  import Ecto.Query
  #alias Bio.Repo

  @primary_key {:coord_system_id, :id, autogenerate: false}
  schema "coord_system" do
    field :species_id, :integer # Eventually a belongs_to
    field :name
    field :version
    field :rank, :integer
    field :attrib
  end


end

