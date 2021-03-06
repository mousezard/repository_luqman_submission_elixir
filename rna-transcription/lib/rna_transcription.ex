defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
@spec to_rna([char]) :: [char]
  def to_rna(dna) do
      converter = fn
        ?A->?U
        ?C->?G
        ?T->?A
        ?G->?C
      end

      Enum.map(dna,fn x -> converter.(x) end) 
  end
end
