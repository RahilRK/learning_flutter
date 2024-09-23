import 'package:flutter/material.dart';
import 'package:learning_flutter/theme/color.dart';
import 'package:learning_flutter/united_pharmacy/model/response/home/HomePageFirstResponse.dart';
import 'package:learning_flutter/united_pharmacy/model/response/home/HomePageSecondResponse.dart';

import '../../../theme/string.dart';

class ShopByBrandList extends StatefulWidget {
  const ShopByBrandList({super.key, required this.list});
  final List<ShopByBrands> list;

  @override
  State<ShopByBrandList> createState() => _ShopByBrandListState();
}

class _ShopByBrandListState extends State<ShopByBrandList> {
  List<ShopByBrands> mList = <ShopByBrands>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mList = widget.list;
    print('ShopByBrandList: ${mList.length}');
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
                  AppString.Shop_by_Brand,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColor.black),
                ),
                Text(
                  AppString.ViewAll,
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: AppColor.color_3F9ACC,
                      decoration: TextDecoration.underline),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 72,
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(width: 8);
                },
                itemCount: mList.length, // Number of items in your list
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  var model = mList[index];

                  return DiscountBannerItem(
                    model: model,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DiscountBannerItem extends StatelessWidget {
  const DiscountBannerItem({super.key, required this.model});

  final ShopByBrands model;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 104,
      decoration: BoxDecoration(
          border: Border.all(color: AppColor.color_DDDDDD),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.network(
          model.brandImage ?? "no image",
          height: 72,
          width: 104
        ),
      ),
    );
  }
}
