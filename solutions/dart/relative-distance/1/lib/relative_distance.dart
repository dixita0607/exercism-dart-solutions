class RelativeDistance {
  final Map<String, List<String>> familyTree;
  RelativeDistance(this.familyTree);

  late final root = familyTree.keys.first;

  int degreesOfSeparation(String first, String second) {
    try {
      final firstPersonsPathToRoot = Set.from(pathToRoot(first));
      final secondPersonsPathToRoot = Set.from(pathToRoot(second));
      final commonAncestors =
          firstPersonsPathToRoot.intersection(secondPersonsPathToRoot).length;
      return ((firstPersonsPathToRoot.length + secondPersonsPathToRoot.length) -
          (commonAncestors * 2) +
          (commonAncestors >= 1 ? 1 : 0));
    } on DecendentNotFoundException {
      return -1;
    }
  }

  List<dynamic> pathToRoot(String node) {
    String current = node;
    final path = [];
    while (current != root) {
      final parent = getParent(current);
      path.add(parent);
      current = parent;
    }
    return path;
  }

  String getParent(String node) {
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