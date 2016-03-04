defmodule Bio.Sequence.NATest do
  use ExUnit.Case
  doctest Bio.Sequence.NA

  test "default initialization" do
    x = %Bio.Sequence.NA{}
    assert x.seq == ""
  end
  test "initialization with an argument" do
    x = %Bio.Sequence.NA{seq: "ACTG"}
    assert x.seq == "ACTG"
  end

  # reverse complementing
  test "accepts a single character" do
    assert Bio.Sequence.NA.reverse_complement("a") == "t"
  end
  test "accepts a string" do
    assert Bio.Sequence.NA.reverse_complement("actg") == "tgac"
  end
  test "accepts an NA struct" do
    x = %Bio.Sequence.NA{seq: "ACTG"}
    expected = %Bio.Sequence.NA{seq: "tgac"}
    assert Bio.Sequence.NA.reverse_complement(x) == expected
  end
  test "returns unmatched characters" do
    assert Bio.Sequence.NA.reverse_complement("acXgt") == "tgXca"
  end
end
