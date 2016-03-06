defmodule Bio.Ensembl.Slice.Test do
  use ExUnit.Case
  doctest Bio.Ensembl.Slice
  alias Bio.Ensembl.{Slice, SeqRegion}
  require Ecto.Query

  setup do
    seq = %SeqRegion{coord_system_id: 1}
    base = %Slice{seq_region: seq, start: 10, stop: 20}
    {:ok, [base: base, seq: seq]}
  end

  test "overlaps? works", context do
    seq = context[:seq]
    base = context[:base]
    [[1, 15], [15, 30], [1, 30], [14, 16]]
    |> Enum.each(fn([start, stop]) ->
      x = %Slice{seq_region: seq, start: start, stop: stop}
      assert(Slice.overlaps?(base, x) == true)
      assert(Slice.overlaps?(x, base) == true)
    end)

    x = %Slice{seq_region: seq, start: 40, stop: 50}
    assert Slice.overlaps?(x, base) == false
    assert Slice.overlaps?(base, x) == false

    x = %Slice{seq_region: %SeqRegion{coord_system_id: 2}, start: 1, stop: 15}
    assert_raise ArgumentError, fn ->
      Slice.overlaps?(x, base)
    end
  end

  test "within? works", context do
    seq = context[:seq]
    base = context[:base]
    x = %Slice{seq_region: seq, start: 14, stop: 16}
    assert Slice.within?(x, base) == true
    assert Slice.within?(base, x) == false

    x = %Slice{seq_region: %SeqRegion{coord_system_id: 2}, start: 14, stop: 16}
    assert_raise ArgumentError, fn ->
      Slice.within?(x, base)
    end
  end


end
