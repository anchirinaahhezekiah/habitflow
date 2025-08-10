# 🌱 HabitFlow - Daily Habits Tracker

A beautiful and intuitive Flutter app designed to help you build and maintain healthy daily habits. Track your progress, visualize your streaks, and stay motivated on your journey to personal growth.

##  Features

### **Core Functionality**
- **Daily Habit Tracking** - Simple checkbox interface to mark habits as complete
- **Multi-Day Navigation** - Horizontal date picker to view and update past days
- **Smart Categories** - Organize habits by Health, Fitness, Productivity, Mindfulness, Learning, or Other
- **Flexible Frequency** - Set habits for daily, weekly, or monthly goals

### **Progress & Analytics**
- **Streak Tracking** - See your current streak for each habit with fire emoji motivation 🔥
- **Visual Progress Charts** - 30-day completion trends using beautiful line charts
- **Daily Statistics** - Today's completion rate and progress overview
- **Long-term Insights** - Track your consistency and growth over time

### **User Experience**
- **Animated Splash Screen** - Smooth fade-in animation with app branding
- **Dark/Light Mode** - Toggle between themes for comfortable viewing
- **Material Design** - Clean, modern interface following Google's design principles
- **Responsive Layout** - Optimized for various screen sizes

### **Management**
- **Add/Edit/Delete Habits** - Full CRUD operations with form validation
- **Data Persistence** - Your habits and progress are saved locally
- **Settings Panel** - Customize notifications and app preferences
- **Data Reset Option** - Fresh start when needed

## Screenshots

*Add your app screenshots here*

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (>=3.0.0)
- Dart SDK (>=2.17.0)
- Android Studio / VS Code with Flutter extensions

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/habitflow.git
   cd habitflow
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## Dependencies

- `fl_chart: ^0.65.0` - Beautiful charts for progress visualization
- `shared_preferences: ^2.2.2` - Local data persistence
- `intl: ^0.19.0` - Date formatting and internationalization

## Project Structure

```
lib/
├── main.dart                 # App entry point and theme management
├── models/
│   └── habit.dart           # Habit data model and business logic
├── services/
│   └── habit_service.dart   # Data persistence and CRUD operations
├── screens/
│   ├── splash_screen.dart   # Animated startup screen
│   ├── home_screen.dart     # Main habit tracking interface
│   ├── add_edit_habit_screen.dart  # Habit creation and editing
│   ├── progress_screen.dart # Charts and analytics
│   └── settings_screen.dart # App configuration
├── widgets/
│   ├── habit_card.dart      # Individual habit display component
│   └── date_picker_widget.dart # Horizontal date navigation
└── utils/
    └── theme.dart           # App theming and color schemes
```

## Design Philosophy

HabitFlow uses a **green primary color** (#4CAF50) representing growth and health, with **amber accents** (#FFC107) for motivation and achievements. The design emphasizes:

- **Simplicity** - Clean, distraction-free interface
- **Motivation** - Visual feedback through streaks and progress charts
- **Accessibility** - Support for both light and dark themes
- **Consistency** - Material Design principles throughout

## Future Enhancements

- [ ] Push notifications for habit reminders
- [ ] Habit templates and suggestions
- [ ] Social sharing of achievements
- [ ] Cloud sync across devices
- [ ] Advanced analytics and insights
- [ ] Habit grouping and routines
- [ ] Export data functionality

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

