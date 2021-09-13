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
    of = find_by_email(of.user.email)

    cond do
      valid_balance(of.balance, avalue) ->
        {:error, "Insufficient balance"}

      true ->
        accounts = read_account()
        accounts = List.delete(accounts, of)
        accounts = List.delete(accounts, afor)

        of = %Account{of | balance: of.balance - avalue}
        afor = %Account{afor | balance: afor.balance + avalue}
        accounts = accounts ++ [of, afor]
        File.write(@accounts, :erlang.term_to_binary(accounts))
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
