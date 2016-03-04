defmodule Bio.Sequence.NA do
  def complement(bases) when is_bitstring(bases) do
    for << base <- String.downcase(bases) >> do
      complement(base)
    end |> to_string
  end
  def complement(bases) when length(bases) > 1 do
    Enum.map(bases, &(complement(&1)))
  end
  def complement(base) when is_integer(base) do
    complement([base]) |> List.first
  end
  def complement(base) do
    #  atgcrymkdhvbswn
    #  tacgyrkmhdbvswn
    %{ 'a' => 't', 't' => 'a',
       'c' => 'g', 'g' => 'c',
       'r' => 'y', 'y' => 'r',
       'm' => 'k', 'k' => 'm',
       'd' => 'h', 'h' => 'd',
       'v' => 'b', 'b' => 'v',
       's' => 's', 'w' => 'w', 'n' => 'n',
       'u' => 'a'
     }[base] || base
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

