import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:learning_flutter/theme/color.dart';
import 'package:learning_flutter/united_pharmacy/api_helper.dart';
import 'package:learning_flutter/united_pharmacy/model/request/RegistrationRequest.dart';
import 'package:learning_flutter/united_pharmacy/model/request/VerificationRequest.dart';
import 'package:lottie/lottie.dart';

import '../../preference/MyPref.dart';
import '../../theme/string.dart';
import '../common/common_widget.dart';

class Verification extends StatefulWidget {
  final RegistrationRequest registrationRequest;

  const Verification({super.key, required this.registrationRequest});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  String _code = "";
  bool _onEditing = true;
  late RegistrationRequest mRegistrationRequest = RegistrationRequest();

  late BuildContext dialogContext;

  @override
  void initState() {
    // TODO: implement initState
    mRegistrationRequest = widget.registrationRequest;
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
                "We have sent an verification code on your mobile number"))));
  }

  void save() {
    if (_onEditing) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter OTP')),
      );
    } else {
      getRegistration();
    }
  }

  void showProgress() {
    showDialog(
      context: context,
      builder: (context) {
        dialogContext = context;
        return Dialog(
          surfaceTintColor: Color(0x00ffffff),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context, AppString.VerifyVerificationCode),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 24),
        child: ListView(
          children: [
            Text(
              "${AppString.Sent_an_Verification_Code_to}${mRegistrationRequest.mobile}",
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
                textStyle:
                    TextStyle(fontSize: 16, color: AppColor.color_B6B7B7),
                keyboardType: TextInputType.number,
                underlineColor: AppColor.color_3F9ACC,
                length: 6,
                cursorColor: Colors.blue,
                fullBorder: true,
                margin: const EdgeInsets.all(6),
                onCompleted: (String value) {
                  setState(() {
                    _code = value;
                  });
                },
                onEditing: (bool value) {
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
                save();
              },
            ),
            SizedBox(height: 32),
            Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    getVerification(mRegistrationRequest);
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

  void getRegistration() {
    showProgress();
    var registrationRequest = mRegistrationRequest.copyWith(otp: _code);

    createAccount(registrationRequest).then((data) {
      Navigator.pop(dialogContext);

      var success = data.success ?? false;
      if (success) {
        var customerToken = data.customerToken ?? "";
        var customerId = data.customerId ?? "";
        MyPref.addBoolToSF("customerLogin", true);
        MyPref.addStringToSF("customerToken", customerToken);
        MyPref.addStringToSF("customerId", customerId);

        Navigator.pushNamedAndRemoveUntil(
            context, '/DashboardTab', (Route<dynamic> route) => false);
      } else {
        var message = data.message ?? "";
        if (message.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message)),
          );
        }
      }
    }, onError: (e) {
      Navigator.pop(dialogContext);
      print(e);
    });
  }

  void getVerification(RegistrationRequest registrationRequest) {
    showProgress();
    var verificationRequest = VerificationRequest(
        websiteId: "1",
        storeId: "1",
        quoteId: "0",
        mobilenumber: registrationRequest.mobile,
        os: "android");

    sendotp(verificationRequest).then((data) {
      Navigator.pop(dialogContext);

      var success = data.success ?? false;
      if (success) {
        var otp = data.otp;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  'We have sent an verification code on your mobile number')),
        );
      } else {
        var message = data.message ?? "";
        if (message.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message)),
          );
        }
      }
    }, onError: (e) {
      Navigator.pop(dialogContext);
      print(e);
    });
  }
}
