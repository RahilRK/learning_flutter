import 'package:flutter/material.dart';
import 'package:learning_flutter/theme/color.dart';
import 'package:learning_flutter/united_pharmacy/model/response/home/HomePageFirstResponse.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key, required this.list});
  final List<FeaturedCategories> list;

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  List<FeaturedCategories> mList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mList = widget.list;
    print('CategoryList: ${mList.length}');
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      crossAxisCount: 4,
      crossAxisSpacing: 0,
      mainAxisSpacing: 0,
      children: List.generate(mList.length, (index) {
        return Center(
          child: CategoryItem(model: mList[index]),
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
