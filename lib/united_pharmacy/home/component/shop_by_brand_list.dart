import 'package:flutter/material.dart';
import 'package:learning_flutter/theme/color.dart';
import 'package:learning_flutter/united_pharmacy/model/response/home/HomePageFirstResponse.dart';

class ShopByBrandList extends StatefulWidget {
  const ShopByBrandList({super.key});

  @override
  State<ShopByBrandList> createState() => _ShopByBrandListState();
}

class _ShopByBrandListState extends State<ShopByBrandList> {
  List<Banners> mList = <Banners>[
    Banners(
      url:
          "https://unitedpharmacy.sa/media/amasty/shopby/option_images/slider/ARS_small_Copy_.png",
      title: "Buy 3 Pieces To Get Extra Discount 10%",
      bannerType: "category",
      dominantColor: "#81c0b6",
      startDate: "2024-07-12 14:15:00",
      endDate: "2024-12-31 14:15:00",
      imgTitle: "Buy 3 Pieces",
      subTitle: "Extra Discount 10%",
      id: "5182",
      name: "Buy 3 Pieces And Get 10% Extra Discount",
    ),
    Banners(
      url:
          "https://unitedpharmacy.sa/media/amasty/shopby/option_images/slider/20_1.jpg",
      title: "Buy 3 Pieces To Get Extra Discount 10%",
      bannerType: "category",
      dominantColor: "#81c0b6",
      startDate: "2024-07-12 14:15:00",
      endDate: "2024-12-31 14:15:00",
      imgTitle: "Buy 2 Pieces",
      subTitle: "Extra Discount 10%",
      id: "5182",
      name: "Buy 2 Pieces And Get 10% Extra Discount",
    ),
    Banners(
      url:
          "https://unitedpharmacy.sa/media/amasty/shopby/option_images/slider/16_3.jpg",
      title: "Buy 3 Pieces To Get Extra Discount 10%",
      bannerType: "category",
      dominantColor: "#81c0b6",
      startDate: "2024-07-12 14:15:00",
      endDate: "2024-12-31 14:15:00",
      imgTitle: "Buy 3 Pieces",
      subTitle: "Extra Discount 15%",
      id: "5182",
      name: "Buy 3 Pieces And Get 15% Extra Discount",
    ),
    Banners(
      url:
          "https://unitedpharmacy.sa/media/amasty/shopby/option_images/slider/122_1_.jpg",
      title: "Buy 3 Pieces To Get Extra Discount 10%",
      bannerType: "category",
      dominantColor: "#81c0b6",
      startDate: "2024-07-12 14:15:00",
      endDate: "2024-12-31 14:15:00",
      imgTitle: "Buy 2 Pieces",
      subTitle: "Extra Discount 15%",
      id: "5182",
      name: "Buy 2 Pieces And Get 15% Extra Discount",
    ),
    Banners(
      url:
          "https://unitedpharmacy.sa/media/amasty/shopby/option_images/slider/1_3.jpg",
      title: "Buy 3 Pieces To Get Extra Discount 10%",
      bannerType: "category",
      dominantColor: "#81c0b6",
      startDate: "2024-07-12 14:15:00",
      endDate: "2024-12-31 14:15:00",
      imgTitle: "15%",
      subTitle: "Extra Discount",
      id: "5182",
      name: "Get Extra Discount 15%",
    ),
    Banners(
      url:
          "https://unitedpharmacy.sa/media/amasty/shopby/option_images/slider/2_2.jpg",
      title: "Buy 3 Pieces To Get Extra Discount 10%",
      bannerType: "category",
      dominantColor: "#81c0b6",
      startDate: "2024-07-12 14:15:00",
      endDate: "2024-12-31 14:15:00",
      imgTitle: "15%",
      subTitle: "Extra Discount",
      id: "5182",
      name: "Get Extra Discount 15%",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}

class DiscountBannerItem extends StatelessWidget {
  const DiscountBannerItem({super.key, required this.model});

  final Banners model;

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
          model.url ?? "no image",
          height: 72,
          width: 104
        ),
      ),
    );
  }
}
