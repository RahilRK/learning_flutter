import 'package:flutter/material.dart';
import 'package:learning_flutter/theme/color.dart';
import 'package:learning_flutter/united_pharmacy/model/response/home/HomePageFirstResponse.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  List<FeaturedCategories> featuredCategories = <FeaturedCategories>[
    FeaturedCategories(
        url:
            "https://unitedpharmacy.sa/media/mobikul/featuredcategories/File-1725993010.png",
        dominantColor: "#000062",
        categoryId: "5022",
        categoryName: "Best selling"),
    FeaturedCategories(
        url:
            "https://unitedpharmacy.sa/media/mobikul/featuredcategories/File-1725993432.png",
        dominantColor: "#000062",
        categoryId: "5286",
        categoryName: "Outlet Offers"),
    FeaturedCategories(
        url:
            // "https://unitedpharmacy.sa/media/mobikul/featuredcategories/File-1711533350.png",
            "https://unitedpharmacy.sa/media/mobikul/featuredcategories/File-1725993010.png",
        dominantColor: "#d0d9dc",
        categoryId: "1067",
        categoryName: "Health Care & Vitamins"),
    FeaturedCategories(
        url:
            // "https://unitedpharmacy.sa/media/mobikul/featuredcategories/File-1711533446.png",
            "https://unitedpharmacy.sa/media/mobikul/featuredcategories/File-1725993432.png",
        dominantColor: "#e1d5d6",
        categoryId: "1056",
        categoryName: "Mom & Baby"),
    FeaturedCategories(
        url:
            // "https://unitedpharmacy.sa/media/mobikul/featuredcategories/File-1711534106.png",
            "https://unitedpharmacy.sa/media/mobikul/featuredcategories/File-1725993010.png",
        dominantColor: "#e1dacc",
        categoryId: "1055",
        categoryName: "Beauty & Makeup"),
    FeaturedCategories(
        url:
            // "https://unitedpharmacy.sa/media/mobikul/featuredcategories/File-1711533574.png",
            "https://unitedpharmacy.sa/media/mobikul/featuredcategories/File-1725993432.png",
        dominantColor: "#cdcbcc",
        categoryId: "268",
        categoryName: "Hair Care"),
    FeaturedCategories(
        url:
            // "https://unitedpharmacy.sa/media/mobikul/featuredcategories/File-1711533386.png",
            "https://unitedpharmacy.sa/media/mobikul/featuredcategories/File-1725993010.png",
        dominantColor: "#d9e2e8",
        categoryId: "1057",
        categoryName: "Daily Essentials"),
    FeaturedCategories(
        url:
            // "https://unitedpharmacy.sa/media/mobikul/featuredcategories/File-1711533236.png",
            "https://unitedpharmacy.sa/media/mobikul/featuredcategories/File-1725993432.png",
        dominantColor: "#c4cab6",
        categoryId: "238",
        categoryName: "OTC Medications"),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      crossAxisCount: 4,
      crossAxisSpacing: 0,
      mainAxisSpacing: 0,
      children: List.generate(featuredCategories.length, (index) {
        return Center(
          child: CategoryItem(model: featuredCategories[index]),
        );
      }),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.model});

  final FeaturedCategories model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipOval(
          child: Image.network(
            model.url ?? "no url",
            height: 64,
            width: 64,
          ),
        ),
        const SizedBox(height: 4,),
        Text(
          model.categoryName ?? "no name",
          maxLines: 1,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: AppColor.color_0A195C,
              fontSize: 10,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
