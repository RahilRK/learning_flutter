import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:learning_flutter/theme/color.dart';

import '../theme/string.dart';
import 'common/common_widget.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  String _code = "";
  bool _onEditing = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context, AppString.VerifyVerificationCode),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 24),
        child: ListView(
          children: [
            Text(
              AppString.Sent_an_Verification_Code_to,
              style: TextStyle(
                  fontSize: 16,
                  color: AppColor.black,
                  fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 27),
            Align(
              alignment: Alignment.center,
              child: VerificationCode(
                textStyle: TextStyle(fontSize: 16, color: AppColor.color_B6B7B7),
                keyboardType: TextInputType.number,
                underlineColor: AppColor.color_3F9ACC,
                // If this is null it will use primaryColor: Colors.red from Theme
                length: 6,
                cursorColor: Colors.blue,
                fullBorder: true,
                // If this is null it will default to the ambient
                // clearAll is NOT required, you can delete it
                // takes any widget, so you can implement your design
                /*clearAll: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'clear all',
                    style: TextStyle(
                        fontSize: 14.0,
                        decoration: TextDecoration.none,
                        color: Colors.blue[700]),
                  ),
                ),*/
                margin: const EdgeInsets.all(6),
                onCompleted: (String value) {
                  print('onCompleted: $value');
                  setState(() {
                    _code = value;
                  });
                },
                onEditing: (bool value) {
                  print('onEditing: $value');
                  setState(() {
                    _onEditing = value;
                  });
                  if (!_onEditing) FocusScope.of(context).unfocus();
                },
              ),
            ),
            SizedBox(height: 32),
            CommonElevatedButton(
              text: AppString.Verify,
              foregroundColor: AppColor.white,
              backgroundColor: AppColor.color_0A195C,
              onButtonClick: () {

              },
            ),
            SizedBox(height: 32),
            Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/Registration');
                  },
                  child: Text(
                    AppString.ResendVerificationCode,
                    style: TextStyle(
                      color: AppColor.color_3F9ACC,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
