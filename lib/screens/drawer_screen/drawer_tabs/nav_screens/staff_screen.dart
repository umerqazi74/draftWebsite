import 'package:draft_website/core/button_widget.dart';
import 'package:draft_website/core/clickable_widget.dart';
import 'package:draft_website/core/consts.dart';
import 'package:draft_website/core/text_form_field_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'nav_widgets.dart';

class StaffScreen extends StatefulWidget {
  final Function()? onBackTap;

  const StaffScreen({
    super.key,
    this.onBackTap,
  });

  @override
  State<StaffScreen> createState() => _StaffScreenState();
}

class _StaffScreenState extends State<StaffScreen> {
  var myFormKey = GlobalKey<FormState>();
  TextEditingController myNameController = TextEditingController();
  TextEditingController myPositionController = TextEditingController();

  bool isShowAddStaff = false;

  @override
  Widget build(BuildContext context) {
    return isShowAddStaff
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              InkWellWidget(
                onTap: () {
                  setState(() {
                    isShowAddStaff = false;
                  });
                },
                child: Row(
                  children: <Widget>[
                    SvgPicture.asset("assets/web_icons/left_side.svg"),
                    const SizedBox(width: 10),
                    const Text(
                      "Back / Team Staff Management / Add Staff",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Color(0xFF4F4F4F),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      "Add Staff",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: textColorOne,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  ButtonWidget(
                    height: 46,
                    width: 150,
                    text: "Add Staff",
                    borderRadius: 10,
                    btnColor: const Color(0xFF1976D2),
                    borderColor: const Color(0xFF1976D2),
                    textColor: whiteColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    onPressed: () {
                      if (myFormKey.currentState!.validate()) {
                        setState(() {
                          isShowAddStaff = false;
                        });
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Form(
                key: myFormKey,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            "Staff Name",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Color(0xFF23303B),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextFormFieldWidget(
                            myController: myNameController,
                            hintText: "-----------",
                            validator:
                                RequiredValidator(errorText: "*required").call,
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
                            "Staff Position",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Color(0xFF23303B),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextFormFieldWidget(
                            myController: myPositionController,
                            hintText: "-----------",
                            validator:
                                RequiredValidator(errorText: "*required").call,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              InkWellWidget(
                onTap: widget.onBackTap,
                child: Row(
                  children: <Widget>[
                    SvgPicture.asset("assets/web_icons/left_side.svg"),
                    const SizedBox(width: 10),
                    const Text(
                      "Back / Team Staff Management",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Color(0xFF4F4F4F),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "Team Staff Management",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: textColorOne,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "List of staff members with roles and qualifications",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: textColorOne,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ButtonWidget(
                    height: 46,
                    width: 150,
                    text: "Add Staff",
                    borderRadius: 10,
                    btnColor: const Color(0xFF1976D2),
                    borderColor: const Color(0xFF1976D2),
                    textColor: whiteColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    onPressed: () {
                      setState(() {
                        isShowAddStaff = true;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                primary: false,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 40,
                  mainAxisExtent: 78,
                ),
                itemCount: 8,
                itemBuilder: (BuildContext context, int index) {
                  return const StaffItemsWidget(
                    name: "John Copland",
                    role: "Cleaner",
                  );
                },
              ),
            ],
          );
  }
}
