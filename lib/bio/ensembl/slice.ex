defmodule Bio.Ensembl.Slice do
  alias Bio.Ensembl.Slice

  defstruct seq_region: nil, start: 1, stop: nil, strand: :forward, seq: nil

  def length(x = %Slice{}) do
    x.stop - x.start + 1
  end

  def overlaps?(x = %Slice{}, y = %Slice{}) do
    assert_same_coord_system(x, y)
    x_range = Range.new(x.start, x.stop)
    y_range = Range.new(y.start, y.stop)
    Enum.member?(x_range, y.start) || Enum.member?(x_range, y.stop) ||
      Enum.member?(y_range, x.start) || Enum.member?(y_range, x.stop)
  end

  def within?(x = %Slice{}, y = %Slice{}) do
    assert_same_coord_system(x, y)
    y_range = Range.new(y.start, y.stop)
    Enum.member?(y_range, x.start) && Enum.member?(y_range, x.stop)
  end

  defp assert_same_coord_system(x, y) do
    if x.seq_region.coord_system_id != y.seq_region.coord_system_id do
      raise ArgumentError, message: "Cannot compare overlaps from two different coordinate systems"
    end
  end

end

