import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:learning_flutter/united_pharmacy/model/response/home/HomePageFirstResponse.dart';

class BannerSlider extends StatefulWidget {
  const BannerSlider({super.key});

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class _BannerSliderState extends State<BannerSlider> {

  List<BannerImages> bannerImages = <BannerImages>[
    BannerImages(
      url : "https://unitedpharmacy.sa/media/mobikul/bannerimages/File-1726062424.jpg",
      mainid : "774",
      dominantColor : "#48a59d",
      bannerType : "category",
      startDate : "2024-09-11 00:00:00",
      endDate : "2024-09-17 00:00:00",
      id : "5042",
      name : "United Offers"
    ),
    BannerImages(
        url : "https://unitedpharmacy.sa/media/mobikul/bannerimages/File-1726062479.jpg",
        mainid : "774",
        dominantColor : "#48a59d",
        bannerType : "category",
        startDate : "2024-09-11 00:00:00",
        endDate : "2024-09-17 00:00:00",
        id : "5042",
        name : "United Offers"
    ),
    BannerImages(
        url : "https://unitedpharmacy.sa/media/mobikul/bannerimages/File-1723542177.jpg",
        mainid : "774",
        dominantColor : "#48a59d",
        bannerType : "category",
        startDate : "2024-09-11 00:00:00",
        endDate : "2024-09-17 00:00:00",
        id : "5042",
        name : "United Offers"
    ),
    BannerImages(
        url : "https://unitedpharmacy.sa/media/mobikul/bannerimages/File-1726058701.jpg",
        mainid : "774",
        dominantColor : "#48a59d",
        bannerType : "category",
        startDate : "2024-09-11 00:00:00",
        endDate : "2024-09-17 00:00:00",
        id : "5042",
        name : "United Offers"
    ),
    BannerImages(
        url : "https://unitedpharmacy.sa/media/mobikul/bannerimages/File-1725888725.jpg",
        mainid : "774",
        dominantColor : "#48a59d",
        bannerType : "category",
        startDate : "2024-09-11 00:00:00",
        endDate : "2024-09-17 00:00:00",
        id : "5042",
        name : "United Offers"
    ),
  ];
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  final List<Widget> imageSliders = imgList
      .map((item) => Container(
    child: Container(
      // margin: EdgeInsets.all(5.0),
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Image.network(item, fit: BoxFit.fill, width: 1000.0),
            ],
          )),
    ),
  ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        CarouselSlider(
          items: imageSliders,
          carouselController: _controller,
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 1,
              // disableCenter: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                        ? Colors.blue
                        : Colors.red)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ]),
    );
  }
}