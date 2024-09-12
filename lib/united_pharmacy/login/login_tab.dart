import 'package:flutter/material.dart';
import 'package:learning_flutter/theme/color.dart';
import 'package:learning_flutter/theme/string.dart';
import 'package:learning_flutter/united_pharmacy/login/email_tab.dart';
import 'package:learning_flutter/united_pharmacy/login/mobile_number_tab.dart';

class LoginTab extends StatefulWidget {
  const LoginTab({super.key});

  @override
  State<LoginTab> createState() => _LoginTabState();
}

class _LoginTabState extends State<LoginTab>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(initialIndex: 0, length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 212,
        elevation: 0,
        backgroundColor: AppColor.color_0A195C,
        title: Stack(
          children: [
            Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: (){
                    Navigator.pushReplacementNamed(context, '/DashboardTab');
                  },
                  child: Text(
                    AppString.Skip,
                    style: TextStyle(color: AppColor.white, fontSize: 14, fontWeight: FontWeight.normal),
                  ),
                )),
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                'images/login_banner.png',
                fit: BoxFit.fill,
                height: 145,
                width: 106,
                alignment: Alignment.center,
                // color: Colors.black12,
                // colorBlendMode: BlendMode.darken,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          TabBar(
            controller: tabController,
            labelColor: AppColor.color_247EAD,
            indicatorColor: AppColor.color_247EAD,
            unselectedLabelColor: AppColor.color_707070,
            tabs: [
              Tab(
                /*text: 'Mobile Number',
              icon: Icon(
                Icons.home,
                color: Colors.indigo.shade500,
              ),*/
                child: Text(
                  AppString.MobileNumber,
                ),
              ),
              Tab(
                  /*text: 'Email',
                icon: Icon(
                  Icons.star,
                  color: Colors.indigo.shade500,
                )*/
                  child: Text(
                AppString.Email,
              )),
            ],
            tabAlignment: TabAlignment.center,
          ),
          Expanded(
              child: TabBarView(
            controller: tabController,
            children: [
              MobileNumberTab(),
              EmailTab(),
            ],
          ))
        ],
      ),
    );
  }
}
