import 'package:flutter/material.dart';
import 'package:learning_flutter/theme/color.dart';
import 'package:learning_flutter/theme/string.dart';
import 'package:learning_flutter/united_pharmacy/dashboard/component/banner_slider.dart';
import 'package:learning_flutter/united_pharmacy/dashboard/component/discount_banner_slider.dart';
import 'package:learning_flutter/united_pharmacy/dashboard/component/discount_list.dart';
import 'package:learning_flutter/united_pharmacy/dashboard/component/explore_offers_banner_slider.dart';
import 'package:learning_flutter/united_pharmacy/dashboard/component/our_service_list.dart';
import 'package:learning_flutter/united_pharmacy/dashboard/component/shop_by_brand_list.dart';
import 'package:text_marquee/text_marquee.dart';

import 'component/category.dart';

class DashboardTab extends StatefulWidget {
  const DashboardTab({super.key});

  @override
  State<DashboardTab> createState() => _DashboardTabState();
}

class _DashboardTabState extends State<DashboardTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 8, bottom: 8),
          child: Image.asset(
            'images/home_applogo.png',
            fit: BoxFit.fill,
          ),
        ),
        leadingWidth: 140,
        backgroundColor: AppColor.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(
                left: 16.0, right: 8, top: 16, bottom: 16),
            child: Row(
              children: [
                Image.asset(
                  'images/translation.png',
                  fit: BoxFit.fill,
                  // height: 24,
                  // width: 24,
                ),
                SizedBox(width: 4),
                Text(
                  'En',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColor.color_3F9ACC),
                ),
                SizedBox(width: 4),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Image.asset(
                    'images/angle_small_down.png',
                    fit: BoxFit.fill,
                    // height: 24,
                    // width: 24,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 16.0, right: 8, top: 16, bottom: 16),
            child: Image.asset(
              'images/heart.png',
              fit: BoxFit.fill,
              // height: 24,
              // width: 24,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(
              16.0,
            ),
            child: Image.asset(
              'images/cart.png',
              fit: BoxFit.fill,
              // height: 24,
              // width: 24,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          // SearchView
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16),
            child: TextField(
              onChanged: (value) {},
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(32),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                labelStyle: TextStyle(
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
          SizedBox(
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
                      SizedBox(
                        width: 10,
                      ),
                      Column(
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
                  Text(
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
          SizedBox(
            height: 6,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.color_F22C55,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextMarquee(
                  AppString.Dont_miss,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColor.white),
                  rtl: false,
                  delay: Duration(seconds: 1),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
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
          SizedBox(
            height: 8,
          ),
          // CategoryList
          CategoryList(),
          SizedBox(
            height: 0,
          ),
          // BannerSlider
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
                child: BannerSlider()),
          ),
          SizedBox(
            height: 16,
          ),
          // DiscountList
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: DiscountList(),
          ),
          SizedBox(
            height: 16,
          ),
          // DiscountBannerSlider
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: DiscountBannerSlider(),
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
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
          SizedBox(
            height: 8,
          ),
          // OurServiceList
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: OurServiceList(),
          ),
          SizedBox(
            height: 16,
          ),
          // ExploreOffersBannerSlider
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
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
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ExploreOffersBannerSlider(),
          ),
          SizedBox(
            height: 16,
          ),
          // Shop by Brand List
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
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
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ShopByBrandList(),
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
