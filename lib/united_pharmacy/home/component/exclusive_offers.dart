import 'package:flutter/material.dart';
import 'package:learning_flutter/united_pharmacy/model/response/home/HomePageSecondResponse.dart';

import '../../../theme/color.dart';
import '../../../theme/string.dart';

class ExclusiveOffers extends StatefulWidget {
  const ExclusiveOffers({super.key, required this.list});
  final List<Banners> list;

  @override
  State<ExclusiveOffers> createState() => _ExclusiveOffersState();
}

class _ExclusiveOffersState extends State<ExclusiveOffers> {
  List<Banners> mList = <Banners>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mList = widget.list;
    print('ExclusiveOffers: ${mList.length}');
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: mList.isNotEmpty,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppString.ExclusiveOffers,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColor.black),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView.count(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              children: List.generate(mList.length, (index) {
                return Center(
                  child: CategoryItem(model: mList[index]),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.model});

  final Banners model;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.network(
        model.url ?? "no url",
        height: 180,
        width: 180,
      ),
    );
  }
}
