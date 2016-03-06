defmodule Bio.Codon.Test do
  use ExUnit.Case
  doctest Bio.Codon
  alias Bio.Codon

  test "converts from a three-base char list to a codon" do
    assert Codon.from_bases('tga') == '*'
  end
  test "converts case insensitively from three-base char list" do
    assert Codon.from_bases('ATG') == 'M'
  end
  test "converts longer char strings" do
    assert Codon.from_bases('atggcgcct') == 'MAP'
  end

  test "converts actual strings to strings" do
    assert Codon.from_bases("atg") == "M"
  end
  test "converts longer strings to strings" do
    assert Codon.from_bases("cctgcgatg") == "PAM"
  end

  test "drops remaining bases when not even" do
    assert Codon.from_bases("cctgcga") == "PA"
    assert Codon.from_bases("cc") == ""
  end

end
