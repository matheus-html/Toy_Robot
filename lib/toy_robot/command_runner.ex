defmodule ToyRobot.CommandRunner do
  alias ToyRobot.{Simulation, Table}

  def run([{:place, placement} | rest]) do
    table = %Table{x_max: 4, y_max: 4}

    case Simulation.place(table, placement) do
      { :ok, simulation } -> run(rest, simulation)
      { :error, :invalid_placement } -> run(rest)
    end

  end

  def run([command | rest]) do
    IO.puts("Ignorando o comando #{command}")
    run(rest)
  end

  def run([]) do
    nil
  end

  def run([{:invalid, _command} | rest], simulation) do
    run(rest, simulation)
  end

  def run([:move | rest], simulation) do
    new_simulation =
      simulation
      |> Simulation.move()
      |> case do
        {:ok, new_sim} -> new_sim
        {:error, :at_table_boundary} -> simulation
      end

    run(rest, new_simulation)
  end

  def run([:turn_left | rest], simulation) do
    nil
  end

  def run([:turn_right | rest], simulation) do
    nil
  end

  def run([:report | rest], simulation) do
    %{x: x, y: y, facing: facing} = simulation |> Simulation.report

    facing =
      case facing do
        :north -> "norte"
        :south -> "sul"
        :east -> "leste"
        :west -> "oeste"
      end

    IO.puts("O robô está na posição (#{x}, #{y}) apontando para o #{facing}")

    run(rest, simulation)
  end

  def run([], simulation) do
    simulation
  end
end
