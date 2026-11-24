import 'package:material_ui/material_ui.dart';

import 'screens/home_screen.dart';
import 'screens/issue_category_screen.dart';
import 'screens/report_detail_screen.dart';
import 'theme/app_theme.dart';

// Choose 'home', 'category', or 'detail' to preview a screen. No navigation is used.
const String previewScreen = 'home';

void main() {
  runApp(const CampusApp());
}

class CampusApp extends StatelessWidget {
  const CampusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      home: _screenFor(previewScreen),
    );
  }
}

Widget _screenFor(String name) {
  switch (name) {
    case 'category':
      return const IssueCategoryScreen();
    case 'detail':
      return const ReportDetailScreen();
    default:
      return const HomeScreen();
  }
}
