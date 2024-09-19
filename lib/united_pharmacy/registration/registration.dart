import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_flutter/united_pharmacy/api_helper.dart';
import 'package:learning_flutter/united_pharmacy/common/common_widget.dart';
import 'package:learning_flutter/united_pharmacy/model/request/RegistrationRequest.dart';
import 'package:learning_flutter/united_pharmacy/model/request/VerificationRequest.dart';
import 'package:lottie/lottie.dart';

import '../../theme/color.dart';
import '../../theme/string.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _formKey = GlobalKey<FormState>();
  final focus = FocusNode();
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

  bool isError = false;
  bool isButtonPressed = false;

  late final TextEditingController _firstName = TextEditingController();
  late final TextEditingController _lastName = TextEditingController();
  late final TextEditingController _email = TextEditingController();
  late final TextEditingController _password = TextEditingController();
  late final TextEditingController _confirmPassword = TextEditingController();
  late final TextEditingController _mobileNumber = TextEditingController();

  late List<GlobalKey<FormFieldState>> fieldKeys;
  late GlobalKey<FormFieldState> firstNameKey;
  late GlobalKey<FormFieldState> lastNameKey;
  late GlobalKey<FormFieldState> emailKey;
  late GlobalKey<FormFieldState> passwordKey;
  late GlobalKey<FormFieldState> confirmPasswordKey;
  late GlobalKey<FormFieldState> mobileNumberKey;

  late BuildContext dialogContext;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible = false;
    _confirmPasswordVisible = false;

    firstNameKey = GlobalKey<FormFieldState>();
    lastNameKey = GlobalKey<FormFieldState>();
    emailKey = GlobalKey<FormFieldState>();
    passwordKey = GlobalKey<FormFieldState>();
    confirmPasswordKey = GlobalKey<FormFieldState>();
    mobileNumberKey = GlobalKey<FormFieldState>();
    fieldKeys = [
      firstNameKey,
      lastNameKey,
      emailKey,
      passwordKey,
      confirmPasswordKey,
      mobileNumberKey
    ];
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _firstName.dispose();
    _lastName.dispose();
    _email.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    _mobileNumber.dispose();
    super.dispose();
  }

  bool validate() {
    return fieldKeys.every((element) => element.currentState!.validate());
  }

  void save() {
    for (var element in fieldKeys) {
      element.currentState!.save();
    }

    var registrationRequest = RegistrationRequest(
        websiteId: "1",
        storeId: "1",
        quoteId: "0",
        mFactor: "2.625",
        currency: "SAR",
        firstName: _firstName.text,
        lastName: _lastName.text,
        otp: "",
        email: _email.text,
        password: _password.text,
        pictureURL: "",
        mobile: _mobileNumber.text,
        os: "android"
    );
    getVerification(registrationRequest);
  }

  void showProgress() {
    showDialog(
      context: context,
      builder: (context) {
        dialogContext = context;
        return Dialog(
          surfaceTintColor: const Color(0x00ffffff),
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

  Widget _buildFirstName() {
    return TextFormField(
      controller: _firstName,
      key: firstNameKey,
      validator: (value) {
        if (!isButtonPressed) {
          return null;
        }
        isError = true;
        if (value == null || value.isEmpty) {
          return 'Please enter first name';
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
      /*onFieldSubmitted: (value) {
        FocusScope.of(context).requestFocus(focus);
      },*/
      textInputAction: TextInputAction.next,
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
      // focus to next
      keyboardType: TextInputType.text,
      maxLines: 1,
      maxLengthEnforcement: MaxLengthEnforcement.none,
      decoration: InputDecoration(
        labelStyle: const TextStyle(
            // color: AppColor.color_B6B7B7,
            fontSize: 16,
            fontWeight: FontWeight.w500),
        counterText: "",
        labelText: AppString.FirstName,
        filled: true,
        fillColor: AppColor.white,
        border: OutlineInputBorder(
            // borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8)),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.color_DDDDDD)),
      ),
    );
  }

  Widget _buildLastName() {
    return TextFormField(
      controller: _lastName,
      key: lastNameKey,
      validator: (value) {
        if (!isButtonPressed) {
          return null;
        }
        isError = true;
        if (value == null || value.isEmpty) {
          return 'Please enter last name';
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
      /*onFieldSubmitted: (value) {
        FocusScope.of(context).requestFocus(focus);
      },*/
      textInputAction: TextInputAction.next,
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
      // focus to next
      keyboardType: TextInputType.text,
      maxLines: 1,
      maxLengthEnforcement: MaxLengthEnforcement.none,
      decoration: InputDecoration(
        labelStyle: const TextStyle(
            // color: AppColor.color_B6B7B7,
            fontSize: 16,
            fontWeight: FontWeight.w500),
        counterText: "",
        labelText: AppString.LastName,
        filled: true,
        fillColor: AppColor.white,
        border: OutlineInputBorder(
            // borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8)),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.color_DDDDDD)),
      ),
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      controller: _email,
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
      /*onFieldSubmitted: (value) {
        FocusScope.of(context).requestFocus(focus);
      },*/
      textInputAction: TextInputAction.next,
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
      // focus to next
      keyboardType: TextInputType.emailAddress,
      maxLines: 1,
      maxLengthEnforcement: MaxLengthEnforcement.none,
      decoration: InputDecoration(
        labelStyle: const TextStyle(
            // color: AppColor.color_B6B7B7,
            fontSize: 16,
            fontWeight: FontWeight.w500),
        counterText: "",
        labelText: AppString.Email_,
        filled: true,
        fillColor: AppColor.white,
        border: OutlineInputBorder(
            // borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8)),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.color_DDDDDD)),
      ),
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      controller: _password,
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
      textInputAction: TextInputAction.next,
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
      // focus to next
      keyboardType: TextInputType.text,
      maxLines: 1,
      obscureText: !_passwordVisible,
      obscuringCharacter: "*",
      maxLengthEnforcement: MaxLengthEnforcement.none,
      inputFormatters: [
        LengthLimitingTextInputFormatter(16),
      ],
      decoration: InputDecoration(
        labelStyle: const TextStyle(
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
        labelText: AppString.Password_,
        filled: true,
        fillColor: AppColor.white,
        border: OutlineInputBorder(
            // borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8)),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.color_DDDDDD)),
      ),
    );
  }

  Widget _buildConfirmPassword() {
    return TextFormField(
      controller: _confirmPassword,
      key: confirmPasswordKey,
      validator: (value) {
        if (!isButtonPressed) {
          return null;
        }
        isError = true;
        if (value == null || value.isEmpty) {
          return 'Please enter confirm password';
        } else if (value.length < 4) {
          return 'Please enter valid password, password length is 4 to 16';
        } else if (_confirmPassword.text != _password.text) {
          return 'Password and confirm password doesn\u0027t match';
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
      textInputAction: TextInputAction.next,
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
      // focus to next
      keyboardType: TextInputType.text,
      maxLines: 1,
      obscureText: !_confirmPasswordVisible,
      obscuringCharacter: "*",
      maxLengthEnforcement: MaxLengthEnforcement.none,
      inputFormatters: [
        LengthLimitingTextInputFormatter(16),
      ],
      decoration: InputDecoration(
        labelStyle: const TextStyle(
            // color: AppColor.color_B6B7B7,
            fontSize: 16,
            fontWeight: FontWeight.w500),
        counterText: "",
        suffixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: InkWell(
            child: Image.asset(
              _confirmPasswordVisible
                  ? "images/show_password_eye.png"
                  : "images/hide_password_eye.png",
              width: 8,
              height: 8,
            ),
            onTap: () {
              setState(() {
                _confirmPasswordVisible = !_confirmPasswordVisible;
              });
            },
          ),
        ),
        labelText: AppString.ConfirmPassword,
        filled: true,
        fillColor: AppColor.white,
        border: OutlineInputBorder(
            // borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8)),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.color_DDDDDD)),
      ),
    );
  }

  Widget _buildMobileNumber() {
    return TextFormField(
      controller: _mobileNumber,
      key: mobileNumberKey,
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
      textInputAction: TextInputAction.done,
      onEditingComplete: () => FocusScope.of(context).unfocus(),
      // focus to next
      keyboardType: TextInputType.number,
      maxLines: 1,
      maxLengthEnforcement: MaxLengthEnforcement.none,
      inputFormatters: [
        LengthLimitingTextInputFormatter(9),
      ],
      decoration: InputDecoration(
        labelStyle: const TextStyle(
            // color: AppColor.color_B6B7B7,
            fontSize: 16,
            fontWeight: FontWeight.w500),
        counterText: "",
        labelText: AppString.MobileNumber_,
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
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.color_DDDDDD)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context, AppString.SignUp),
      body: Padding(
        padding: const EdgeInsets.only(left: 35, right: 35),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const SizedBox(height: 24),
              _buildFirstName(),
              const SizedBox(height: 24),
              _buildLastName(),
              const SizedBox(height: 24),
              _buildEmail(),
              const SizedBox(height: 24),
              _buildPassword(),
              const SizedBox(height: 24),
              _buildConfirmPassword(),
              const SizedBox(height: 24),
              _buildMobileNumber(),
              const SizedBox(height: 32),
              CommonElevatedButton(
                text: AppString.SendVerificationCode,
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
              const SizedBox(height: 308),
            ],
          ),
        ),
      ),
    );
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
        var mRegistrationRequest = registrationRequest.copyWith(otp: otp);
        Navigator.pushNamed(context, '/Verification', arguments: mRegistrationRequest);
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
