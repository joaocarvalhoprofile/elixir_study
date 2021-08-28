defmodule HannoiTddTest do
  use ExUnit.Case
  doctest HannoiTdd

  describe "Call/1" do
    test "we just have only 1 disc" do
      response = HannoiTdd.call(1)
      expected_response = [{"A", "B", 1}]
      assert response == expected_response
    end

    test "we have 2 discs" do
      response = HannoiTdd.call(2)

      expected_response = [
        {"A", "C", 1},
        {"A", "B", 2},
        {"C", "B", 1}
      ]

      assert response == expected_response
    end

    test "we have 3 discs" do
      response = HannoiTdd.call(3)

      expected_response = [
        {"A", "B", 1},
        {"A", "C", 2},
        {"B", "C", 1},
        {"A", "B", 3},
        {"C", "A", 1},
        {"C", "B", 2},
        {"A", "B", 1}
      ]

      assert response == expected_response
    end
  end
end
