defmodule HelloPortMidi do

  def notes, do: [48, 50, 52, 53, 55, 57, 59, 60]

  def play() do
    HelloPortMidi.connect
    |> HelloPortMidi.play
  end

  def play(output) do
    random = Enum.random(HelloPortMidi.notes)
    note = random * Enum.random([1, 2, 3])
    PortMidi.write(output, {
          0x90,
          note,
          127
    })
    :timer.sleep(Enum.random([ 25, 50, 100, 200, 400 ]))
    play(output)
  end

  def connect do
    handle_open PortMidi.open(:output, "Renoise MIDI-In")
  end

  defp handle_open({:ok, output}), do: output

end
