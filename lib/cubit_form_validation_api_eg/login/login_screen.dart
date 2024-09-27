import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_flutter/cubit_form_validation_api_eg/login/cubit/login_cubit.dart';
import 'package:lottie/lottie.dart';

import '../../theme/color.dart';
import '../../theme/string.dart';
import '../../united_pharmacy/common/common_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _passwordVisible = false;
  late BuildContext dialogContext;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Form(
        key: context.read<LoginCubit>().formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              TextFormField(
                // key: emailKey,
                controller: context.read<LoginCubit>().emailController,
                validator: (value) {
                  /*if (!isButtonPressed) {
                    return null;
                  }
                  isError = true;*/
                  if (value == null || value.isEmpty) {
                    return 'Please enter email id';
                  } else if (!RegExp(
                          r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                      .hasMatch(value)) {
                    return 'Please enter valid email id';
                  }
                  /*isError = false;*/
                  return null;
                },
                /*onChanged: (value) {
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
                },*/
                keyboardType: TextInputType.emailAddress,
                maxLines: 1,
                maxLengthEnforcement: MaxLengthEnforcement.none,
                decoration: InputDecoration(
                  labelStyle: const TextStyle(
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
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.color_DDDDDD)),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                // key: passwordKey,
                controller: context.read<LoginCubit>().passwordController,
                validator: (value) {
                  /*if (!isButtonPressed) {
                    return null;
                  }
                  isError = true;*/
                  if (value == null || value.isEmpty) {
                    return 'Please enter password';
                  } else if (value.length < 4) {
                    return 'Please enter valid password, password length is 4 to 16';
                  }
                  // isError = false;
                  return null;
                },
                /*onChanged: (value) {
                  isButtonPressed = false;
                  if (isError) {
                    _formKey.currentState?.validate();
                  }
                },
                onSaved: (value) {
                  _password = value!;
                },
                focusNode: focus,*/
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
                  labelText: AppString.Password,
                  filled: true,
                  fillColor: AppColor.white,
                  border: OutlineInputBorder(
                      // borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8)),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.color_DDDDDD)),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              BlocListener<LoginCubit, LoginState>(
                listener: (context, state) {
                  print('listener state: $state');
                  if (state is LoginLoadingState) {
                    showProgress();
                  } else if (state is LoginErrorState) {
                    Navigator.pop(dialogContext);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.error)),
                    );
                  } else if (state is LoginSuccessState) {
                    Navigator.pop(dialogContext);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(
                              "token: ${state.loginResponseModel.token}" ??
                                  "")),
                    );
                  }
                },
                child: CommonElevatedButton(
                  text: AppString.Login,
                  foregroundColor: AppColor.white,
                  backgroundColor: AppColor.color_0A195C,
                  onButtonClick: () {
                    context.read<LoginCubit>().doLogin();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
