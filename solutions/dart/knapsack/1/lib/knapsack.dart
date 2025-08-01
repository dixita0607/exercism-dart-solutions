import 'dart:math';

typedef Item = ({int weight, int value});

class Knapsack {
  final int maxWeight;
  const Knapsack({required this.maxWeight});

  int maxValue(List<Item> items) {
    final List<List<int>> dp = List.generate(
        items.length + 1,
        (i) =>
            List.generate(maxWeight + 1, (j) => (i == 0 || j == 0) ? 0 : -1));
    for (int n = 1; n <= items.length; n++) {
      for (int w = 1; w <= maxWeight; w++) {
        final currentItem = items[n - 1];
        dp[n][w] = currentItem.weight <= w
            ? max(dp[n - 1][w],
                currentItem.value + dp[n - 1][w - currentItem.weight])
            : dp[n - 1][w];
      }
    }
    return dp.isEmpty ? 0 : dp[items.length][maxWeight];
  }
}
