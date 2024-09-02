import 'package:draft_website/core/button_widget.dart';
import 'package:draft_website/core/consts.dart';
import 'package:draft_website/core/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';

class ManageProfileTab extends StatefulWidget {
  const ManageProfileTab({super.key});

  @override
  State<ManageProfileTab> createState() => _ManageProfileTabState();
}

class _ManageProfileTabState extends State<ManageProfileTab> {
  var myFormKey = GlobalKey<FormState>();
  TextEditingController myNameController = TextEditingController();
  TextEditingController myEmailController = TextEditingController();
  TextEditingController myMobileController = TextEditingController();
  TextEditingController myPasswordController = TextEditingController();

  @override
  void initState() {
    myNameController.text = "Jonathan";
    myEmailController.text = "Jonathan123@gmail.com";
    myMobileController.text = "+1 123 3698 789";
    myPasswordController.text = "**********";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 20),
        padding: const EdgeInsets.only(left: 20),
        decoration: const BoxDecoration(
          border: Border(
            left: BorderSide(
              color: Color(0xFFD7DCE4),
              width: 1,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "Manage Profile",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Color(0xFF23303B),
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 6),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 80,
                        width: 80,
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                              "assets/web_images/profile1.png",
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: SvgPicture.asset("assets/web_icons/gallery.svg"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "Jonathan",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Color(0xFF1289C4),
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    "United State",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Color(0xFFA4A9AE),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            Form(
              key: myFormKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              "Your Name",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Color(0xFF23303B),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextFormFieldWidget(
                              myController: myNameController,
                              hintText: "Your Name",
                              validator:
                                  RequiredValidator(errorText: "*required")
                                      .call,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              "Email",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Color(0xFF23303B),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextFormFieldWidget(
                              myController: myEmailController,
                              hintText: "Email",
                              validator:
                                  RequiredValidator(errorText: "*required")
                                      .call,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              "Mobile Number ",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Color(0xFF23303B),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextFormFieldWidget(
                              myController: myMobileController,
                              textInputType: TextInputType.number,
                              hintText: "Mobile Number",
                              validator:
                                  RequiredValidator(errorText: "*required")
                                      .call,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              "Password",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Color(0xFF23303B),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextFormFieldWidget(
                              myController: myPasswordController,
                              hintText: "Password",
                              textInputAction: TextInputAction.done,
                              validator:
                                  RequiredValidator(errorText: "*required")
                                      .call,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ButtonWidget(
                      height: 55,
                      width: 150,
                      text: "Save",
                      borderRadius: 15,
                      btnColor: const Color(0xFF1976D2),
                      borderColor: const Color(0xFF1976D2),
                      textColor: whiteColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
