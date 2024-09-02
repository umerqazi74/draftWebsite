import 'package:draft_website/core/button_widget.dart';
import 'package:draft_website/core/consts.dart';
import 'package:draft_website/core/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class ComplainTab extends StatefulWidget {
  const ComplainTab({super.key});

  @override
  State<ComplainTab> createState() => _ComplainTabState();
}

class _ComplainTabState extends State<ComplainTab> {
  var myFormKey = GlobalKey<FormState>();
  TextEditingController myFirstNameController = TextEditingController();
  TextEditingController myLastNameController = TextEditingController();
  TextEditingController myMobileController = TextEditingController();
  TextEditingController myComplainController = TextEditingController();

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
              "Complain",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Color(0xFF23303B),
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
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
                              "Enter your details",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Color(0xFF23303B),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextFormFieldWidget(
                              myController: myFirstNameController,
                              hintText: "First Name",
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
                              "",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Color(0xFF23303B),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextFormFieldWidget(
                              myController: myLastNameController,
                              hintText: "Last Name",
                              validator:
                                  RequiredValidator(errorText: "*required")
                                      .call,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  TextFormFieldWidget(
                    myController: myMobileController,
                    textInputType: TextInputType.number,
                    hintText: "Mobile Number",
                    validator:
                    RequiredValidator(errorText: "*required")
                        .call,
                  ),
                  const SizedBox(height: 20),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        "Enter your Complain",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Color(0xFF23303B),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextFormFieldWidget(
                        myController: myComplainController,
                        maxLines: 5,
                        hintText: "Type  your message here..",
                        textInputAction: TextInputAction.done,
                        validator:
                        RequiredValidator(errorText: "*required")
                            .call,
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
