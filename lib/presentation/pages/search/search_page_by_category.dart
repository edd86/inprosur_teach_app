import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inprosur_teach_app/data/repositories/search_repository_impl.dart';
import 'package:inprosur_teach_app/presentation/providers/search_content_by_category.dart';
import 'package:inprosur_teach_app/presentation/widgets/custom_list_tile.dart';
import 'package:sizer/sizer.dart';

class SearchPageByCategory extends ConsumerStatefulWidget {
  final int degreeId;
  const SearchPageByCategory({required this.degreeId, super.key});

  @override
  ConsumerState<SearchPageByCategory> createState() =>
      _SearchPageByCategoryState();
}

class _SearchPageByCategoryState extends ConsumerState<SearchPageByCategory> {
  final TextEditingController _searchController = TextEditingController();
  int selectedCategoryId = 0;
  String word = '';

  @override
  Widget build(BuildContext context) {
    final categoriesAsync = ref.watch(
      categoriesByDegreeProvider(widget.degreeId),
    );

    return Scaffold(
      appBar: AppBar(title: Text('Busqueda por Grados'), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 4.5.h,
              child: TextField(
                controller: _searchController,
                keyboardType: TextInputType.webSearch,
                style: TextStyle(fontSize: 14.sp),
                decoration: InputDecoration(
                  label: const Text('Buscar curso, vídeo o documento'),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      setState(() {
                        word = _searchController.text.trim().isEmpty
                            ? ''
                            : _searchController.text.trim();
                      });
                    },
                  ),
                ),
                onSubmitted: (value) {
                  setState(() {
                    word = _searchController.text.trim().isEmpty
                        ? ''
                        : _searchController.text.trim();
                  });
                },
              ),
            ),
            SizedBox(height: 0.5.h),
            SizedBox(
              height: 4.h,
              child: categoriesAsync.when(
                loading: () => Center(
                  child: Container(
                    height: 3.h,
                    width: 100.w,
                    color: const Color.fromARGB(137, 131, 131, 131),
                  ),
                ),
                error: (e, _) => Center(child: Text('Error: $e')),
                data: (categories) {
                  if (categories.isEmpty) return Center();
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      return InkWell(
                        child: Card(
                          color: selectedCategoryId == category.id
                              ? Theme.of(context).colorScheme.secondary
                              : Theme.of(context).colorScheme.tertiary,
                          child: SizedBox(
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 3.w),
                                child: Text(
                                  category.name,
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            word = _searchController.text.trim().isEmpty
                                ? ''
                                : _searchController.text.trim();
                            selectedCategoryId = category.id!;
                          });
                        },
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(height: .75.h),
            Expanded(
              child: FutureBuilder(
                future: SearchRepositoryImpl().searchContentByCategory(
                  word,
                  selectedCategoryId,
                ),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (selectedCategoryId == 0 && word.isEmpty) {
                    return Center(
                      child: Text(
                        'Por favor seleccione una categoria e ingrese una búsqueda',
                        textAlign: TextAlign.center,
                      ),
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  final searchResults = snapshot.data;
                  if (searchResults == null || searchResults.isEmpty) {
                    return Center(child: Text('No hay resultados'));
                  }
                  return ListView.builder(
                    itemCount: searchResults.length,
                    itemBuilder: (context, index) {
                      final item = searchResults[index];
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
