class HealthMetricModel {
  final String name; // e.g., "Blood Pressure", "Heart Rate"
  final String unit; // e.g., "mmHg", "bpm"
  final double value; // e.g., 120.0, 80.0
  final String status; // e.g., "Normal", "High", "Low"
  final String range; // e.g., "90-120 mmHg"
  final List<double> history; // e.g., [118.0, 121.0, 119.0]

  // Constructor
  HealthMetricModel({
    required this.name,
    required this.unit,
    required this.value,
    required this.status,
    required this.range,
    required this.history,
  });

  // From JSON here we create an object from a JSON map
  factory HealthMetricModel.fromJson(Map<String, dynamic> json) {
    return HealthMetricModel(
      name: json['name'],
      unit: json['unit'],
      value: json['value'].toDouble(),
      status: json['status'],
      range: json['range'],
      history: List<double>.from(
        json['history'].map((x) => x.toDouble()),
      ),
    );
  }

  // To JSON:- here we convert the object back to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'unit': unit,
      'value': value,
      'status': status,
      'range': range,
      'history': history,
    };
  }
}
