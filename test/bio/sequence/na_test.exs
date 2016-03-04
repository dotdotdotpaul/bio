defmodule Bio.Sequence.NATest do
  use ExUnit.Case
  doctest Bio.Sequence.NA

  # forward complementing
  test "accepts a single character" do 
    assert Bio.Sequence.NA.complement('c') == 'g'
  end
  test "accepts a single bitstring character" do
    assert Bio.Sequence.NA.complement("a") == "t"
  end
  test "accepts a string" do
    assert Bio.Sequence.NA.complement("actg") == "tgac"
  end
  test "returns unmatched characters" do
    assert Bio.Sequence.NA.complement("acXgt") == "tgxca"
  end
end
