defmodule Demo do
  use GenServer

  def start(initial_state) do
    GenServer.start(__MODULE__, initial_state, name: __MODULE__)
  end

  def sqrt() do
    GenServer.cast(__MODULE__, :sqrt)
  end

  #Async request
  def handle_cast(:sqrt, current_state) do
    { :noreply, :math.sqrt(current_state) }
  end

  def add(number) do
    GenServer.cast(__MODULE__, {:add, number})
  end

  def handle_cast({:add, number}, current_state) do
    { :noreply, current_state + number }
  end

  def handle_call(:result, _, current_state) do
    # :timer.sleep 6000
    { :reply, current_state, current_state }
  end

  # this callback is run when server starts
  def init(initial_state) when is_number(initial_state) do
    "I am started with the state #{initial_state}" |> IO.puts
    { :ok, initial_state }
  end

  def init(_) do
    {:stop, "Initial state is not a number"}
  end

  def result() do
    # by default the timmeout is 5 sec
    GenServer.call __MODULE__, :result
  end

  def terminate(reason, current_state) do
    IO.puts "TERMINATED!"
    reason |> IO.inspect
    current_state |> IO.inspect
  end




end

{:ok, _} = Demo.start(4) |> IO.inspect
Demo.sqrt |> IO.inspect
Demo.result |> IO.inspect
Demo.add(5) |> IO.inspect
Demo.result |> IO.inspect
