defmodule Bio.Codon do
  require Bio.Util

  @codon_table %{
      'ttt' => 'F', 'tct' => 'S', 'tat' => 'Y', 'tgt' => 'C',
      'ttc' => 'F', 'tcc' => 'S', 'tac' => 'Y', 'tgc' => 'C',
      'tta' => 'L', 'tca' => 'S', 'taa' => '*', 'tga' => '*',
      'ttg' => 'L', 'tcg' => 'S', 'tag' => '*', 'tgg' => 'W',

      'ctt' => 'L', 'cct' => 'P', 'cat' => 'H', 'cgt' => 'R',
      'ctc' => 'L', 'ccc' => 'P', 'cac' => 'H', 'cgc' => 'R',
      'cta' => 'L', 'cca' => 'P', 'caa' => 'Q', 'cga' => 'R',
      'ctg' => 'L', 'ccg' => 'P', 'cag' => 'Q', 'cgg' => 'R',

      'att' => 'I', 'act' => 'T', 'aat' => 'N', 'agt' => 'S',
      'atc' => 'I', 'acc' => 'T', 'aac' => 'N', 'agc' => 'S',
      'ata' => 'I', 'aca' => 'T', 'aaa' => 'K', 'aga' => 'R',
      'atg' => 'M', 'acg' => 'T', 'aag' => 'K', 'agg' => 'R',

      'gtt' => 'V', 'gct' => 'A', 'gat' => 'D', 'ggt' => 'G',
      'gtc' => 'V', 'gcc' => 'A', 'gac' => 'D', 'ggc' => 'G',
      'gta' => 'V', 'gca' => 'A', 'gaa' => 'E', 'gga' => 'G',
      'gtg' => 'V', 'gcg' => 'A', 'gag' => 'E', 'ggg' => 'G',
    }

  def from_bases(bases) when is_bitstring(bases) do
    bases
    |> to_char_list
    |> from_bases
    |> to_string
  end
  def from_bases(bases) when length(bases) == 3 do
    @codon_table[:string.to_lower(bases)]
  end
  def from_bases(bases) do
    Enum.chunk(bases, 3)
    |> Enum.map(fn(x) -> from_bases(x) |> List.first end)
  end

end

