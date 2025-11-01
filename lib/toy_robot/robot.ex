defmodule ToyRobot.Robot do
  defstruct x: 0, y: 0, facing: :north

  alias ToyRobot.Robot

  @moduledoc """
  Documentação para o ToyRobot.Robot
  """

  @doc """
  Movimenta o robô uma posição para a direção que o mesmo está apontando.

  ## exemplo
    iex> alias ToyRobot.Robot
    ToyRobot.Robot
    iex> robot = %Robot{y: 0, facing: :north}
    %Robot{y: 0, facing: :north}
    iex> robot |> Robot.move
    %Robot{y: 1}
  """
    def move(%Robot{ facing: facing } = robot) do
        case facing do
            :east -> robot |> move_right
            :west -> robot |> move_left
            :north -> robot |> move_north
            :south -> robot |> move_south
        end
    end

    defp move_right(robot) do
        %Robot{ robot | x: robot.x + 1 }
    end

    defp move_left(robot) do
        %Robot{ robot | x: robot.x - 1 }
    end

    defp move_north(robot) do
        %Robot{ robot | y: robot.y + 1}
    end

    defp move_south(robot) do
        %Robot{ robot | y: robot.y - 1}
    end

  @doc """
  Gira o robô no sentido anti-horário (esquerda)

  ## Exemplo
    iex> alias ToyRobot.Robot
    ToyRobot.Robot
    iex> robot = %Robot{x: 0, y: 0, facing: :north}
    %Robot{x: 0, y: 0, facing: :north}
    iex> robot |> Robot.turn_left
    %Robot{x: 0, y: 0, facing: :west}
  """
  def turn_left(%__MODULE__{facing: facing} = robot) do
    case robot.facing do
      :north -> %Robot { robot | facing: :west}
      :west -> %Robot { robot | facing: :south}
      :south -> %Robot { robot | facing: :east}
      :east -> %Robot { robot | facing: :north}
    end
  end

  @doc """
  Gira o robô no sentido horário (direita)

  ## Exemplo
    iex> alias ToyRobot.Robot
    ToyRobot.Robot
    iex> robot = %Robot{x: 0, y: 0, facing: :north}
    %Robot{x: 0, y: 0, facing: :north}
    iex> robot |> Robot.turn_right
    %Robot{x: 0, y: 0, facing: :east}
  """
  def turn_right(%__MODULE__{facing: facing} = robot) do
    case robot.facing do
      :north -> %Robot { robot | facing: :east}
      :east -> %Robot { robot | facing: :south}
      :south -> %Robot { robot | facing: :west}
      :west -> %Robot { robot | facing: :north}
    end
  end
end
