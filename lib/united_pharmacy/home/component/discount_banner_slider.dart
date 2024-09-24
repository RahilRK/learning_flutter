import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:learning_flutter/theme/color.dart';
import 'package:learning_flutter/united_pharmacy/model/response/home/HomePageFirstResponse.dart';

class DiscountBannerSlider extends StatefulWidget {
  const DiscountBannerSlider({super.key, required this.list});

  final List<Banners> list;

  @override
  State<DiscountBannerSlider> createState() => _DiscountBannerSliderState();
}

late List<String> imgList;

class _DiscountBannerSliderState extends State<DiscountBannerSlider> {
  late List<Banners> mList;
  List<Widget> imageSliders = [];
  int _current = 0;
  final int _indicatorSize = 5;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mList = [];
    imgList = [];
    mList = widget.list;

    for (final model in mList) {
      var mUrl = model.url;
      imgList.add(mUrl ?? "no image");
    }
    print('DiscountBannerSlider: ${imgList.length}');

    imageSliders = imgList
        .map((item) => ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        child: Stack(
          children: <Widget>[
            Image.network(item, fit: BoxFit.fitHeight, width: 1000.0),
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
                              autoPlay: true,
                              aspectRatio: 16/6,
                              enlargeCenterPage: false,
                              viewportFraction: 1,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _current = index;
                                });
                              }),
                        ),
                      ),
                    ]),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: _indicatorSize * imgList.length.toDouble() + 16,
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 0),
                          blurRadius: 2,
                          spreadRadius: 2,
                          color: Colors.black26,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imgList.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () => _controller.animateToPage(entry.key),
                          child: Container(
                            width: 4,
                            height: 6,
                            margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 1.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _current == entry.key
                                    ? AppColor.color_3F9ACC
                                    : AppColor.color_A1A1A1),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
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
