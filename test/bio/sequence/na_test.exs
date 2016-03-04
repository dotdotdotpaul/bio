defmodule Bio.Sequence.NA.Test do
  use ExUnit.Case
  doctest Bio.Sequence.NA
  alias Bio.Sequence.NA

  # forward complementing
  test "accepts a single character" do 
    assert NA.complement('c') == 'g'
  end
  test "accepts a single bitstring character" do
    assert NA.complement("a") == "t"
  end
  test "accepts multiple bitstring characters" do
    assert NA.complement('actg') == 'tgac'
  end
  test "accepts a string" do
    assert NA.complement("actg") == "tgac"
  end
  test "returns unmatched characters" do
    assert NA.complement("acXgt") == "tgxca"
  end
end

defmodule Bio.Sequence.Reverse.NA.Test do
  use ExUnit.Case
  doctest Bio.Sequence.NA
  alias Bio.Sequence.NA

  # reverse complementing
  test "accepts a string" do
    assert NA.reverse_complement("actg") == "cagt"
  end
  test "accepts multiple characters" do
    assert NA.reverse_complement('actg') == 'cagt'
  end
end
