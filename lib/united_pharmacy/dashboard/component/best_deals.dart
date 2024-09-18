import 'package:flutter/material.dart';
import 'package:learning_flutter/theme/color.dart';
import 'package:learning_flutter/united_pharmacy/model/response/home/HomePageFirstResponse.dart';

class BestDeals extends StatefulWidget {
  const BestDeals({super.key});

  @override
  State<BestDeals> createState() => _BestDealsState();
}

class _BestDealsState extends State<BestDeals> {
  List<Banners> mList = <Banners>[
    Banners(
        url:
            "https://unitedpharmacy.sa/media/mobikul/carouselimages/File-1726559390.jpg",
        title: "Best Deals Offline",
        bannerType: "category",
        dominantColor: "#deaa9f",
        startDate: "2024-09-18 00:00:00",
        endDate: "2024-09-30 23:59:00",
        imgTitle: null,
        subTitle: null,
        id: "5081",
        name: "Mouth Wash Offers"),
    Banners(
        url:
            "https://unitedpharmacy.sa/media/mobikul/carouselimages/File-1726559544.jpg",
        title: "Best Deals Offline",
        bannerType: "category",
        dominantColor: "#deaa9f",
        startDate: "2024-09-18 00:00:00",
        endDate: "2024-09-30 23:59:00",
        imgTitle: null,
        subTitle: null,
        id: "5081",
        name: "Mouth Wash Offers"),
    Banners(
        url:
            "https://unitedpharmacy.sa/media/mobikul/carouselimages/File-1726559704.jpg",
        title: "Best Deals Offline",
        bannerType: "category",
        dominantColor: "#deaa9f",
        startDate: "2024-09-18 00:00:00",
        endDate: "2024-09-30 23:59:00",
        imgTitle: null,
        subTitle: null,
        id: "5081",
        name: "Mouth Wash Offers"),
    Banners(
        url:
            "https://unitedpharmacy.sa/media/mobikul/carouselimages/File-1726559826.jpg",
        title: "Best Deals Offline",
        bannerType: "category",
        dominantColor: "#deaa9f",
        startDate: "2024-09-18 00:00:00",
        endDate: "2024-09-30 23:59:00",
        imgTitle: null,
        subTitle: null,
        id: "5081",
        name: "Mouth Wash Offers"),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
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