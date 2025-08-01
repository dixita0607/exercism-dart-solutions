class Node {
  final String data;
  Node? left;
  Node? right;

  Node(this.data, [this.left, this.right]);
}

class BinarySearchTree {
  final Node root;
  BinarySearchTree(String value) : this.root = Node(value);

  List<String> get sortedData => _getSortedData(root);

  void insert(String n) => _appendToNode(n, root);

  static void _appendToNode(String n, Node node) {
    int number = int.parse(n);
    int data = int.parse(node.data);
    if (number <= data) {
      if (node.left == null) {
        node.left = Node(n);
        return;
      }
      _appendToNode(n, node.left!);
    } else if (number > data) {
      if (node.right == null) {
        node.right = Node(n);
        return;
      }
      _appendToNode(n, node.right!);
    }
  }

  static List<String> _getSortedData(Node node) {
    if (node.left == null && node.right != null)
      return [node.data, ..._getSortedData(node.right!)];
    if (node.right == null && node.left != null)
      return [..._getSortedData(node.left!), node.data];
    if (node.left == null && node.right == null) return [node.data];
    return [
      ..._getSortedData(node.left!),
      node.data,
      ..._getSortedData(node.right!),
    ];
  }
}