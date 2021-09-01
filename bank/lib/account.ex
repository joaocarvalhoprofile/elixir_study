defmodule Account do
  defstruct user: User, balance: 1000

  def register(user) do
    %__MODULE__{user: user}
  end

  def pix(accounts, of, afor, avalue) do
    of = Enum.find(accounts, fn account -> account.user.email == of.user.email end)

    cond do
      valid_balance(of.balance, avalue) ->
        {:error, "Insufficient balance"}

      true ->
        afor = Enum.find(accounts, fn account -> account.user.email == afor.user.email end)
        of = %Account{of | balance: of.balance - avalue}
        afor = %Account{afor | balance: afor.balance + avalue}
        [of, afor]
    end
  end

  def withdraw(account, value) do
    cond do
      valid_balance(account.balance, value) ->
        {:error, "Insufficient balance"}

      true ->
        account = %Account{account | balance: account.balance - value}
        {:ok, account, "Send message sucessuful"}
    end
  end

  defp valid_balance(balance, value), do: balance < value
end
