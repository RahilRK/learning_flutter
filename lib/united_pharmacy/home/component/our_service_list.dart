import 'package:flutter/material.dart';
import 'package:learning_flutter/united_pharmacy/model/response/home/HomePageSecondResponse.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../../theme/color.dart';
import '../../../theme/string.dart';

class OurServiceList extends StatefulWidget {
  const OurServiceList({super.key, required this.list});
  final List<Banners> list;

  @override
  State<OurServiceList> createState() => _OurServiceListState();
}

class _OurServiceListState extends State<OurServiceList> {
  List<Banners> mList = <Banners>[];

  final AutoScrollController controller = AutoScrollController();
  int _currentFocusedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mList = widget.list;
    print('OurServiceList: ${mList.length}');
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
                  AppString.OurServices,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColor.black),
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
                SizedBox(
                  height: 140,
                  child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(width: 8);
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
            ),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
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
