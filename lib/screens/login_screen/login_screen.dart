import 'package:draft_website/core/button_widget.dart';
import 'package:draft_website/core/clickable_widget.dart';
import 'package:draft_website/core/consts.dart';
import 'package:draft_website/core/responsive.dart';
import 'package:draft_website/screens/responsive_screen.dart';
import 'package:draft_website/screens/signup_screen/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var myFormKey = GlobalKey<FormState>();
  TextEditingController myEmailController = TextEditingController();
  TextEditingController myPasswordController = TextEditingController();
  bool isPasswordObscure = true;

  onButtonPressed() {
    if (myFormKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const ResponsivePage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,
        body: Responsive(
          mobile: Container(),
          tablet: Container(),
          desktop: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 100),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: ButtonWidget(
                        text: "Sign Up",
                        height: 56,
                        width: 140,
                        borderRadius: 10,
                        btnColor: const Color(0xFF1976D2),
                        borderColor: const Color(0xFF1976D2),
                        textColor: whiteColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const SignUpScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 100),
                  SizedBox(
                    width: 380,
                    child: Form(
                      key: myFormKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  "Sign in",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF14233A),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  "Sign in to access your account",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF14233A),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 30),
                          Text(
                            "Email Address",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: textColorOne,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          FormFieldWidget(
                            myController: myEmailController,
                            hintText: "Enter email address",
                            validator:
                                RequiredValidator(errorText: "*required").call,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "Password",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: textColorOne,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          FormFieldWidget(
                            obscureText: isPasswordObscure,
                            myController: myPasswordController,
                            hintText: "**********",
                            validator:
                                RequiredValidator(errorText: "*required").call,
                            suffixIcon: IconButtonWidget(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                if (isPasswordObscure) {
                                  setState(() {
                                    isPasswordObscure = false;
                                  });
                                } else {
                                  setState(() {
                                    isPasswordObscure = true;
                                  });
                                }
                              },
                              icon: SvgPicture.asset(
                                isPasswordObscure
                                    ? "assets/web_icons/hide.svg"
                                    : "assets/web_icons/un_hide.svg",
                                colorFilter: const ColorFilter.mode(
                                  Color(0xFF81809E),
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Forgot password?",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF1976D2),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          ButtonWidget(
                            height: 56,
                            text: "Sign In",
                            borderRadius: 10,
                            btnColor: const Color(0xFF1976D2),
                            borderColor: const Color(0xFF1976D2),
                            textColor: whiteColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            onPressed: onButtonPressed,
                          ),
                          const SizedBox(height: 30),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  height: 1,
                                  width: double.infinity,
                                  color: const Color(0xFF323239),
                                  margin: const EdgeInsets.only(right: 16),
                                ),
                              ),
                              const Text(
                                "Or",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Color(0xFF81809E),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 1,
                                  width: double.infinity,
                                  color: const Color(0xFF323239),
                                  margin: const EdgeInsets.only(left: 16),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Center(
                            child: Text(
                              "Sign in with",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: textColorOne,
                                fontSize: 13,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SvgPicture.asset(
                                "assets/web_icons/facebook.svg",
                              ),
                              const SizedBox(width: 30),
                              SvgPicture.asset(
                                "assets/web_icons/google.svg",
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FormFieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController myController;
  final String? Function(String?)? validator;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final AutovalidateMode autoValidateMode;
  final bool obscureText;
  final Function(String)? onFieldSubmitted;
  final String? suffixWidget;
  final Widget? suffixIcon;
  final Widget? prefixWidget;
  final int maxLines;
  final int? maxLength;
  final Function(String)? onChange;
  final String? iconImage;
  final bool isSvg;
  final bool readOnly;
  final double fontSize;
  final FontWeight fontWeight;
  final double borderRadius;
  final double verticalPadding;
  final Color textColor;
  final double width;

  const FormFieldWidget({
    super.key,
    this.hintText = '',
    required this.myController,
    this.validator,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.obscureText = false,
    this.onFieldSubmitted,
    this.suffixWidget,
    this.suffixIcon,
    this.maxLines = 1,
    this.onChange,
    this.maxLength,
    this.iconImage = '',
    this.isSvg = true,
    this.readOnly = false,
    this.prefixWidget,
    this.borderRadius = 15,
    this.verticalPadding = 19,
    this.fontSize = 15,
    this.fontWeight = FontWeight.w500,
    this.textColor = const Color(0xFF8E949A),
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: TextFormField(
          readOnly: readOnly,
          obscureText: obscureText,
          controller: myController,
          validator: validator,
          maxLines: maxLines,
          maxLength: maxLength,
          onChanged: onChange,
          onFieldSubmitted: onFieldSubmitted,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
          textInputAction: textInputAction,
          keyboardType: textInputType,
          autovalidateMode: autoValidateMode,
          autofocus: false,
          decoration: InputDecoration(
            fillColor: whiteColor,
            filled: true,
            suffixText: suffixWidget,
            suffixStyle: const TextStyle(
              color: blackColor,
            ),
            suffixIcon: suffixIcon,
            prefixIcon: prefixWidget,
            prefixIconConstraints: const BoxConstraints(
              minHeight: 10,
              minWidth: 55,
            ),
            suffixIconConstraints: const BoxConstraints(
              minHeight: 10,
              minWidth: 55,
            ),
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Color(0xFF81809E),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: const BorderSide(
                color: Color(0xFFD7DCE4),
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: const BorderSide(
                color: Color(0xFFD7DCE4),
                width: 1,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: const BorderSide(
                color: Color(0xFFD7DCE4),
                width: 1,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: const BorderSide(
                color: Color(0xFFD7DCE4),
                width: 1,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: verticalPadding,
            ),
          ),
        ),
      ),
    );
  }
}
