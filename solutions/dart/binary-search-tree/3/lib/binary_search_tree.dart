// A version submitted after learning a few things from community solutions.

class BinarySearchTree {
  final Node root;

  BinarySearchTree(String value) : this.root = Node(value);

  List<String> get sortedData => root.sorted;

  void insert(String n) => root.append(n);
}

class Node {
  final String data;
  Node? left;
  Node? right;

  Node(this.data, [this.left, this.right]);

  void append(String value) {
    if (int.parse(value) <= int.parse(data)) {
      left == null ? left = Node(value) : left!.append(value);
    } else {
      right == null ? right = Node(value) : right!.append(value);
    }
  }

  List<String> get sorted => [
    if (left != null) ...left!.sorted,
    data,
    if (right != null) ...right!.sorted,
  ];
}
