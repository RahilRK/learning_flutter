import 'package:flutter/material.dart';
import 'package:learning_flutter/theme/color.dart';
import 'package:learning_flutter/united_pharmacy/model/response/home/HomePageSecondResponse.dart';

import '../../../theme/string.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({super.key, required this.title, required this.list});
  final String title;
  final List<ProductList> list;

  @override
  State<ProductsList> createState() =>
      _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  String mTitle = "";
  List<ProductList> mList = <ProductList>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mTitle = widget.title;
    mList = widget.list;
    print('ProductsList: title: $mTitle, mList: ${mList.length}');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                mTitle,
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
            height: 280,
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
        SizedBox(
          height: 16,
        ),
      ],
    );
  }
}

class DiscountBannerItem extends StatelessWidget {
  const DiscountBannerItem({super.key, required this.model});

  final ProductList model;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      decoration: BoxDecoration(
        border: Border.all(
            color: AppColor.color_A1A1A1,
            width: 0.5
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(4),
      child: Column(
        children: [
          Container(
            height: 150,
            child: Stack(
              children: [
                // Product Image
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.network(
                    model.thumbNail ?? "no image",
                    // Replace with the product image URL
                    // height: 100,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: 4),
                Align(
                  alignment: Alignment.topRight,
                  child: Column(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            color: AppColor.color_EEF2F3,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Image.asset(
                              'images/heart.png',
                              height: 20,
                              width: 20,
                            ),
                          )),
                      SizedBox(height: 16),
                      Container(
                          decoration: BoxDecoration(
                            color: AppColor.color_EEF2F3,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Image.asset(
                              'images/ic_share.png',
                              height: 20,
                              width: 20,
                            ),
                          )),
                    ],
                  ),
                ),
                // Online Exclusive Tag
                Visibility(
                  visible: model.isOfferApplicable??false,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColor.color_F22C55,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          model.offerLabel ?? "Save 45%",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 10),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          // Rating
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColor.color_45474F,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        // model.rating.toString()??"5",
                        "0",
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColor.white
                        ),
                      ),
                      SizedBox(width: 4,),
                      Image.asset(
                        'images/ic_star_rating.png',
                        height: 12,
                        width: 12,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    border: Border.all(
                      color: AppColor.color_A1A1A1,
                      width: 0.5
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Image.asset(
                      'images/add_cart.png',
                      height: 16,
                      width: 16,
                    ),
                  )),
            ],
          ),
          const SizedBox(height: 8),
          // Pricing
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                model.formattedPrice??"",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: model.price != model.finalPrice ? AppColor.color_F22C55: AppColor.black,
                  fontSize: 12,
                ),
              ),
              Visibility(
                visible:model.price != model.finalPrice,
                child: Text(
                  model.formattedFinalPrice??"",
                  style: TextStyle(
                    color: AppColor.black,
                    fontSize: 10,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Align(alignment: Alignment.centerRight, child: Image.network(model.shippingTypeImg??"no image", height: 20, width: 70, fit: BoxFit.fill,)),
          const SizedBox(height: 8),
          Text(model.name??"", style: TextStyle(fontSize: 12, color: AppColor.black), maxLines: 2,)
        ],
      ),
    );
  }
}
