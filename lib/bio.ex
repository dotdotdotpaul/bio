defmodule Bio do
  use Application 

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      supervisor(Bio.Repo, [])
    ]
    opts = [strategy: :one_for_one, name: Bio.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @chromosomes Enum.concat([Enum.to_list(1..22), ["X", "Y"]])
               |> Enum.map(&(to_string(&1)))
  def chromosomes, do: @chromosomes

end
