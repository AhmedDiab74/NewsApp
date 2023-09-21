import 'package:flutter/material.dart';
import 'package:newsapp/widgets/news_list_view_builder.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category});
  final String category;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverToBoxAdapter(
            child: SizedBox(
          height: 10,
        )),
        NewsListViewBuilder(
          category: category,
        )
      ],
    ));
  }
}
