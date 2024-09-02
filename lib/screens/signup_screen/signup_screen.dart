import 'package:draft_website/core/button_widget.dart';
import 'package:draft_website/core/clickable_widget.dart';
import 'package:draft_website/core/consts.dart';
import 'package:draft_website/core/responsive.dart';
import 'package:draft_website/screens/login_screen/login_screen.dart';
import 'package:draft_website/screens/responsive_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var myFormKey = GlobalKey<FormState>();
  TextEditingController myEmailController = TextEditingController();
  TextEditingController myPasswordController = TextEditingController();
  TextEditingController myConfirmPasswordController = TextEditingController();
  TextEditingController myFirstNameController = TextEditingController();
  TextEditingController myLastNameController = TextEditingController();
  TextEditingController myMobileNumberController = TextEditingController();
  bool isPasswordObscure = true;
  bool isCPasswordObscure = true;
  bool isCheckBoxActive = false;

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
                        text: "Sign In",
                        height: 56,
                        width: 140,
                        borderRadius: 10,
                        btnColor: const Color(0xFF1976D2),
                        borderColor: const Color(0xFF1976D2),
                        textColor: whiteColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 100),
                  SizedBox(
                    width: 680,
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
                                  "Create an Account",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF14233A),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 30),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
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
                                      textInputType: TextInputType.emailAddress,
                                      hintText: "Enter email address",
                                      validator: RequiredValidator(
                                              errorText: "*required")
                                          .call,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 26),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
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
                                      validator: RequiredValidator(
                                              errorText: "*required")
                                          .call,
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
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Row(                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Confirm Password",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: textColorOne,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    FormFieldWidget(
                                      obscureText: isCPasswordObscure,
                                      myController: myConfirmPasswordController,
                                      hintText: "**********",
                                      validator: RequiredValidator(
                                              errorText: "*required")
                                          .call,
                                      suffixIcon: IconButtonWidget(
                                        padding: EdgeInsets.zero,
                                        onPressed: () {
                                          setState(() {
                                            isCPasswordObscure =
                                                !isCPasswordObscure;
                                          });
                                        },
                                        icon: SvgPicture.asset(
                                          isCPasswordObscure
                                              ? "assets/web_icons/hide.svg"
                                              : "assets/web_icons/un_hide.svg",
                                          colorFilter: const ColorFilter.mode(
                                            Color(0xFF81809E),
                                            BlendMode.srcIn,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 26),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "First Name",
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
                                      hintText: "Enter first name",
                                      validator: RequiredValidator(
                                              errorText: "*required")
                                          .call,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Last Name",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: textColorOne,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    FormFieldWidget(
                                      myController: myLastNameController,
                                      hintText: "Enter last name",
                                      validator: RequiredValidator(
                                              errorText: "*required")
                                          .call,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 26),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Mobile Number",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: textColorOne,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    FormFieldWidget(
                                      myController: myMobileNumberController,
                                      textInputType: TextInputType.number,
                                      textInputAction: TextInputAction.done,
                                      hintText: "Enter mobile number",
                                      validator: RequiredValidator(
                                              errorText: "*required")
                                          .call,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 23),
                          InkWellWidget(
                            onTap: () {
                              setState(() {
                                isCheckBoxActive = !isCheckBoxActive;
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                IgnorePointer(
                                  child: Checkbox(
                                    value: isCheckBoxActive,
                                    focusColor: mainAppColor,
                                    activeColor: mainAppColor,
                                    fillColor:
                                        MaterialStateProperty.resolveWith<
                                            Color>((Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.selected)) {
                                        return const Color(0xFF1976D2);
                                      }
                                      return const Color(0xFF5D5D5D)
                                          .withOpacity(.10);
                                    }),
                                    side: MaterialStateBorderSide.resolveWith(
                                      (states) => const BorderSide(
                                        color: Color(0xFF1976D2),
                                        width: 0.4,
                                      ),
                                    ),
                                    onChanged: (bool? value) {},
                                  ),
                                ),
                                RichText(
                                  text: const TextSpan(
                                    text: "I agree to GRIDIRON 5’s ",
                                    style: TextStyle(
                                      color: Color(0xFF81809E),
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: "Privacy Policy",
                                        style: TextStyle(
                                          color: Color(0xFF1976D2),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "and ",
                                        style: TextStyle(
                                          color: Color(0xFF81809E),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "Terms of Use.",
                                        style: TextStyle(
                                          color: Color(0xFF1976D2),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 23),
                          Center(
                            child: ButtonWidget(
                              height: 56,
                              width: 330,
                              text: "Create Account",
                              borderRadius: 10,
                              btnColor: const Color(0xFF1976D2),
                              borderColor: const Color(0xFF1976D2),
                              textColor: whiteColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              onPressed: onButtonPressed,
                            ),
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
