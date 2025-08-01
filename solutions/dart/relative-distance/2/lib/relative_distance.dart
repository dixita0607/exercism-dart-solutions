class RelativeDistance {
  final Map<String, List<String>> familyTree;
  RelativeDistance(this.familyTree);

  late final root = familyTree.keys.first;

  int degreesOfSeparation(String first, String second) {
    try {
      final List<String> ancestryOfFirst = _getAncestorsTillRoot(first);
      final List<String> ancestryOfSecond = _getAncestorsTillRoot(second);
      String nearestAncestor =
          _getNearestAncestor(ancestryOfFirst, ancestryOfSecond);
      return ancestryOfFirst
              .takeWhile((ancestor) => ancestor != nearestAncestor)
              .length +
          ancestryOfSecond
              .takeWhile((ancestor) => ancestor != nearestAncestor)
              .length +
          (nearestAncestor.isNotEmpty ? 1 : 0);
    } on DecendentNotFoundException {
      return -1;
    }
  }

  String _getNearestAncestor(
      List<String> firstAncestry, List<String> secondAncestry) {
    String commonAncestor = '';
    for (String ancestor in firstAncestry) {
      if (secondAncestry.contains(ancestor)) {
        commonAncestor = ancestor;
        break;
      }
    }
    return commonAncestor;
  }

  List<String> _getAncestorsTillRoot(String node) {
    String current = node;
    final List<String> path = [];
    while (current != root) {
      final parent = _getParent(current);
      path.add(parent);
      current = parent;
    }
    return path;
  }

  String _getParent(String node) {
    try {
      return familyTree.entries.firstWhere((e) => e.value.contains(node)).key;
    } on StateError {
      throw DecendentNotFoundException('$node not part of the tree of $root');
    }
  }
}

class DecendentNotFoundException implements Exception {
  final String message;
  DecendentNotFoundException(this.message);
  @override
  String toString() => 'DecendentNotFoundException: $message';
}