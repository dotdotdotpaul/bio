defmodule Bio.Ensembl.ExternalDB.Test do
  use ExUnit.Case
  doctest Bio.Ensembl.ExternalDB
  alias Bio.Ensembl.ExternalDB
  alias Bio.Repo
  import Ecto.Query

  test "it works" do
    assert ExternalDB |> limit(1) |> Repo.one
  end

end
