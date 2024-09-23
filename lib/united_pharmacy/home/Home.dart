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
import 'package:text_marquee/text_marquee.dart';

import 'component/category.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
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

class _HomeState extends State<Home> {
  /*var homePageDataFirstRequest = HomePageDataFirstRequest(
      currency: "SAR",
      websiteId: "1",
      width: "1080.000000",
      isHomeBrands: "1",
      eTag: "",
      city: "Jeddah",
      storeId: "1",
      quoteId: "0",
      os: "android");*/
  late final ScrollController _scrollListener;
  var reachedAtBottomIsCalled = false;
  List<Widget> mWidgetList = <Widget>[];
  List<Widget> mWidgetListTwo = <Widget>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Setup the listener.
    _scrollListener = ScrollController();
    _scrollListener.addListener(() {
      if (_scrollListener.position.atEdge) {
        bool isTop = _scrollListener.position.pixels == 0;
        if (isTop) {
          print('At the top');
        } else {
          if(!reachedAtBottomIsCalled) {
            reachedAtBottomIsCalled = true;

            print('Reached the bottom of the list');
            /*setState(() {
              mWidgetList.add(apiCallHomePartTwo());
            });*/
            print('mWidgetList size: ${mWidgetList.length}');
          }
        }
      }
    });

    /*_scrollListener.addListener(() {
      if (_scrollListener.position.pixels ==
          _scrollListener.position.maxScrollExtent) {

        if(!reachedAtBottomIsCalled) {
          reachedAtBottomIsCalled = true;

          print('Reached the bottom of the list');
          setState(() {
            // mWidgetList.add(apiCallHomePartTwo());
            mWidgetList.add(apiCallHomePartTwo());
          });
          // print('mWidgetList size: ${mWidgetList.length}');
          print('mWidgetList size: ${mWidgetListTwo.length}');
        }
      }
    });*/
  }

  @override
  void dispose() {
    _scrollListener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*body: ListView(
        children: [
          // SearchView
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16),
            child: TextField(
              onChanged: (value) {},
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(32),
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
                                fontSize: 13, fontWeight: FontWeight.bold),
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
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.color_F22C55,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextMarquee(
                  AppString.Dont_miss,
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
          const Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppString.Shop_by_category,
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

          // CategoryList
          const CategoryList(),
          const SizedBox(
            height: 0,
          ),

          // BannerSlider
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
                child: const BannerSlider()),
          ),
          const SizedBox(
            height: 16,
          ),

          // DiscountList
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: DiscountList(),
          ),
          const SizedBox(
            height: 16,
          ),

          // DiscountBannerSlider
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: DiscountBannerSlider(),
          ),
          const SizedBox(
            height: 16,
          ),
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

          // OurServiceList
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: OurServiceList(),
          ),
          const SizedBox(
            height: 16,
          ),

          // BestSellingProductsList
          const Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppString.BestsellingProducts,
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
            child: BestSellingProductsList(),
          ),
          SizedBox(
            height: 16,
          ),

          // DiscountFreeList
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: DiscountFreeList(),
          ),
          const SizedBox(
            height: 16,
          ),

          // ExploreOffersBannerSlider
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: ExploreOffersBannerSlider(),
          ),
          const SizedBox(
            height: 16,
          ),

          // Shop by Brand List
          const Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppString.Shop_by_Brand,
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: ShopByBrandList(),
          ),

          // BestDeals
          const SizedBox(
            height: 16,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppString.Best_Deals,
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: BestDeals(),
          ),

          // DiscountBannerSliderTwo
          const SizedBox(
            height: 16,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: DiscountBannerSliderTwo(),
          ),

          // Exclusive Offers
          const SizedBox(
            height: 16,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppString.ExclusiveOffers,
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: ExclusiveOffers(),
          ),

          // ExploreOffersBannerSliderTwo
          const SizedBox(
            height: 16,
          ),
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: ExploreOffersBannerSliderTwo(),
          ),

          const SizedBox(
            height: 16,
          ),
        ],
      ),*/
      body: FutureBuilder(
          // future: homepagedatafirst(homePageDataFirstRequest),
          future: homepagedatasecond(homePageDataFirstRequest),
          builder: (context, snapshot) {

            if (snapshot.hasData) {

              if(mWidgetList.isEmpty) {
                /*var response = snapshot.data ?? HomePageFirstResponse();
                // return loadPartOneHomeUI(response, _scrollListener);
                mWidgetList.add(loadPartOneHomeUI(response));*/

                var response = snapshot.data ?? HomePageSecondResponse();
                // return loadPartOneHomeUI(response, _scrollListener);
                mWidgetList.add(loadPartTwoHomeUI(response));
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

              return SingleChildScrollView(
                controller: _scrollListener,
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: mWidgetList.length, // Number of items in your list
                      itemBuilder: (BuildContext context, int index) {
                        var model = mWidgetList[index];
                        return model;
                      },
                    ),

                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: mWidgetListTwo.length, // Number of items in your list
                      itemBuilder: (BuildContext context, int index) {
                        var model = mWidgetListTwo[index];
                        return model;
                      },
                    )
                  ],
                ),
              );

            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            else {
              return const Text('Something went wrong');
            }
          }),
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
        padding: const EdgeInsets.only(left: 16.0, right: 16),
        child: TextField(
          onChanged: (value) {},
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(32),
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
                                fontSize: 13, fontWeight: FontWeight.bold),
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
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.color_F22C55,
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Padding(
            padding:
            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextMarquee(
              AppString.Dont_miss,
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

      // OurServiceList
      /*const Padding(
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
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: OurServiceList(),
      ),
      const SizedBox(
        height: 16,
      ),

      // BestSellingProductsList
      const Padding(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppString.BestsellingProducts,
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
        child: BestSellingProductsList(),
      ),
      SizedBox(
        height: 16,
      ),

      // DiscountFreeList
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: DiscountFreeList(),
      ),
      const SizedBox(
        height: 16,
      ),

      // ExploreOffersBannerSlider
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
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: ExploreOffersBannerSlider(),
      ),
      const SizedBox(
        height: 16,
      ),

      // Shop by Brand List
      const Padding(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppString.Shop_by_Brand,
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
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: ShopByBrandList(),
      ),

      // BestDeals
      const SizedBox(
        height: 16,
      ),
      const Padding(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppString.Best_Deals,
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
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: BestDeals(),
      ),

      // DiscountBannerSliderTwo
      const SizedBox(
        height: 16,
      ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: DiscountBannerSliderTwo(),
      ),

      // Exclusive Offers
      const SizedBox(
        height: 16,
      ),
      const Padding(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppString.ExclusiveOffers,
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
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: ExclusiveOffers(),
      ),

      // ExploreOffersBannerSliderTwo
      const SizedBox(
        height: 16,
      ),
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
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: ExploreOffersBannerSliderTwo(),
      ),

      const SizedBox(
        height: 16,
      ),*/
    ],
  );
}

Widget apiCallHomePartTwo() {
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

  return FutureBuilder(
      future: homepagedatasecond(homePageDataFirstRequest),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container();
        }
        else if (snapshot.hasData) {
          var response = snapshot.data ?? HomePageSecondResponse();
          return loadPartTwoHomeUI(response);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        else {
          return const Text('Something went wrong');
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

      //Baby & Mom Care ProductsList
      ProductsList(title: response.carousel?[2].label??"", list: response.carousel?[2].productList??[]),

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
