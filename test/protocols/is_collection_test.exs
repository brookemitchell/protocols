defmodule IsCollectionTest do
  use ExUnit.Case

  test "collection checks" do
    assert Collection.is_collection?([1, 2]) == true
    assert Collection.is_collection?(1) == false
  end
end
