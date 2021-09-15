defmodule Xirfoods.Orders.ReportTest do
  use ExUnit.Case

  import Xirfoods.Factory

  alias Xirfoods.Orders.Agent, as: OrderAgent
  alias Xirfoods.Orders.Report

  describe "create/1" do
    test "creates the report file" do
      OrderAgent.start_link(%{})

      :order
      |> build()
      |> OrderAgent.save()

      :order
      |> build()
      |> OrderAgent.save()

      expected_response =
        "12345678900, pizza, 2, 55.00sobremesa, 2, 15.00, 140.00\n" <>
          "12345678900, pizza, 2, 55.00sobremesa, 2, 15.00, 140.00\n"

      Report.create("report_test.csv")
      response = File.read!("report_test.csv")

      assert response == expected_response
    end
  end
end
