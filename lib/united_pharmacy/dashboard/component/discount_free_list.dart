import 'package:flutter/material.dart';
import 'package:learning_flutter/theme/color.dart';
import 'package:learning_flutter/united_pharmacy/model/response/home/HomePageFirstResponse.dart';

class DiscountFreeList extends StatefulWidget {
  const DiscountFreeList({super.key});

  @override
  State<DiscountFreeList> createState() => _DiscountFreeListState();
}

class _DiscountFreeListState extends State<DiscountFreeList> {
  List<Banners> mList = <Banners>[
    Banners(
      url:
          "https://unitedpharmacy.sa/media/mobikul/carouselimages/File-1726561288.jpg",
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
          "https://unitedpharmacy.sa/media/mobikul/carouselimages/File-1726561388.jpg",
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
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 8);
      },
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: mList.length, // Number of items in your list
      itemBuilder: (BuildContext context, int index) {
        var model = mList[index];

        return DiscountBannerItem(
          model: model,
        );
      },
    );
  }
}

class DiscountBannerItem extends StatelessWidget {
  const DiscountBannerItem({super.key, required this.model});

  final Banners model;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.network(model.url ?? "no image",
          height: 112, width: double.infinity, fit: BoxFit.cover,),
    );
  }
}
