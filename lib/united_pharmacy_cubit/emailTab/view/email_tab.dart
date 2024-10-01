import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_flutter/united_pharmacy/common/common_widget.dart';
import 'package:lottie/lottie.dart';

import '../../../theme/color.dart';
import '../../../theme/string.dart';
import '../cubit/email_login_cubit.dart';

class EmailTabCubit extends StatefulWidget {
  const EmailTabCubit({super.key});

  @override
  State<EmailTabCubit> createState() => _EmailTabCubitState();
}

class _EmailTabCubitState extends State<EmailTabCubit> {
  final focus = FocusNode();

  bool isError = false;
  bool isButtonPressed = false;

  late BuildContext dialogContext;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<UnitedPharaEmailLoginCubit>().fieldKeys = [
      context.read<UnitedPharaEmailLoginCubit>().emailKey,
      context.read<UnitedPharaEmailLoginCubit>().passwordKey,
    ];
  }

  bool validate() {
    return context
        .read<UnitedPharaEmailLoginCubit>()
        .fieldKeys
        .every((element) => element.currentState!.validate());
  }

  void save() {
    for (var element in context.read<UnitedPharaEmailLoginCubit>().fieldKeys) {
      element.currentState!.save();
    }
    context.read<UnitedPharaEmailLoginCubit>().logInWithEmail();
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

  Widget _buildEmail() {
    return TextFormField(
      controller: context.read<UnitedPharaEmailLoginCubit>().emailController,
      key: context.read<UnitedPharaEmailLoginCubit>().emailKey,
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
          context
              .read<UnitedPharaEmailLoginCubit>()
              .formKey
              .currentState
              ?.validate();
        }
      },
      onSaved: (value) {
        context.read<UnitedPharaEmailLoginCubit>().emailController.text = value!;
      },
      onFieldSubmitted: (value) {
        FocusScope.of(context).requestFocus(focus);
      },
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
    );
  }

  Widget _buildPassword(UnitedPharaEmailLoginState state) {
    return TextFormField(
      controller: context.read<UnitedPharaEmailLoginCubit>().passwordController,
      key: context.read<UnitedPharaEmailLoginCubit>().passwordKey,
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
          context
              .read<UnitedPharaEmailLoginCubit>()
              .formKey
              .currentState
              ?.validate();
        }
      },
      onSaved: (value) {
        context.read<UnitedPharaEmailLoginCubit>().passwordController.text = value!;
      },
      focusNode: focus,
      keyboardType: TextInputType.text,
      maxLines: 1,
      obscureText: !state.passwordVisible,
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
              state.passwordVisible
                  ? "images/show_password_eye.png"
                  : "images/hide_password_eye.png",
              width: 8,
              height: 8,
            ),
            onTap: () {
              var currentState = !state.passwordVisible;
              context
                  .read<UnitedPharaEmailLoginCubit>()
                  .doPasswordToggle(currentState);
            },
          ),
        ),
        labelText: AppString.Password,
        filled: true,
        fillColor: AppColor.white,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8)),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.color_DDDDDD)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<UnitedPharaEmailLoginCubit, UnitedPharaEmailLoginState>(
        listener: (context, state) {
          print("EmailTab state: $state");

          if (state is EmailLoginLoadingState) {
            showProgress();
          } else if (state is EmailLoginSuccessState) {
            var response = state.loginResponseModel;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(response.customerEmail??"")),
            );
            Navigator.pop(dialogContext);
          } else if (state is EmailLoginErrorState) {
            Navigator.pop(dialogContext);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(left: 35, right: 35),
            child: Form(
              key: context.read<UnitedPharaEmailLoginCubit>().formKey,
              child: ListView(
                children: [
                  const SizedBox(height: 28),
                  _buildEmail(),
                  const SizedBox(height: 16),
                  BlocBuilder<UnitedPharaEmailLoginCubit, UnitedPharaEmailLoginState>(
                    builder: (context, state) {
                      return _buildPassword(state);
                    },
                  ),
                  const SizedBox(height: 16),
                  const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        AppString.ForgotPassword,
                        style: TextStyle(
                            color: AppColor.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      )),
                  const SizedBox(height: 16),
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
                  const SizedBox(height: 8),
                  const Wrap(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 14,
                              child: Divider(
                                height: 1,
                                thickness: 1,
                                color: AppColor.color_B6B7B7,
                              ),
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
                              width: 14,
                              child: Divider(
                                height: 1,
                                thickness: 1,
                                color: AppColor.color_B6B7B7,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 8),
                  CommonOutlinedButtonWithIcon(
                    text: AppString.Continue_with_Google,
                    iconPath: 'images/google_icon.png',
                    onButtonClick: () {},
                  ),
                  const SizedBox(height: 44),
                  const Align(
                      alignment: Alignment.center,
                      child: Text(
                        AppString.Dont_have_an_Account,
                        style: TextStyle(
                            color: AppColor.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      )),
                  const SizedBox(height: 2),
                  Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/Registration');
                        },
                        child: const Text(
                          AppString.Create_an_Account,
                          style: TextStyle(
                            color: AppColor.color_3F9ACC,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      )),
                  const SizedBox(height: 49),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

// Visibility(visible: showProgress, child: Align(alignment: Alignment.center,child: CircularProgressIndicator()))
}
