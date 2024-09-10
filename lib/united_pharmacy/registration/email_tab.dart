import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_flutter/united_pharmacy/common/common_widget.dart';

import '../../theme/color.dart';
import '../../theme/string.dart';

class EmailTab extends StatefulWidget {
  const EmailTab({super.key});

  @override
  State<EmailTab> createState() => _EmailTabState();
}

class _EmailTabState extends State<EmailTab> {
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
            SizedBox(
              height: 54,
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                maxLines: 1,
                maxLengthEnforcement: MaxLengthEnforcement.none,
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                      color: AppColor.color_B6B7B7,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                  counterText: "",
                  labelText: AppString.EmailID,
                  filled: true,
                  fillColor: AppColor.white,
                  border: OutlineInputBorder(
                      // borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.color_DDDDDD)),
                ),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              height: 54,
              child: TextField(
                keyboardType: TextInputType.text,
                maxLines: 1,
                obscureText: !_passwordVisible,
                obscuringCharacter: "*",
                maxLengthEnforcement: MaxLengthEnforcement.none,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(16),
                ],
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                      color: AppColor.color_B6B7B7,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
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
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.color_DDDDDD)),
                ),
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
            CommonElevatedButton(
              text: AppString.Login,
              foregroundColor: AppColor.white,
              backgroundColor: AppColor.color_0A195C,
              onButtonClick: () {},
            ),
            SizedBox(height: 8),
            Wrap(
              children: [
                Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: Divider(
                          height: 1,
                          thickness: 1,
                          color: AppColor.color_B6B7B7,
                        ),
                        width: 14,
                      ),
                      SizedBox(width: 6),
                      Text(
                        AppString.OR,
                        style: TextStyle(
                          color: AppColor.color_B6B7B7,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 6),
                      SizedBox(
                        child: Divider(
                          height: 1,
                          thickness: 1,
                          color: AppColor.color_B6B7B7,
                        ),
                        width: 14,
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 8),
            CommonOutlinedButtonWithIcon(
              text: AppString.Continue_with_Apple,
              iconPath: 'images/apple_icon.png',
              onButtonClick: () {},
            ),
            SizedBox(height: 12),
            CommonOutlinedButtonWithIcon(
              text: AppString.Continue_with_Google,
              iconPath: 'images/google_icon.png',
              onButtonClick: () {},
            ),
            SizedBox(height: 12),
            CommonOutlinedButtonWithIcon(
              text: AppString.Continue_with_Facebook,
              iconPath: 'images/facebook_icon.png',
              onButtonClick: () {},
            ),

            SizedBox(height: 44),
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
            SizedBox(height: 49),
          ],
        ),
      ),
    );
  }
}
