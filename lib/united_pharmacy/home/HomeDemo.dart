import 'package:flutter/material.dart';
import 'package:learning_flutter/theme/color.dart';
import 'package:learning_flutter/theme/string.dart';
import 'package:learning_flutter/united_pharmacy/api_helper.dart';
import 'package:learning_flutter/united_pharmacy/home/component/banner_slider.dart';
import 'package:learning_flutter/united_pharmacy/home/component/best_deals.dart';
import 'package:learning_flutter/united_pharmacy/home/component/products_list.dart';
import 'package:learning_flutter/united_pharmacy/home/component/discount_banner_slider.dart';
import 'package:learning_flutter/united_pharmacy/home/component/discount_banner_slider_two.dart';
import 'package:learning_flutter/united_pharmacy/home/component/discount_free_list.dart';
import 'package:learning_flutter/united_pharmacy/home/component/discount_list.dart';
import 'package:learning_flutter/united_pharmacy/home/component/exclusive_offers.dart';
import 'package:learning_flutter/united_pharmacy/home/component/explore_offers_banner_slider.dart';
import 'package:learning_flutter/united_pharmacy/home/component/explore_offers_banner_slider_two.dart';
import 'package:learning_flutter/united_pharmacy/home/component/our_service_list.dart';
import 'package:learning_flutter/united_pharmacy/home/component/shop_by_brand_list.dart';
import 'package:learning_flutter/united_pharmacy/model/request/HomePageDataFirstRequest.dart';
import 'package:learning_flutter/united_pharmacy/model/response/home/HomePageFirstResponse.dart';
import 'package:learning_flutter/united_pharmacy/model/response/home/HomePageSecondResponse.dart';
import 'package:lottie/lottie.dart';
import 'package:text_marquee/text_marquee.dart';

import 'component/category.dart';

class HomeDemo extends StatefulWidget {
  const HomeDemo({super.key});

  @override
  State<HomeDemo> createState() => _HomeDemoState();
}

var homePageDataFirstRequest = HomePageDataFirstRequest(
    currency: "SAR",
    websiteId: "1",
    width: "1080.000000",
    isHomeBrands: "1",
    eTag: "",
    city: "Jeddah",
    storeId: "1",
    quoteId: "0",
    os: "android");

late ScrollController _scrollListener;
var reachedAtBottomIsCalled = false;
List<Widget> mWidgetList = <Widget>[];

late BuildContext dialogContext;

class _HomeDemoState extends State<HomeDemo> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print("HomeDemo: initState");

    // Setup the listener.
    _scrollListener = ScrollController();
    print("HomeDemo: init _scrollListener");
    _scrollListener.addListener(() {
      if (_scrollListener.position.atEdge) {
        bool isTop = _scrollListener.position.pixels == 0;
        if (isTop) {
          print('At the top');
        } else {
          if(!reachedAtBottomIsCalled) {
            reachedAtBottomIsCalled = true;

            print('Reached the bottom of the list');
            showProgress();

            setState(() {
              mWidgetList.add(apiCallHomePartTwo());
            });
            print('mWidgetList size: ${mWidgetList.length}');
          }
        }
      }
    });
  }

  @override
  void dispose() {

    print("HomeDemo: dispose");
    print("HomeDemo: dispose _scrollListener");
    _scrollListener.dispose();
    mWidgetList.clear();
      super.dispose();
  }

  Future<void> _handleRefresh() async {
    // Simulate network fetch or database query
    // Update the list of items and refresh the UI
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    print("HomeDemo: build");

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: FutureBuilder(
            future: homepagedatafirst(homePageDataFirstRequest),
            builder: (context, snapshot) {

              if (snapshot.hasData) {

                if(mWidgetList.isEmpty) {
                  var response = snapshot.data ?? HomePageFirstResponse();
                  mWidgetList.add(loadPartOneHomeUI(response));
                }

                /*return PrimaryScrollController(
                    controller: _scrollListener,
                    child: ListView.builder(
                      itemCount: mWidgetList.length, // Number of items in your list
                      itemBuilder: (BuildContext context, int index) {
                        var model = mWidgetList[index];

                        return Container(
                          child: model,
                        );
                      },
                    ),
                  );*/

                // return SingleChildScrollView(
                return ListView.builder(
                  shrinkWrap: true,
                  controller: _scrollListener,
                  physics: AlwaysScrollableScrollPhysics(),
                  itemCount: mWidgetList.length, // Number of items in your list
                  itemBuilder: (BuildContext context, int index) {
                    var model = mWidgetList[index];
                    return model;
                  },
                );

              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              else {
                // return const Text('Something went wrong in homepagedatafirst');
                return const Text('');
              }
            }),
      ),
    );
  }

  void showProgress() {
    showDialog(
      context: context,
      builder: (context) {
        dialogContext = context;
        return Dialog(
          surfaceTintColor: const Color(0x00ffffff),
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.zero,
          child: Container(
              color: Colors.transparent,
              alignment: FractionalOffset.center,
              // height: 0.0,
              padding: const EdgeInsets.all(0.0),
              // child: Container(height: 32, width: 32, child: CircularProgressIndicator())),
              child: ClipOval(
                child: Lottie.asset(
                  "assets/animations/united_pharmacy_loader.json",
                  // Can add other properties on how you would like the anim to display
                  fit: BoxFit.cover,
                  width: 124,
                  height: 124,
                ),
              )),
        );
      },
      barrierColor: Colors.black38,
    );
  }
}

Widget loadPartOneHomeUI(HomePageFirstResponse response) {
  return ListView(
    // controller: scrollListener,
    shrinkWrap: true,
    physics: const ClampingScrollPhysics(),
    children: [
      // SearchView
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          height: 42,
          // width: 175,
          child: TextField(
            onChanged: (value) {},
            maxLines: 1,
            maxLength: 30,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              labelStyle: const TextStyle(
                // color: AppColor.color_B6B7B7,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
              hintText: AppString.Search_for_products,
              counterText: "",
              // labelText: AppString.MobileNumber,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  'images/search.png',
                  height: 16,
                  width: 16,
                ),
              ),
              prefixIconColor: AppColor.color_92949F,
              filled: true,
              fillColor: AppColor.color_EEF2F3,
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 6,
      ),
      Container(
        color: AppColor.color_D5EDFF,
        child: Padding(
          padding:
          const EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                  child: Row(
                    children: [
                      Image.asset(
                        'images/location_marker.png',
                        height: 24,
                        width: 16,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppString.Deliver_to,
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.normal),
                          ),
                          Text(
                            AppString.Products_availability,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: AppColor.color_45474F),
                          )
                        ],
                      ),
                    ],
                  )),
              const Text(
                AppString.Change,
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                    color: AppColor.color_45474F,
                    decoration: TextDecoration.underline),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(
        height: 6,
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.color_F22C55,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Padding(
            padding:
            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextMarquee(
              AppString.Dont_miss,
              // response.configdata?.prefixtext?? AppString.Dont_miss,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: AppColor.white),
              rtl: false,
              delay: Duration(seconds: 2),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 12,
      ),

      // CategoryList
      CategoryList(list: response.featuredCategories ?? []),

      // BannerSlider
      BannerSlider(list: response.bannerImages ?? [],),

      // DiscountList
      DiscountList(list: response.carousel?[1].banners ?? [],),

      // DiscountBannerSlider
      DiscountBannerSlider(list: response.carousel?[2].banners ?? [],),
    ],
  );
}

Widget apiCallHomePartTwo() {

  return FutureBuilder(
      future: homepagedatasecond(homePageDataFirstRequest),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Navigator.pop(dialogContext);
          var response = snapshot.data ?? HomePageSecondResponse();
          return loadPartTwoHomeUI(response);
        } else if (snapshot.hasError) {
          Navigator.pop(dialogContext);
          return Text('${snapshot.error}');
        }
        else {
          // return const Text('Something went wrong in homepagedatasecond');
          return const Text('');
        }
      });
}

Widget loadPartTwoHomeUI(HomePageSecondResponse response) {
  return ListView(
    // controller: scrollListener,
    shrinkWrap: true,
    physics: const ClampingScrollPhysics(),
    children: [
      // OurServiceList
      OurServiceList(list: response.carousel?[7].banners??[],),

      // BestSelling ProductsList
      ProductsList(title: response.carousel?[3].label??"", list: response.carousel?[3].productList??[]),

      // ExploreOffersBannerSlider
      ExploreOffersBannerSlider(list: response.carousel?[8].banners??[]),

      // Shop by Brand List
      ShopByBrandList(list: response.shopByBrands??[]),

      // BestDeals
      BestDeals(list: response.carousel?[4].banners??[]),

      // DiscountBannerSliderTwo
      DiscountBannerSliderTwo(list: response.carousel?[6].banners??[]),

      //Hair Care ProductsList
      ProductsList(title: response.carousel?[0].label??"", list: response.carousel?[0].productList??[]),

      //Beauty & Skin Care ProductsList
      ProductsList(title: response.carousel?[1].label??"", list: response.carousel?[1].productList??[]),

      // DiscountFreeList
      DiscountFreeList(list: response.carousel?[5].banners??[]),

      //Baby & Mom Care ProductsList
      ProductsList(title: response.carousel?[2].label??"", list: response.carousel?[2].productList??[]),

      // Exclusive Offers
      ExclusiveOffers(list: response.carousel?[9].banners??[]),

      // ExploreOffersBannerSliderTwo
      ExploreOffersBannerSliderTwo(list: response.carousel?[10].banners??[]),
    ],
  );
}
