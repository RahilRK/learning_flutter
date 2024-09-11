import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_flutter/preference/MyPref.dart';
import 'package:learning_flutter/united_pharmacy/api_helper.dart';
import 'package:learning_flutter/united_pharmacy/common/common_widget.dart';
import 'package:learning_flutter/united_pharmacy/model/LoginRequest.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../theme/color.dart';
import '../../theme/string.dart';

class EmailTab extends StatefulWidget {
  const EmailTab({super.key});

  @override
  State<EmailTab> createState() => _EmailTabState();
}

class _EmailTabState extends State<EmailTab> {
  final _formKey = GlobalKey<FormState>();
  final focus = FocusNode();
  bool _passwordVisible = false;

  bool isError = false;
  bool isButtonPressed = false;

  late String _email;
  late String _password;

  late List<GlobalKey<FormFieldState>> fieldKeys;
  late GlobalKey<FormFieldState> emailKey;
  late GlobalKey<FormFieldState> passwordKey;

  late BuildContext dialogContext;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible = false;

    emailKey = GlobalKey<FormFieldState>();
    passwordKey = GlobalKey<FormFieldState>();
    fieldKeys = [
      emailKey,
      passwordKey,
    ];

    /*MyPref.addStringToSF("customerEmail", 'Raj RK');
    MyPref.addIntToSF("customerId", 325);
    MyPref.addBoolToSF("customerOnline", false);

    MyPref.getStringValuesSF('customerEmail').then((value) {
      print(value);
    });

    MyPref.getIntValuesSF('customerId').then((value) {
      print(value);
    });

    MyPref.getBoolValuesSF('customerOnline').then((value) {
      print(value);
    });*/
  }

  bool validate() {
    return fieldKeys.every((element) => element.currentState!.validate());
  }

  void save() {
    fieldKeys.forEach((element) => element.currentState!.save());
    getEmailLogin();
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
          child: new Container(
              color: Colors.transparent,
              alignment: FractionalOffset.center,
              // height: 0.0,
              padding: const EdgeInsets.all(0.0),
              child: Container(
                  height: 32, width: 32, child: CircularProgressIndicator())),
        );
      },
      barrierColor: Colors.black38,
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      key: emailKey,
      validator: (value) {
        if (!isButtonPressed) {
          return null;
        }
        isError = true;
        if (value == null || value.isEmpty) {
          return 'Please enter email id';
        } else if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter valid email id';
        }
        isError = false;
        return null;
      },
      onChanged: (value) {
        isButtonPressed = false;
        if (isError) {
          _formKey.currentState?.validate();
        }
      },
      onSaved: (value) {
        _email = value!;
      },
      onFieldSubmitted: (value) {
        FocusScope.of(context).requestFocus(focus);
      },
      keyboardType: TextInputType.emailAddress,
      maxLines: 1,
      maxLengthEnforcement: MaxLengthEnforcement.none,
      decoration: InputDecoration(
        labelStyle: TextStyle(
            // color: AppColor.color_B6B7B7,
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
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      key: passwordKey,
      validator: (value) {
        if (!isButtonPressed) {
          return null;
        }
        isError = true;
        if (value == null || value.isEmpty) {
          return 'Please enter password';
        } else if (value.length < 4) {
          return 'Please enter valid password, password length is 4 to 16';
        }
        isError = false;
        return null;
      },
      onChanged: (value) {
        isButtonPressed = false;
        if (isError) {
          _formKey.currentState?.validate();
        }
      },
      onSaved: (value) {
        _password = value!;
      },
      focusNode: focus,
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
            // color: AppColor.color_B6B7B7,
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 35, right: 35),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(height: 28),
              _buildEmail(),
              SizedBox(height: 16),
              _buildPassword(),
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
                onButtonClick: () {
                  isButtonPressed = true;
                  if (!validate()) {
                    return;
                  }

                  save();
                },
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
      ),
    );
  }

  // Visibility(visible: showProgress, child: Align(alignment: Alignment.center,child: CircularProgressIndicator()))

  void getEmailLogin() {
    showProgress();
    var loginReq = LoginRequest(
        websiteId: "1",
        storeId: "1",
        quoteId: "0",
        mFactor: "2.625",
        currency: "SAR",
        username: _email,
        password: _password,
        os: "android");

    emailLogin(loginReq).then((data) {
      /*setState(() {
        showProgress = false;
      });*/
      Navigator.pop(dialogContext);

      var success = data.success ?? false;
      if (success) {
        var customerToken = data.customerToken ?? "";
        var customerId = data.customerId ?? "";
        MyPref.addBoolToSF("customerLogin", true);
        MyPref.addStringToSF("customerToken", customerToken);
        MyPref.addStringToSF("customerId", customerId);
      }
      else {

        var message = data.message??"";
        if(message.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message)),
          );
        }
      }
    }, onError: (e) {
      /*setState(() {
        showProgress = false;
      });*/
      Navigator.pop(dialogContext);

      print(e);
    });
  }
}