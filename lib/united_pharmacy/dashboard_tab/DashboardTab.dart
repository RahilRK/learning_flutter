import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:flutter/material.dart';
import 'package:learning_flutter/theme/color.dart';
import 'package:learning_flutter/united_pharmacy/home/Home.dart';

import '../../theme/string.dart';

class DashboardTab extends StatefulWidget {
  const DashboardTab({super.key});

  @override
  State<DashboardTab> createState() => _DashboardTabState();
}

const List<TabItem> items = [
  TabItem(
    icon: Icons.home_outlined,
    title: AppString.Home,
  ),
  TabItem(
    icon: Icons.grid_view_outlined,
    title: AppString.Categories,
  ),
  TabItem(
    icon: Icons.percent,
    title: AppString.Offers,
  ),
  TabItem(
    icon: Icons.notifications_none_rounded,
    title: AppString.Notifications,
  ),
  TabItem(
    icon: Icons.person_outline_outlined,
    title: AppString.Profile,
  ),
];

List<Widget> pageList = [
  const Home(),
  const Center(child: Text(AppString.Categories),),
  const Center(child: Text(AppString.Offers),),
  const Center(child: Text(AppString.Notifications),),
  const Center(child: Text(AppString.Profile),),
];

class _DashboardTabState extends State<DashboardTab> {

  int visit = 0;
  double height = 30;
  Color colorSelect =const Color(0XFF0686F8);
  Color color = const Color(0XFF7AC0FF);
  Color color2 = const Color(0XFF96B1FD);
  Color bgColor = const  Color(0XFF1752FE);

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
                const SizedBox(width: 4),
                const Text(
                  'En',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColor.color_3F9ACC),
                ),
                const SizedBox(width: 4),
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
      body: pageList.elementAt(visit),
      bottomNavigationBar: BottomBarInspiredOutside(
        items: items,
        backgroundColor: AppColor.white,
        color: AppColor.color_92949F,//label & icon color
        colorSelected: AppColor.white,//selected icon color
        indexSelected: visit,
        onTap: (int index) => setState(() {
          visit = index;
        }),
        top: -28,
        animated: false,
        itemStyle: ItemStyle.circle,
        chipStyle: const ChipStyle(notchSmoothness: NotchSmoothness.softEdge, background: AppColor.color_0A195C),
      ),
    );
  }
}
