import 'package:flutter/material.dart';
import 'package:learning_flutter/theme/color.dart';
import 'package:learning_flutter/united_pharmacy/model/response/home/HomePageFirstResponse.dart';

class OurServiceList extends StatefulWidget {
  const OurServiceList({super.key});

  @override
  State<OurServiceList> createState() => _OurServiceListState();
}

class _OurServiceListState extends State<OurServiceList> {
  List<Banners> mList = <Banners>[
    Banners(
      url:
          "https://unitedpharmacy.sa/media/mobikul/carouselimages/File-1725620682.jpg",
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
          "https://unitedpharmacy.sa/media/mobikul/carouselimages/File-1725620745.jpg",
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
          "https://unitedpharmacy.sa/media/mobikul/carouselimages/File-1725620781.jpg",
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
          "https://unitedpharmacy.sa/media/mobikul/carouselimages/File-1725620829.jpg",
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
      "https://unitedpharmacy.sa/media/mobikul/carouselimages/File-1725620682.jpg",
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
      "https://unitedpharmacy.sa/media/mobikul/carouselimages/File-1725620745.jpg",
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
      "https://unitedpharmacy.sa/media/mobikul/carouselimages/File-1725620781.jpg",
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
      "https://unitedpharmacy.sa/media/mobikul/carouselimages/File-1725620829.jpg",
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
      "https://unitedpharmacy.sa/media/mobikul/carouselimages/File-1725620682.jpg",
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
      "https://unitedpharmacy.sa/media/mobikul/carouselimages/File-1725620745.jpg",
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
      "https://unitedpharmacy.sa/media/mobikul/carouselimages/File-1725620781.jpg",
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
      "https://unitedpharmacy.sa/media/mobikul/carouselimages/File-1725620829.jpg",
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
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
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
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
            model.url ?? "no image",
            fit: BoxFit.cover,
            height: 150,
            width: 108
        ),
      ),
    );
  }
}
