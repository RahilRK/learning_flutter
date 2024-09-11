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
  }

  bool validate() {
    return fieldKeys.every((element) => element.currentState!.validate());
  }

  void save() {
    fieldKeys.forEach((element) => element.currentState!.save());
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Submitted Data')),
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
          return 'Please enter mobile number';
        } else if (value.length != 9) {
          return 'Please enter valid mobile number';
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
      keyboardType: TextInputType.number,
      maxLines: 1,
      maxLengthEnforcement: MaxLengthEnforcement.none,
      inputFormatters: [
        LengthLimitingTextInputFormatter(9),
      ],
      decoration: InputDecoration(
        labelStyle: TextStyle(
            // color: AppColor.color_B6B7B7,
            fontSize: 16,
            fontWeight: FontWeight.w500),
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
          borderRadius: BorderRadius.circular(8),
        ),
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
          // autovalidateMode: focus.hasFocus? AutovalidateMode.always:AutovalidateMode.disabled,
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
      ),
    );
  }
}
