defmodule Account do
  @accounts "db/account.txt"

  defstruct user: User, balance: 1000

  def register(user) do
    # account =
    #   [%__MODULE__{user: user}]
    #   |> :erlang.term_to_binary()

    # File.write(@accounts, account)
    case find_by_email(user.email) do
      nil ->
        account =
          ([%__MODULE__{user: user}] ++ read_account())
          |> :erlang.term_to_binary()

        File.write(@accounts, account)

      _ ->
        {:error, "Existing Account"}
    end
  end

  def read_account do
    {:ok, result} = File.read(@accounts)
    :erlang.binary_to_term(result)
  end

  def find_by_email(email), do: Enum.find(read_account(), &(&1.user.email == email))

  def pix(of, afor, avalue) do
    of = find_by_email(of)
    afor = find_by_email(afor)

    cond do
      valid_balance(of.balance, avalue) ->
        {:error, "Insufficient balance"}

      true ->
        accounts = Account.delete([of, afor])
        of = %Account{of | balance: of.balance - avalue}
        afor = %Account{afor | balance: afor.balance + avalue}
        accounts = accounts ++ [of, afor]

        Transaction.save("pix", of.user.email, avalue, afor.user.email)

        File.write(@accounts, :erlang.term_to_binary(accounts))
    end
  end

  def delete(accounts) do
    Enum.reduce(accounts, read_account(), fn c, acc -> List.delete(acc, c) end)
  end

  def withdraw(account, value) do
    account = find_by_email(account)

    cond do
      valid_balance(account.balance, value) ->
        {:error, "Insufficient balance"}

      true ->
        accounts = Account.delete([account])
        account = %Account{account | balance: account.balance - value}
        accounts = accounts ++ [account]
        File.write(@accounts, :erlang.term_to_binary(accounts))

        {:ok, account, "Send message sucessuful"}
    end
  end

  defp valid_balance(balance, value), do: balance < value
end
