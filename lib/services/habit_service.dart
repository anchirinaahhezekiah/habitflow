import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/habit.dart';

class HabitService {
  static const String _habitsKey = 'habits';

  static Future<List<Habit>> loadHabits() async {
    final prefs = await SharedPreferences.getInstance();
    final habitsJson = prefs.getStringList(_habitsKey) ?? [];

    return habitsJson.map((habitString) {
      final habitMap = jsonDecode(habitString) as Map<String, dynamic>;
      return Habit.fromJson(habitMap);
    }).toList();
  }

  static Future<void> saveHabits(List<Habit> habits) async {
    final prefs = await SharedPreferences.getInstance();
    final habitsJson = habits.map((habit) => jsonEncode(habit.toJson())).toList();
    await prefs.setStringList(_habitsKey, habitsJson);
  }

  static Future<void> toggleHabitCompletion(String habitId, DateTime date) async {
    final habits = await loadHabits();
    final habitIndex = habits.indexWhere((h) => h.id == habitId);

    if (habitIndex != -1) {
      final habit = habits[habitIndex];
      final dateKey = _dateToString(date);
      final newCompletions = Map<String, bool>.from(habit.completions);
      newCompletions[dateKey] = !(newCompletions[dateKey] ?? false);

      habits[habitIndex] = habit.copyWith(completions: newCompletions);
      await saveHabits(habits);
    }
  }

  static Future<void> addHabit(Habit habit) async {
    final habits = await loadHabits();
    habits.add(habit);
    await saveHabits(habits);
  }

  static Future<void> updateHabit(Habit updatedHabit) async {
    final habits = await loadHabits();
    final index = habits.indexWhere((h) => h.id == updatedHabit.id);
    if (index != -1) {
      habits[index] = updatedHabit;
      await saveHabits(habits);
    }
  }

  static Future<void> deleteHabit(String habitId) async {
    final habits = await loadHabits();
    habits.removeWhere((h) => h.id == habitId);
    await saveHabits(habits);
  }

  static String _dateToString(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}
