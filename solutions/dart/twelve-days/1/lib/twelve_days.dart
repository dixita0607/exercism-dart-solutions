class TwelveDays {
  static const List<({String qty, String day, String gift})> _gifts = const [
    (qty: 'a', day: 'first', gift: 'Partridge in a Pear Tree'),
    (qty: 'two', day: 'second', gift: 'Turtle Doves'),
    (qty: 'three', day: 'third', gift: 'French Hens'),
    (qty: 'four', day: 'fourth', gift: 'Calling Birds'),
    (qty: 'five', day: 'fifth', gift: 'Gold Rings'),
    (qty: 'six', day: 'sixth', gift: 'Geese-a-Laying'),
    (qty: 'seven', day: 'seventh', gift: 'Swans-a-Swimming'),
    (qty: 'eight', day: 'eighth', gift: 'Maids-a-Milking'),
    (qty: 'nine', day: 'ninth', gift: 'Ladies Dancing'),
    (qty: 'ten', day: 'tenth', gift: 'Lords-a-Leaping'),
    (qty: 'eleven', day: 'eleventh', gift: 'Pipers Piping'),
    (qty: 'twelve', day: 'twelfth', gift: 'Drummers Drumming'),
  ];

  static List<String> _generateGifts(int startsFrom) => List.generate(
    startsFrom,
    (index) =>
        '${_gifts[startsFrom - index - 1].qty} ${_gifts[startsFrom - index - 1].gift}',
  );

  String recite(int startsFrom, int verses) {
    List<String> song = [];
    while (startsFrom <= verses) {
      List<String> gifts = _generateGifts(startsFrom);
      song.add(
        'On the ${_gifts[startsFrom - 1].day} day of Christmas my true love gave to me: ${gifts.sublist(0, gifts.length - 1).join(', ')}${gifts.length == 1 ? '' : ', and '}${gifts.last}.',
      );
      startsFrom += 1;
    }
    return song.join('\n');
  }
}