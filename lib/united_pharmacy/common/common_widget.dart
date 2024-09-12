import 'package:flutter/material.dart';
import 'package:learning_flutter/theme/color.dart';

import '../../theme/string.dart';

class CommonElevatedButton extends StatelessWidget {
  const CommonElevatedButton({
    super.key,
    required this.text,
    required this.foregroundColor,
    required this.backgroundColor,
    required this.onButtonClick,
  });

  final String text;
  final Color foregroundColor;
  final Color backgroundColor;
  final Function()? onButtonClick;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 44,
      child: ElevatedButton(
          onPressed: onButtonClick,
          style: ElevatedButton.styleFrom(
            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            foregroundColor: foregroundColor,
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8), // <-- Radius
            ),
          ),
          child: Text(text)),
    );
  }
}

class CommonOutlinedButtonWithIcon extends StatelessWidget {
  const CommonOutlinedButtonWithIcon({
    super.key,
    required this.text,
    required this.iconPath,
    required this.onButtonClick,
  });

  final String text;
  final String iconPath;
  final Function()? onButtonClick;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        InkWell(
          child: Container(
            width: double.infinity,
            height: 44,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColor.black,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Stack(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Image.asset(
                        iconPath,
                        height: 24,
                        width: 24,
                      )),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      text,
                      style: TextStyle(
                        color: AppColor.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          onTap: onButtonClick,
        )
      ],
    );
  }
}

class CommonToolbar extends StatelessWidget {
  const CommonToolbar({super.key, required this.toolbarText,});

  final String toolbarText;

  @override
  Widget build(BuildContext context) {
    return AppBar(leading: Icon(Icons.arrow_back_ios), title: Text(toolbarText),);
  }
}

AppBar commonAppBar(BuildContext context, String title) {
  return AppBar(
    leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back_ios,
          color: AppColor.black,
        )),
    title: Text(
      title,
      style: TextStyle(
          color: AppColor.black, fontSize: 16, fontWeight: FontWeight.bold),
    ),
    backgroundColor: AppColor.white,
    elevation: 2,
  );
}

