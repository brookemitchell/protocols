defprotocol Caesar do
  def encrypt(chars, shift)
  def rot13(chars)
end

defimpl Caesar, for: List do
  def encrypt(charlist, shift) do
    Utils.rotate(charlist, shift)
  end

  def rot13(string), do: encrypt(string, 13)
end

defimpl Caesar, for: BitString do
  def encrypt(charlist, shift) do
    charlist
    |> String.downcase()
    |> String.to_charlist()
    |> Utils.rotate(shift)
    |> List.to_string()
  end

  def rot13(string), do: encrypt(string, 13)
end

defmodule Utils do
  def rotate(chars, shift),
    do:
      Enum.map(
        chars,
        fn
          ?\s -> ?\s
          ?\' -> ?\'
          char -> Integer.mod(char - 97 + shift, 26) + 97
        end
      )
end
