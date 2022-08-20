defmodule CaesarExample do
  def check_words do
    with {:ok, words} <- File.read("assets/american-words.95"),
         word_list = String.split(words, ~r{\n}, trim: true),
         rotate_list = Enum.map(word_list, &Caesar.rot13/1) do
      for word <- word_list, rotated_word <- rotate_list, word == rotated_word do
        word
      end
    end
  end
end
