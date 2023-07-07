class CalculatorHistory {
  final int? id;
  final String input;
  final String output;

  CalculatorHistory({
    this.id,
    required this.input,
    required this.output,
  });

  Map<String, dynamic> toMap() {
    return {
      'input': input,
      'output': output,
    };
  }
}
