import 'package:material_ui/material_ui.dart';

import 'issue_category_screen.dart';
import 'report_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('FixIt Campus'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(child: Icon(Icons.person)),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('See something broken?', style: textTheme.titleMedium),
                    const SizedBox(height: 12),
                    FilledButton.icon(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (context) => const IssueCategoryScreen(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.report_outlined),
                      label: const Text('Report a Concern'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Text('Quick report', style: textTheme.titleMedium),
              const SizedBox(height: 8),
              const Row(
                children: [
                  Expanded(
                    child: QuickReportTile(
                      icon: Icons.lightbulb_outline,
                      label: 'Lights',
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: QuickReportTile(
                      icon: Icons.water_drop_outlined,
                      label: 'Water',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Row(
                children: [
                  Expanded(
                    child: QuickReportTile(
                      icon: Icons.chair_outlined,
                      label: 'Furniture',
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: QuickReportTile(icon: Icons.wifi, label: 'Wi-Fi'),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text('My recent reports', style: textTheme.titleMedium),
              const SizedBox(height: 8),
              const ReportCard(
                icon: Icons.lightbulb_outline,
                title: 'Flickering ceiling light',
                subtitle: 'Library · Nov 20',
                status: 'In progress',
              ),
              const SizedBox(height: 12),
              const ReportCard(
                icon: Icons.water_drop_outlined,
                title: 'Leaking water fountain',
                subtitle: 'Gym · Nov 18',
                status: 'Resolved',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuickReportTile extends StatelessWidget {
  const QuickReportTile({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (context) => const IssueCategoryScreen(),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade400),
        ),
        child: Row(
          children: [
            Icon(icon, size: 20),
            const SizedBox(width: 8),
            Text(label),
          ],
        ),
      ),
    );
  }
}

class ReportCard extends StatelessWidget {
  const ReportCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.status,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final String status;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (context) => const ReportDetailScreen(),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade400),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundColor: Colors.grey.shade200,
              child: Icon(icon, color: Colors.black87),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                  ),
                ],
              ),
            ),
            Text(status, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
