import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/category_list_provider.dart';
import '../providers/delete_category_provider.dart';
import 'category_create_screen.dart';
import 'category_edit_screen.dart';

class CategoryListScreen extends ConsumerWidget {
  const CategoryListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncCategories = ref.watch(adminCategoryListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin - Categories'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CategoryCreateScreen()),
            ),
          ),
        ],
      ),
      body: asyncCategories.when(
        data: (items) => ListView.separated(
          itemCount: items.length,
          separatorBuilder: (_, _) => const Divider(height: 1),
          itemBuilder: (_, i) {
            final c = items[i];
            return ListTile(
              leading: SizedBox(
                width: 44,
                height: 44,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    c.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (_, _, _) =>
                        const Icon(Icons.image_not_supported),
                  ),
                ),
              ),
              title: Text(c.name),
              subtitle: Text(c.id),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CategoryEditScreen(category: c),
                ),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete_outline),
                onPressed: () =>
                    ref.read(deleteCategoryProvider.notifier).call(c.id),
              ),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
      ),
    );
  }
}
