defmodule SumEnumListTest do
  use ExUnit.Case

  describe("SumEnumList.call/2") do
    test "Return to the list sum" do
      list = [1, 2, 3]

      response = SumEnumList.call(list)

      expected_response = 6

      assert response == expected_response
    end
  end
end
