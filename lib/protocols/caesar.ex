defprotocol Caesar do
  def encrypt(chars, shift)
  def rot13(chars)
end

defimpl Caesar, for: [List, BitString] do
  def encrypt(charlist, shift) do
    chars =
      if is_bitstring(charlist) do
        String.to_charlist(charlist)
      else
        charlist
      end

    Utils.rotate(chars, shift)
  end

  def rot13(string), do: encrypt(string, 13)
end

defmodule Utils do
  def rotate(chars, shift), do: Enum.map(chars, &Integer.mod(&1 + shift, 127))
end
