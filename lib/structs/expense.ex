defmodule FunctionalElixir.Structs.Expense do
  alias FunctionalElixir.Structs.Expense
  defstruct(
    title: "",
    date: nil,
    amount: 0,
    store: ""
  )
  @type t :: %Expense{
    title: String.t(),
    date: Date.t() | nil,
    amount: number(),
    store: String.t()
  }

  @spec sample :: [t()]
  def sample do
    [
      %Expense{title: "Grocery", date: ~D[2022-09-12], amount: 18.99, store: "Metro"},
      %Expense{title: "Mobile", date: ~D[2022-10-12], amount: 55.65, store: "Bell"},
      %Expense{title: "Jacket", date: ~D[2022-07-06], amount: 150.99, store: "Marks"},
      %Expense{title: "Air Jordans", date: ~D[2022-10-30], amount: 799.99, store: "Nike"}
    ]
  end

  @spec total_expense_amount([t()]) :: number()
  def total_expense_amount(expenses) do 
    expenses 
    |> Enum.reduce(0, fn expense, acc -> acc + expense.amount end)
  end

  @spec sort_by_date([t()]) :: [t()]
  def sort_by_date(expenses) do
    expenses
    |> Enum.sort_by(&(&1.date), {:desc, Date})
  end

  @spec add_expense([t()], t) :: [t()]
  def add_expense(expenses, %Expense{} = expense) do
    [expense | sample()]
  end

  @spec update_amount([t()], String.t(), number()) :: [t()]
  def update_amount(expenses, title, amount) do
    [item] = expenses |> Enum.filter(fn %{title: expense_title} -> expense_title == title end)
    new_item = %{item | amount: amount}
    [new_item | expenses |> List.delete(item)] 
  end

end
