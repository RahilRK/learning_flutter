import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_flutter/theme/color.dart';
import 'package:learning_flutter/theme/string.dart';
import 'package:learning_flutter/united_pharmacy/login/email_tab.dart';
import 'package:learning_flutter/united_pharmacy/login/mobile_number_tab.dart';

import '../../emailTab/cubit/email_login_cubit.dart';
import '../../emailTab/provider/email_login_provider.dart';
import '../../emailTab/repository/email_login_repository.dart';
import '../../emailTab/view/email_tab.dart';
import '../../mobileNumberTab/cubit/mob_no_login_cubit.dart';
import '../../mobileNumberTab/provider/mobile_no_login_provider.dart';
import '../../mobileNumberTab/repository/email_login_repository.dart';
import '../../mobileNumberTab/view/mobile_no_tab.dart';

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

  @override
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
                child: const Text(
                  AppString.Skip,
                  style: TextStyle(
                      color: AppColor.white,
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
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
            tabs: const [
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
              RepositoryProvider(
                create: (context) => UnitedPharaEmailLoginRepository(
                    UnitedPharaEmailLoginProvider()),
                child: BlocProvider(
                  create: (context) => UnitedPharaEmailLoginCubit(
                      context.read<UnitedPharaEmailLoginRepository>()),
                  child: const EmailTabCubit(),
                ),
              ),
              RepositoryProvider(
                create: (context) => UnitedPharaMobNoLoginRepository(
                    UnitedPharaMobNoLoginProvider()),
                child: BlocProvider(
                  create: (context) => UnitedPharaMobNoLoginCubit(
                      context.read<UnitedPharaMobNoLoginRepository>()),
                  child: const MobileNumberTabCubit(),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
