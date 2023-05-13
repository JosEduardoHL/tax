import List "mo:base/List";
import Text "mo:base/Text";

actor
{
  var incomes = List.nil<Float>();
  var expenses = List.nil<Float>();

  public func addIncome(sub : Float): async ()
  {
    incomes := List.push(sub, incomes);
  };

  public func addExpense(sub : Float): async ()
  {
    expenses := List.push(sub, expenses);
  };

  public query func totalIncomes(): async Float
  {
    var sum = 0.0;
    for (i in List.toArray(incomes).vals()) {
      sum += i;
    };

    return sum;
  };

  public query func totalExpenses(): async Float
  {
    var sum = 0.0;
    for (i in List.toArray(expenses).vals()) {
      sum += i;
    };

    return sum;
  };

  public func resetIncomes(): async ()
  {
    incomes := List.nil<Float>();
  };

  public func resetExpenses(): async ()
  {
    expenses := List.nil<Float>();
  };

  public query func netIncome(): async Float
  {
    var sum = 0.0;
    for (i in List.toArray(incomes).vals()) {
      sum += i;
    };

    for (i in List.toArray(expenses).vals()) {
      sum -= i;
    };

    return sum;
  };

  public query func calculateTax(): async Float
  {
    var sum = 0.0;
    var low = 0.0;
    var rate = 0.0;
    var fee = 0.0;

    for (i in List.toArray(incomes).vals()) {
      sum += i;
    };

    for (i in List.toArray(expenses).vals()) {
      sum -= i;
    };

    if (sum < 0.01)
    {
      return 0;
    };

    if (0.01 <= sum and sum <= 3730.2)
    {
      low := 0.01;
      rate := 0.0192;
      fee := 0;
    };

    if (3730.21 <= sum and sum <= 31660.25)
    {
      low := 3730.21;
      rate := 0.064;
      fee := 71.6;
    };

    if (31660.26 <= sum and sum <= 55640.05)
    {
      low := 31660.26;
      rate := 0.1088;
      fee := 1859.15;
    };

    if (55640.06 <= sum and sum <= 64679.10)
    {
      low := 55640.06;
      rate := 0.16;
      fee := 4468.15;
    };

    if (64679.11 <= sum and sum <= 77438.55)
    {
      low := 64679.11;
      rate := 0.1792;
      fee := 5914.4;
    };

    if (77438.56 <= sum and sum <= 156182.45)
    {
      low := 77438.56;
      rate := 0.2136;
      fee := 8200.9;
    };

    if (156182.46 <= sum and sum <= 246165)
    {
      low := 156182.46;
      rate := 0.2352;
      fee := 25020.6;
    };

    if (246165.01 <= sum and sum <= 469969.5)
    {
      low := 246165.01;
      rate := 0.3;
      fee := 46184.45;
    };

    if (469969.51 <= sum and sum <= 626626)
    {
      low := 469969.51;
      rate := 0.32;
      fee := 113325.85;
    };

    if (626626.01 <= sum and sum <= 1879878.05)
    {
      low := 626626.01;
      rate := 0.34;
      fee := 163455.9;
    };

    if (1879878.06 <= sum)
    {
      low := 1879878.06;
      rate := 0.35;
      fee := 589561.6;
    };

    return (sum - low) * rate + fee;
  };
};
