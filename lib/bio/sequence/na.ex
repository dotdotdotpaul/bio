defmodule Bio.Sequence.NA do
  require Bio.Util

  def complement(bases) when is_bitstring(bases) do
    for << base <- bases >> do
      complement(base)
    end |> to_string
  end
  def complement(bases) when length(bases) > 1 do
    Enum.map(bases, &(complement(&1)))
  end
  def complement(base) when is_integer(base) do
    complement([base]) |> List.first
  end

  @complements Bio.Util.complement_zip('atgcrymkdhvbswn','tacgyrkmhdbvswn')
  def complements, do: @complements
  def complement(base) do
    @complements[base] || base
  end

  def reverse_complement(bases) when is_bitstring(bases) do
    complement(bases)
    |> String.reverse
  end
  def reverse_complement(bases) when is_list(bases) do
    complement(bases)
    |> Enum.reverse
  end


end

