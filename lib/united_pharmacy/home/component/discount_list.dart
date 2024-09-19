import 'package:flutter/material.dart';
import 'package:learning_flutter/theme/color.dart';
import 'package:learning_flutter/united_pharmacy/model/response/home/HomePageFirstResponse.dart';

class DiscountList extends StatefulWidget {
  const DiscountList({super.key});

  @override
  State<DiscountList> createState() => _DiscountListState();
}

class _DiscountListState extends State<DiscountList> {
  List<Banners> mList = <Banners>[
    Banners(
      url:
          "https://unitedpharmacy.sa/media/mobikul/carouselimages/File-1720782956.jpg",
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
          "https://unitedpharmacy.sa/media/mobikul/carouselimages/File-1720783213.jpg",
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
          "https://unitedpharmacy.sa/media/mobikul/carouselimages/File-1720783376.jpg",
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
          "https://unitedpharmacy.sa/media/mobikul/carouselimages/File-1720783549.jpg",
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
          "https://unitedpharmacy.sa/media/mobikul/carouselimages/File-1720783716.jpg",
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
      height: 166,
      child: ListView.builder(
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
    return Card(
      color: AppColor.color_83D4D7,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8), topRight: Radius.circular(8),
        bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)
      )),
      // elevation: 4,
      child: SizedBox(
        width: 118,
        child: Column(
          children: [
            Container(
              color: AppColor.color_83D4D7,
              child: Image.network(
                model.url ?? "no image",
                height: 110,
                width: 78
              ),
            ),

            Card(
              margin: EdgeInsets.zero,
              clipBehavior: Clip.antiAlias,
              color: AppColor.color_2CA2A7,
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)
              )),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(model.imgTitle??"", style: const TextStyle(color: AppColor.white, fontSize: 12, fontWeight: FontWeight.bold),),
                    ),
                    const SizedBox(height: 4,),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(model.subTitle??"", style: const TextStyle(color: AppColor.white, fontSize: 10, fontWeight: FontWeight.normal),),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
