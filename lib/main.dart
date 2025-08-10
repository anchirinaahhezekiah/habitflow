import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'screens/add_edit_habit_screen.dart';
import 'screens/progress_screen.dart';
import 'screens/settings_screen.dart';
import 'utils/theme.dart';

void main() {
  runApp(const HabitFlowApp());
}

class HabitFlowApp extends StatefulWidget {
  const HabitFlowApp({Key? key}) : super(key: key);

  @override
  State<HabitFlowApp> createState() => _HabitFlowAppState();
}

class _HabitFlowAppState extends State<HabitFlowApp> {
  bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _loadThemePreference();
  }

  _loadThemePreference() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    });
  }

  void toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
    await prefs.setBool('isDarkMode', _isDarkMode);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HabitFlow',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: SplashScreen(toggleTheme: toggleTheme),
      routes: {
        '/home': (context) => HomeScreen(toggleTheme: toggleTheme),
        '/add-habit': (context) => const AddEditHabitScreen(),
        '/progress': (context) => const ProgressScreen(),
        '/settings': (context) => SettingsScreen(
          isDarkMode: _isDarkMode,
          toggleTheme: toggleTheme,
        ),
      },
    );
  }
}