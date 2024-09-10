import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_flutter/theme/color.dart';
import 'package:learning_flutter/theme/string.dart';

import '../common/common_widget.dart';

class MobileNumberTab extends StatefulWidget {
  const MobileNumberTab({super.key});

  @override
  State<MobileNumberTab> createState() => _MobileNumberTabState();
}

class _MobileNumberTabState extends State<MobileNumberTab> {
  bool _passwordVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 35, right: 35),
        child: ListView(
          children: [
            SizedBox(height: 28),
            TextField(
              keyboardType: TextInputType.number,
              maxLines: 1,
              maxLengthEnforcement: MaxLengthEnforcement.none,
              inputFormatters: [
                LengthLimitingTextInputFormatter(10),
              ],
              decoration: InputDecoration(
                counterText: "",
                labelText: AppString.MobileNumber,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 4),
                  child: Image.asset(
                    'images/saudi_arabia.png',
                    height: 18,
                    width: 28,
                  ),
                ),
                prefixText: AppString.m966,
                filled: true,
                fillColor: AppColor.white,
                border: OutlineInputBorder(
                    // borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8)),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              keyboardType: TextInputType.text,
              maxLines: 1,
              obscureText: !_passwordVisible,
              obscuringCharacter: "*",
              maxLengthEnforcement: MaxLengthEnforcement.none,
              inputFormatters: [
                LengthLimitingTextInputFormatter(16),
              ],
              decoration: InputDecoration(
                counterText: "",
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: InkWell(
                    child: Image.asset(
                      _passwordVisible
                          ? "images/show_password_eye.png"
                          : "images/hide_password_eye.png",
                      width: 8,
                      height: 8,
                    ),
                    onTap: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                ),
                labelText: AppString.Password,
                filled: true,
                fillColor: AppColor.white,
                border: OutlineInputBorder(
                    // borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8)),
              ),
            ),
            SizedBox(height: 16),
            Align(
                alignment: Alignment.centerRight,
                child: Text(
                  AppString.ForgotPassword,
                  style: TextStyle(
                      color: AppColor.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                )),
            SizedBox(height: 16),
            CustomButton(
              text: AppString.Login,
              foregroundColor: AppColor.white,
              backgroundColor: AppColor.color_0A195C,
              onButtonClick: () {},
            ),
            SizedBox(height: 111),
            Align(
                alignment: Alignment.center,
                child: Text(
                  AppString.Dont_have_an_Account,
                  style: TextStyle(
                      color: AppColor.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                )),
            SizedBox(height: 2),
            Align(
                alignment: Alignment.center,
                child: Text(
                  AppString.Create_an_Account,
                  style: TextStyle(
                    color: AppColor.color_3F9ACC,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                )),
            SizedBox(height: 166),
          ],
        ),
      ),
    );
  }
}
