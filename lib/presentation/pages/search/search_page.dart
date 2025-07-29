import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inprosur_teach_app/presentation/providers/search_provider.dart';
import 'package:inprosur_teach_app/presentation/widgets/custom_input_label.dart';
import 'package:inprosur_teach_app/presentation/widgets/custom_list_tile.dart';
import 'package:sizer/sizer.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  final TextEditingController _buscarController = TextEditingController();

  void _onSearch() {
    final word = _buscarController.text.trim();
    ref.read(searchProvider.notifier).search(word);
  }

  @override
  Widget build(BuildContext context) {
    final searchResults = ref.watch(searchProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Buscar'), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(10.sp),
        child: Column(
          children: [
            TextField(
              controller: _buscarController,
              keyboardType: TextInputType.webSearch,
              style: TextStyle(fontSize: 14.sp),
              decoration: InputDecoration(
                label: CustomInputLabel(
                  icon: Icons.search,
                  label: 'Buscar curso, vídeo o documento',
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _onSearch,
                ),
              ),
              onSubmitted: (_) => _onSearch(),
            ),
            SizedBox(height: 1.h),
            Expanded(
              child: searchResults.when(
                data: (results) {
                  if (results.isEmpty) {
                    return Center(child: Text('No hay resultados'));
                  }
                  return ListView.builder(
                    itemCount: results.length,
                    itemBuilder: (context, index) {
                      final item = results[index];
                      return CustomListTile(
                        src: item.thumbnailUrl,
                        title: item.title,
                        subtitle: item.description,
                        icon: switch (item.type) {
                          'course' => Icons.school,
                          'video' => Icons.video_library,
                          'document' => Icons.description,
                          String() => Icons.help, // Fallback ico
                        },
                      );
                    },
                  );
                },
                loading: () => Center(child: CircularProgressIndicator()),
                error: (e, _) => Center(child: Text('Error: $e')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
