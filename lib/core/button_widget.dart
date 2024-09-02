import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'consts.dart';

class ButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final double width;
  final double height;
  final double elevation;
  final double fontSize;
  final Color btnColor;
  final Color textColor;
  final Color borderColor;
  final double borderRadius;
  final double padding;
  final FontWeight fontWeight;
  final bool isShowIcon;
  final String iconInButton;
  final Color iconColor;
  final double borderWidth;

  const ButtonWidget({
    Key? key,
    required this.text,
    this.width = double.infinity,
    this.height = 56,
    this.elevation = 0,
    this.fontSize = 16,
    this.onPressed,
    this.btnColor = mainAppColor,
    this.textColor = whiteColor,
    this.borderColor = mainAppColor,
    this.borderRadius = 10,
    this.padding = 0,
    this.fontWeight = FontWeight.w600,
    this.isShowIcon = false,
    this.iconInButton = "",
    this.iconColor = whiteColor,
    this.borderWidth = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: MaterialButton(
        onPressed: onPressed,
        height: height,
        minWidth: width,
        elevation: elevation,
        color: btnColor,
        disabledColor: borderColor,
        padding: EdgeInsets.all(padding),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: BorderSide(
            color: borderColor,
            width: borderWidth,
          ),
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flexible(
                child: Text(
                  text,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: textColor,
                    fontSize: fontSize,
                    fontWeight: fontWeight,
                    overflow: TextOverflow.ellipsis,
                    // letterSpacing: -0.3,
                  ),
                ),
              ),
              if (isShowIcon) const SizedBox(width: 8),
              if (isShowIcon)
                SvgPicture.asset(
                  iconInButton,
                  height: 12,
                  width: 12,
                  colorFilter: ColorFilter.mode(
                    iconColor,
                    BlendMode.srcIn,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
