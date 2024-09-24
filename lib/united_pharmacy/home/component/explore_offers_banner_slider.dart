import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:learning_flutter/united_pharmacy/model/response/home/HomePageSecondResponse.dart';
import '../../../theme/color.dart';
import '../../../theme/string.dart';

class ExploreOffersBannerSlider extends StatefulWidget {
  const ExploreOffersBannerSlider({super.key, required this.list});

  final List<Banners> list;

  @override
  State<ExploreOffersBannerSlider> createState() => _ExploreOffersBannerSliderState();
}

final List<String> imgList = [];

class _ExploreOffersBannerSliderState extends State<ExploreOffersBannerSlider> {
  List<Banners> mList = [];
  List<Widget> imageSliders = [];
  int _current = 0;
  final int _indicatorSize = 5;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mList = widget.list;

    for (final model in mList) {
      var mUrl = model.url;
      imgList.add(mUrl ?? "no image");
    }
    print('BannerSlider: ${imgList.length}');

    imageSliders = imgList
        .map((item) => ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        child: Stack(
          children: <Widget>[
            Image.network(item, fit: BoxFit.cover, width: 1000.0),
          ],
        )))
        .toList();
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
      ),
    );
  }
}
