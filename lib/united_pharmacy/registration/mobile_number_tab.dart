import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_flutter/theme/color.dart';

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
        child: Column(
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
                labelText: "Mobile Number",
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 4),
                  child: Image.asset(
                    'images/saudi_arabia.png',
                    height: 18,
                    width: 28,
                  ),
                ),
                prefixText: "+966   ",
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
                labelText: "Password",
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
              'Forgot Password?',
              style: TextStyle(color: AppColor.black, fontSize: 14, fontWeight: FontWeight.w500),
            )),
            SizedBox(height: 16),
            CustomButton(
              text: "Login",
              foregroundColor: AppColor.white,
              backgroundColor: AppColor.color_0A195C,
              onButtonClick: () {

              },
            ),
          ],
        ),
      ),
    );
  }
}
