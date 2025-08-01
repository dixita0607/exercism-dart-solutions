typedef Result = ({int moves, String goalBucket, int otherBucket});

class TwoBucket {
  final int bucketOne;
  final int bucketTwo;
  final int goal;
  final String startBucket;

  late final firstBucketCapacity = startBucket == 'one' ? bucketOne : bucketTwo;
  late final secondBucketCapacity =
      startBucket == 'one' ? bucketTwo : bucketOne;

  late final firstBucketLabel = startBucket == 'one' ? 'one' : 'two';
  late final secondBucketLabel = startBucket == 'one' ? 'two' : 'one';

  TwoBucket(
      {required this.bucketOne,
      required this.bucketTwo,
      required this.goal,
      required this.startBucket});

  Result measure() {
    if (goal > bucketOne && goal > bucketTwo) throw ArgumentError('impossible');

    int moves = 1;
    int first = firstBucketCapacity;
    int second = 0;

    while (first != goal && second != goal) {
      final (nextFirst, nextSecond) = _calculateNextMove(first, second);
      first = nextFirst;
      second = nextSecond;
      if (_isImpossible(first, second))
        throw ArgumentError('impossible');
      else
        moves++;
    }

    return (
      moves: moves,
      goalBucket: first == goal ? firstBucketLabel : secondBucketLabel,
      otherBucket: first == goal ? second : first
    );
  }

  _calculateNextMove(int start, int other) {
    if (start == 0) return (firstBucketCapacity, other);
    if (other == secondBucketCapacity) return (start, 0);
    if (other == 0) {
      if (secondBucketCapacity == goal) return (start, secondBucketCapacity);
      if (start >= secondBucketCapacity)
        return (start - secondBucketCapacity, secondBucketCapacity);
      else
        return (0, start);
    }
    if (start == firstBucketCapacity) {
      int remainingCapacity = secondBucketCapacity - other;
      return start >= remainingCapacity
          ? (start - remainingCapacity, other + remainingCapacity)
          : (0, other + start);
    }
  }

  bool _isImpossible(int start, int other) =>
      start == 0 && other == secondBucketCapacity;
}
