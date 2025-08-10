import 'dart:convert';

enum HabitFrequency { daily, weekly, monthly }
enum HabitCategory { health, fitness, productivity, mindfulness, learning, other }

class Habit {
  final String id;
  final String name;
  final String description;
  final HabitCategory category;
  final HabitFrequency frequency;
  final DateTime createdAt;
  final Map<String, bool> completions; // date string -> completion status

  Habit({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.frequency,
    required this.createdAt,
    Map<String, bool>? completions,
  }) : completions = completions ?? {};

  Habit copyWith({
    String? id,
    String? name,
    String? description,
    HabitCategory? category,
    HabitFrequency? frequency,
    DateTime? createdAt,
    Map<String, bool>? completions,
  }) {
    return Habit(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      category: category ?? this.category,
      frequency: frequency ?? this.frequency,
      createdAt: createdAt ?? this.createdAt,
      completions: completions ?? this.completions,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'category': category.index,
      'frequency': frequency.index,
      'createdAt': createdAt.toIso8601String(),
      'completions': completions,
    };
  }

  factory Habit.fromJson(Map<String, dynamic> json) {
    return Habit(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      category: HabitCategory.values[json['category']],
      frequency: HabitFrequency.values[json['frequency']],
      createdAt: DateTime.parse(json['createdAt']),
      completions: Map<String, bool>.from(json['completions'] ?? {}),
    );
  }

  bool isCompletedOn(DateTime date) {
    final dateKey = _dateToString(date);
    return completions[dateKey] ?? false;
  }

  int getCurrentStreak() {
    int streak = 0;
    final today = DateTime.now();

    for (int i = 0; i < 365; i++) {
      final date = today.subtract(Duration(days: i));
      if (isCompletedOn(date)) {
        streak++;
      } else {
        break;
      }
    }
    return streak;
  }

  static String _dateToString(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}