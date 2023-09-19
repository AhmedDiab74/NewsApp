import 'package:flutter/material.dart';
import 'package:newsapp/models/category_model.dart';

import '../views/category_view.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.categories});

  final CategoryModel categories;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const CategoryView();
        }));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        height: 85,
        width: 160,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: AssetImage(categories.image),
              fit: BoxFit.fill,
            )),
        child: Center(
          child: Text(
            categories.categoryName,
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
