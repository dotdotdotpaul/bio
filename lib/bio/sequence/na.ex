defmodule Bio.Sequence.NA do
  defstruct seq: ""

  def reverse_complement(na = %Bio.Sequence.NA{}) do
    %Bio.Sequence.NA{na | seq: reverse_complement(na.seq)}
  end
  def reverse_complement(bases) do
    bases
    |> to_char_list
    |> Enum.map(fn(x) -> reverse_complement_one_base(x) end)
    |> to_string
  end

  def reverse_complement_one_base(base) when is_integer(base) do
    reverse_complement_one_base(to_string [base])
  end
  def reverse_complement_one_base(base) do
    #  atgcrymkdhvbswn
    #  tacgyrkmhdbvswn
    %{ "a" => "t", "t" => "a",
       "c" => "g", "g" => "c",
       "r" => "y", "y" => "r",
       "m" => "k", "k" => "m",
       "d" => "h", "h" => "d",
       "v" => "b", "b" => "v",
       "s" => "s", "w" => "w", "n" => "n",
       "u" => "a"
     }[String.downcase(base)] || base
  end

end

