defmodule MyApp.Solutions.Y24.Day03 do
  alias AoC.Input

  def parse(input, _part) do
    garbage = Input.read!(input)
    Regex.scan(~r/mul\((\d+),(\d+)\)|do\(\)|don't\(\)/, garbage)
  end

  def part_one(problem) do
    problem
    |> List.foldl(0, fn [_, x, y], acc ->
     acc + String.to_integer(x) * String.to_integer(y)
     ["do()" | _ ], acc -> acc
     ["don't()" | _ ], acc -> acc
    end)
  end

  def part_two(problem) do
    problem
    |> Enum.reduce({0, true}, fn
      ["do()" | _ ], {acc, _enabled} -> {acc, true}
      ["don't()" | _ ], {acc, _enabled} -> {acc, false}
      [_, x, y], {acc, true} -> {acc + String.to_integer(x) * String.to_integer(y), true}
      [_, _, _], {acc, false} -> {acc, false}
    end)
  end
end
