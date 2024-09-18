import 'package:flutter/material.dart';
import 'package:learning_flutter/theme/color.dart';
import 'package:learning_flutter/united_pharmacy/model/response/home/HomePageFirstResponse.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

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
  ];

  final AutoScrollController controller = AutoScrollController();
  int _currentFocusedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 140,
          child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(width: 8);
            },
            padding: EdgeInsets.zero,
            controller: controller,
            itemCount: mList.length, // Number of items in your list
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              var model = mList[index];

              /*return DiscountBannerItem(
                model: model,
              );*/

              return mItem(model, index);
            },
          ),
        ),
        Positioned(
            left: 0,
            child: InkWell(
                onTap: () {
                  if (_currentFocusedIndex > 0) {
                    _currentFocusedIndex--;
                    if (_currentFocusedIndex < 0) {
                      _currentFocusedIndex = mList.length - 1;
                    }

                    controller.scrollToIndex(_currentFocusedIndex,
                        preferPosition: AutoScrollPosition.begin);

                    setState(() {});
                    print('_currentFocusedIndex: $_currentFocusedIndex');
                  } else {
                    print('Done');
                  }
                },
                child: Image.asset(
                  'images/slider_back_button.png',
                  height: 42,
                  width: 42,
                ))),
        Positioned(
            right: 0,
            child: InkWell(
              onTap: () {
                if (_currentFocusedIndex < mList.length - 1) {
                  _currentFocusedIndex++;
                  if (_currentFocusedIndex > mList.length) {
                    _currentFocusedIndex = 0;
                  }
                  controller.scrollToIndex(_currentFocusedIndex,
                      preferPosition: AutoScrollPosition.begin);
                  setState(() {});
                  print('_currentFocusedIndex: $_currentFocusedIndex');
                } else {
                  print('Done');
                }
              },
              child: Image.asset(
                'images/slider_forward_button.png',
                height: 42,
                width: 42,
              ),
            )),
      ],
    );
  }

  Widget mItem(Banners model, int index) {
    return AutoScrollTag(
      key: ValueKey(index),
      controller: controller,
      index: index,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(model.url ?? "no image",
            fit: BoxFit.cover, height: 140, width: 110),
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
        child: Image.network(model.url ?? "no image",
            fit: BoxFit.cover, height: 150, width: 100),
      ),
    );
  }
}
