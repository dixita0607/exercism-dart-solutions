class Forth {
  Stack _stack = Stack<int>();

  static RegExp validFunctionName = RegExp(r'^\D+.{0,}');

  Map<String, List<Token>> _functions = {};

  List<int> get stack => _stack._items as List<int>;

  void evaluate(String input) {
    final lowerCaseInput = input.toLowerCase();
    if (_isFunctionDefinition(lowerCaseInput))
      _registerFunction(lowerCaseInput);
    else
      _evaluateParsed(lowerCaseInput.split(' ').map(_parseToken));
  }

  void _evaluateParsed(final parsed) {
    for (final token in parsed) {
      switch (token.type) {
        case TokenType.literal:
          _stack.push(token.value);
        case TokenType.arithmeticOperator:
          _stack.push(
              _operateArithmetic(token.value, _stack.pop(), _stack.pop()));
        case TokenType.stackOperation:
          _operateStack(token.value);
        case TokenType.function:
          _evaluateParsed(_functions[token.value]);
      }
    }
  }

  static bool _isFunctionDefinition(String input) =>
      input.startsWith(':') && input.endsWith(';');

  static bool _isValidFunctionName(String name) =>
      validFunctionName.hasMatch(name) && int.tryParse(name) == null;

  void _registerFunction(String input) {
    final tokens = input.split(' ');
    final String functionName = tokens[1];
    if (_isValidFunctionName(functionName)) {
      final List<Token> functionBody = [];
      tokens.sublist(2, tokens.length - 1).forEach((token) {
        final List<Token>? existingFunctionBody = _functions[token];
        if (existingFunctionBody == null)
          functionBody.add(_parseToken(token));
        else
          _evaluateParsed(existingFunctionBody);
      });
      _functions[functionName] = functionBody;
    } else
      throw Exception('Invalid definition');
  }

  Token _parseToken(String token) {
    if (_functions.containsKey(token))
      return Token(type: TokenType.function, value: token);
    if (ArithmeticOperator.signs.contains(token))
      return Token(
          type: TokenType.arithmeticOperator,
          value: ArithmeticOperator.fromSign(token));
    if (StackOperation.operations.contains(token))
      return Token(
          type: TokenType.stackOperation,
          value: StackOperation.fromOperation(token));
    final literal = int.tryParse(token);
    if (literal != null) return Token(type: TokenType.literal, value: literal);
    throw Exception('Unknown command');
  }

  static int _operateArithmetic(
          ArithmeticOperator operator, int op1, int op2) =>
      switch (operator) {
        ArithmeticOperator.sum => op1 + op2,
        ArithmeticOperator.sub => op2 - op1,
        ArithmeticOperator.mul => op1 * op2,
        ArithmeticOperator.div =>
          op1 == 0 ? throw Exception('Division by zero') : op2 ~/ op1,
      };

  void _operateStack(StackOperation operation) {
    switch (operation) {
      case StackOperation.dup:
        _stack.push(_stack.peek());
      case StackOperation.drop:
        _stack.pop();
      case StackOperation.swap:
        {
          final last = _stack.pop();
          final secondLast = _stack.pop();
          _stack.push(last);
          _stack.push(secondLast);
        }
      case StackOperation.over:
        {
          final last = _stack.pop();
          final secondLast = _stack.peek();
          _stack.push(last);
          _stack.push(secondLast);
        }
    }
  }
}

enum TokenType { stackOperation, arithmeticOperator, literal, function }

class Token {
  TokenType type;
  dynamic value;
  Token({required this.type, required this.value});
}

enum ArithmeticOperator {
  sum('+'),
  sub('-'),
  mul('*'),
  div('/');

  final String sign;
  const ArithmeticOperator(this.sign);

  static List<String> get signs =>
      ArithmeticOperator.values.map((value) => value.sign).toList();

  factory ArithmeticOperator.fromSign(String op) {
    try {
      return ArithmeticOperator.values.firstWhere((value) => value.sign == op);
    } on StateError {
      throw ArgumentError('Invalid sign');
    }
  }
}

enum StackOperation {
  dup('dup'),
  drop('drop'),
  swap('swap'),
  over('over');

  final String operation;
  const StackOperation(this.operation);

  static List<String> get operations =>
      StackOperation.values.map((value) => value.operation).toList();

  factory StackOperation.fromOperation(String op) {
    try {
      return StackOperation.values.firstWhere((value) => value.operation == op);
    } on StateError {
      throw ArgumentError('Invalid operation');
    }
  }
}

class Stack<T> {
  List<T> _items;
  Stack([List<T>? items]) : _items = items ?? [];

  bool get isEmpty => _items.isEmpty;
  int get size => _items.length;

  T? peek() => _items.isEmpty ? throw Exception('Stack empty') : _items.last;
  T pop() =>
      _items.isEmpty ? throw Exception('Stack empty') : _items.removeLast();
  void push(T item) => _items.add(item);
}