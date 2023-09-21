import 'package:flutter/material.dart';
import 'package:newsapp/models/article_model.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.articleModel});

  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(articleModel.title);
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(
              articleModel.image ??
                  "https://emgf-wordpress-media.s3.eu-west-2.amazonaws.com/wp-content/uploads/2021/08/24133928/empty-180x180.jpg",
              height: 200,
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              articleModel.title == "[Removed]" ? "" : articleModel.title ?? "",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            articleModel.subTitle ?? " ",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
            textAlign: TextAlign.right,
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
