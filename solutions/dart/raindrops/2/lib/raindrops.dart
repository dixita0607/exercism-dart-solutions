const Map<int, String> drops = {3: 'Pling', 5: 'Plang', 7: 'Plong'};

class Raindrops {
  String convert(int number) {
    String raindrops = drops.entries.fold<String>(
      '',
      (previousItem, item) =>
          '$previousItem${number % item.key == 0 ? item.value : ''}',
    );
    return raindrops.isEmpty ? number.toString() : raindrops;
  }
}