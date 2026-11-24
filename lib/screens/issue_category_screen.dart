import 'package:material_ui/material_ui.dart';

import 'report_detail_screen.dart';

class IssueCategory {
  const IssueCategory({
    required this.icon,
    required this.title,
    this.mostReported = false,
    this.selected = false,
  });

  final IconData icon;
  final String title;
  final bool mostReported;
  final bool selected;
}

const List<IssueCategory> issueCategories = [
  IssueCategory(
    icon: Icons.lightbulb_outline,
    title: 'Broken lights',
    mostReported: true,
    selected: true,
  ),
  IssueCategory(icon: Icons.water_drop_outlined, title: 'Water & plumbing'),
  IssueCategory(icon: Icons.chair_outlined, title: 'Furniture & equipment'),
  IssueCategory(icon: Icons.wifi, title: 'Wi-Fi & internet'),
  IssueCategory(icon: Icons.warning_amber_outlined, title: 'Safety hazard'),
];

class IssueCategoryScreen extends StatelessWidget {
  const IssueCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 90,
        leading: TextButton.icon(
          onPressed: () => Navigator.of(context).maybePop(),
          icon: const Icon(Icons.arrow_back_ios_new, size: 16),
          label: const Text('Back'),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("What's the issue?", style: textTheme.headlineSmall),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search issue or category...',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text('Categories', style: textTheme.titleMedium),
              const SizedBox(height: 8),
              for (final category in issueCategories) ...[
                CategoryTile(category: category),
                const SizedBox(height: 10),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  const CategoryTile({super.key, required this.category});

  final IssueCategory category;

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
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: category.selected
                    ? Colors.black87
                    : Colors.grey.shade400,
                width: category.selected ? 2 : 1,
              ),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.grey.shade200,
                  child: Icon(category.icon, color: Colors.black87),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        category.title,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Office name',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right),
              ],
            ),
          ),
          if (category.mostReported)
            Positioned(
              top: 8,
              right: 40,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'Most reported',
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
