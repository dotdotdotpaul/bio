defmodule Bio.Ensembl.Gene.Test do
  use ExUnit.Case
  doctest Bio.Ensembl.Gene
  alias Bio.Ensembl.Gene

  test "it can pull from the database" do
    result = Gene.from_name("EGFR")
    assert result
    assert length(result) == 1
    IO.inspect(result)
  end

end
