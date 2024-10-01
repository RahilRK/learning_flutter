import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_flutter/theme/color.dart';
import 'package:learning_flutter/theme/string.dart';
import 'package:learning_flutter/united_pharmacy_cubit/mobileNumberTab/cubit/mob_no_login_cubit.dart';
import 'package:learning_flutter/united_pharmacy_cubit/mobileNumberTab/cubit/mobile_no_login_state.dart';
import 'package:lottie/lottie.dart';

import '../../../united_pharmacy/common/common_widget.dart';

class MobileNumberTabCubit extends StatefulWidget {
  const MobileNumberTabCubit({super.key});

  @override
  State<MobileNumberTabCubit> createState() => _MobileNumberTabCubitState();
}

class _MobileNumberTabCubitState extends State<MobileNumberTabCubit> {
  final focus = FocusNode();

  bool isError = false;
  bool isButtonPressed = false;

  late BuildContext dialogContext;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<UnitedPharaMobNoLoginCubit>().fieldKeys = [
      context.read<UnitedPharaMobNoLoginCubit>().emailKey,
      context.read<UnitedPharaMobNoLoginCubit>().passwordKey,
    ];
  }

  bool validate() {
    return context
        .read<UnitedPharaMobNoLoginCubit>()
        .fieldKeys
        .every((element) => element.currentState!.validate());
  }

  void save() {
    for (var element in context.read<UnitedPharaMobNoLoginCubit>().fieldKeys) {
      element.currentState!.save();
    }
    context.read<UnitedPharaMobNoLoginCubit>().logInWithEmail();
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

  Widget _buildMobileNumber() {
    return TextFormField(
      controller: context.read<UnitedPharaMobNoLoginCubit>().mobNoController,
      key: context.read<UnitedPharaMobNoLoginCubit>().emailKey,
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
          context
              .read<UnitedPharaMobNoLoginCubit>()
              .formKey
              .currentState
              ?.validate();
        }
      },
      onSaved: (value) {
        context.read<UnitedPharaMobNoLoginCubit>().mobNoController.text =
            value!;
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
        labelStyle: const TextStyle(
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
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.color_DDDDDD)),
      ),
    );
  }

  Widget _buildPassword(UnitedPharaMobNoLoginState state) {
    return TextFormField(
      controller: context.read<UnitedPharaMobNoLoginCubit>().passwordController,
      key: context.read<UnitedPharaMobNoLoginCubit>().passwordKey,
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
              .read<UnitedPharaMobNoLoginCubit>()
              .formKey
              .currentState
              ?.validate();
        }
      },
      onSaved: (value) {
        context.read<UnitedPharaMobNoLoginCubit>().passwordController.text =
            value!;
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
                  .read<UnitedPharaMobNoLoginCubit>()
                  .doPasswordToggle(currentState);
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          BlocConsumer<UnitedPharaMobNoLoginCubit, UnitedPharaMobNoLoginState>(
        listener: (context, state) {
          print("MobileNumberTab state: $state");

          if (state is MobNoLoginLoadingState) {
            showProgress();
          } else if (state is MobNoLoginSuccessState) {
            var response = state.loginResponseModel;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(response.mobileNumber??"")),
            );
            Navigator.pop(dialogContext);
          } else if (state is MobNoLoginErrorState) {
            Navigator.pop(dialogContext);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(left: 35, right: 35),
            child: Form(
              key: context.read<UnitedPharaMobNoLoginCubit>().formKey,
              // autovalidateMode: focus.hasFocus? AutovalidateMode.always:AutovalidateMode.disabled,
              child: ListView(
                children: [
                  const SizedBox(height: 28),
                  _buildMobileNumber(),
                  const SizedBox(height: 16),
                  BlocBuilder<UnitedPharaMobNoLoginCubit,
                      UnitedPharaMobNoLoginState>(
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
                  const SizedBox(height: 111),
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
                  const SizedBox(height: 166),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
