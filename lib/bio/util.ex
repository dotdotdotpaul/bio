defmodule Bio.Util do
  def complement_zip(x, y) do
    complement_zip(x, y, %{})
  end
  defp complement_zip([], [], acc), do: acc
  defp complement_zip([h1|next1], [h2|next2], acc) do
    new_map = acc
    |> Map.put([h1], [h2])
    |> Map.put([:string.to_upper(h1)], [:string.to_upper(h2)])
    complement_zip(next1, next2, new_map)
  end
end

