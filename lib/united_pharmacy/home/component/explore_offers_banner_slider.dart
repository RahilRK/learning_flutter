import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:learning_flutter/united_pharmacy/model/response/home/HomePageFirstResponse.dart';

import '../../../theme/color.dart';
import '../../../theme/string.dart';

class ExploreOffersBannerSlider extends StatefulWidget {
  const ExploreOffersBannerSlider({super.key});

  @override
  State<ExploreOffersBannerSlider> createState() => _ExploreOffersBannerSliderState();
}

final List<String> imgList = [
  'https://unitedpharmacy.sa/media/mobikul/carouselimages/File-1726563182.jpg',
  'https://unitedpharmacy.sa/media/mobikul/carouselimages/File-1726563369.jpg',
];

class _ExploreOffersBannerSliderState extends State<ExploreOffersBannerSlider> {
  List<BannerImages> bannerImages = <BannerImages>[
    BannerImages(
        url:
            "https://unitedpharmacy.sa/media/mobikul/bannerimages/File-1726062424.jpg",
        mainid: "774",
        dominantColor: "#48a59d",
        bannerType: "category",
        startDate: "2024-09-11 00:00:00",
        endDate: "2024-09-17 00:00:00",
        id: "5042",
        name: "United Offers"),
    BannerImages(
        url:
            "https://unitedpharmacy.sa/media/mobikul/bannerimages/File-1726062479.jpg",
        mainid: "774",
        dominantColor: "#48a59d",
        bannerType: "category",
        startDate: "2024-09-11 00:00:00",
        endDate: "2024-09-17 00:00:00",
        id: "5042",
        name: "United Offers"),
    BannerImages(
        url:
            "https://unitedpharmacy.sa/media/mobikul/bannerimages/File-1723542177.jpg",
        mainid: "774",
        dominantColor: "#48a59d",
        bannerType: "category",
        startDate: "2024-09-11 00:00:00",
        endDate: "2024-09-17 00:00:00",
        id: "5042",
        name: "United Offers"),
    BannerImages(
        url:
            "https://unitedpharmacy.sa/media/mobikul/bannerimages/File-1726058701.jpg",
        mainid: "774",
        dominantColor: "#48a59d",
        bannerType: "category",
        startDate: "2024-09-11 00:00:00",
        endDate: "2024-09-17 00:00:00",
        id: "5042",
        name: "United Offers"),
    BannerImages(
        url:
            "https://unitedpharmacy.sa/media/mobikul/bannerimages/File-1725888725.jpg",
        mainid: "774",
        dominantColor: "#48a59d",
        bannerType: "category",
        startDate: "2024-09-11 00:00:00",
        endDate: "2024-09-17 00:00:00",
        id: "5042",
        name: "United Offers"),
  ];
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final List<Widget> imageSliders = imgList
      .map((item) => ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          child: Image.network(item, fit: BoxFit.cover, width: 1000.0)))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppString.ExploreOffers,
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
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: CarouselSlider(
                        items: imageSliders,
                        carouselController: _controller,
                        options: CarouselOptions(
                            aspectRatio: 16/5.5,
                            enlargeCenterPage: true,
                            viewportFraction: 1,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            }),
                      ),
                    ),
                  ]),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
