class Node {
  final String data;
  Node? left;
  Node? right;

  Node(this.data, [this.left, this.right]);
}

class BinarySearchTree {
  final Node root;
  BinarySearchTree(String value) : this.root = _createNode(value);

  List<String> get sortedData => _flattenTree(root);

  void insert(String n) => _appendToNode(n, root);

  static Node _createNode(String value) => Node(value);

  static void _appendToNode(String value, node) {
    int number = int.parse(value);
    int data = int.parse(node.data);
    if (number <= data) {
      if (node.left == null) {
        node.left = _createNode(value);
        return;
      }
      _appendToNode(value, node.left);
    } else if (number > data) {
      if (node.right == null) {
        node.right = _createNode(value);
        return;
      }
      _appendToNode(value, node.right);
    }
  }

  static List<String> _flattenTree(Node node) {
    if (node.left == null && node.right != null)
      return [node.data, ..._flattenTree(node.right!)];
    if (node.right == null && node.left != null)
      return [..._flattenTree(node.left!), node.data];
    if (node.left == null && node.right == null) return [node.data];
    return [
      ..._flattenTree(node.left!),
      node.data,
      ..._flattenTree(node.right!),
    ];
  }
}
