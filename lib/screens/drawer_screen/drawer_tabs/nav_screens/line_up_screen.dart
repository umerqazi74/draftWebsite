import 'package:draft_website/core/button_widget.dart';
import 'package:draft_website/core/clickable_widget.dart';
import 'package:draft_website/core/consts.dart';
import 'package:draft_website/screens/drawer_screen/drawer_tabs/nav_screens/nav_widgets.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LineUpScreen extends StatefulWidget {
  final Function()? onBackTap;

  const LineUpScreen({
    super.key,
    this.onBackTap,
  });

  @override
  State<LineUpScreen> createState() => _LineUpScreenState();
}

class _LineUpScreenState extends State<LineUpScreen> {
  String selectedFormation = '';

  final List<String> formationItems = [
    "4-4-3",
  ];

  @override
  void initState() {
    selectedFormation = formationItems[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InkWellWidget(
          onTap: widget.onBackTap,
          child: Row(
            children: <Widget>[
              SvgPicture.asset("assets/web_icons/left_side.svg"),
              const SizedBox(width: 10),
              const Text(
                "Back / Lineup",
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
          children: <Widget>[
            Expanded(
              child: Text(
                "Lineup",
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
              text: "Save",
              borderRadius: 10,
              btnColor: const Color(0xFF1976D2),
              borderColor: const Color(0xFF1976D2),
              textColor: whiteColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              onPressed: () {},
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Text(
          "Select Formation",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Color(0xFF23303B),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                height: 55,
                width: 373,
                margin: const EdgeInsets.only(top: 20, right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: whiteColor,
                ),
                child: Theme(
                  data: ThemeData(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      iconStyleData: IconStyleData(
                        icon: SvgPicture.asset(
                          "assets/web_icons/down_side.svg",
                        ),
                      ),
                      selectedItemBuilder: (BuildContext context) {
                        return formationItems.map<Widget>((String item) {
                          return Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                item,
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  color: Color(0xFF8E949A),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          );
                        }).toList();
                      },
                      items: formationItems
                          .map(
                            (item) => DropdownMenuItem<String>(
                              value: item,
                              child: item == selectedFormation
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                          color: blackColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                          color: Color(0xFF8E949A),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                            ),
                          )
                          .toList(),
                      value: selectedFormation,
                      onChanged: (value) {
                        print("Pressed");
                        setState(() {
                          selectedFormation = value as String;
                        });
                      },
                      buttonStyleData: const ButtonStyleData(
                        height: 48,
                        width: double.infinity,
                        padding: EdgeInsets.only(
                          left: 10,
                          right: 10,
                        ),
                      ),
                      dropdownStyleData: DropdownStyleData(
                        maxHeight: 200,
                        elevation: 1,
                        offset: const Offset(0, -5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: whiteColor,
                        ),
                        scrollbarTheme: ScrollbarThemeData(
                          radius: const Radius.circular(40),
                          thickness: MaterialStateProperty.all(2),
                          thumbVisibility: MaterialStateProperty.all(true),
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 48,
                        padding: EdgeInsets.only(left: 10, right: 10),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Expanded(
              child: SizedBox(),
            ),
          ],
        ),
        Stack(
          children: <Widget>[
            Container(
              height: 1000,
              width: double.infinity,
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "assets/web_images/pitch.png",
                  ),
                ),
              ),

            ),
            const Center(
              child: SizedBox(
                width: 500,
                height: 800,
                child: Padding(
                  padding: EdgeInsets.only(top: 100),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      LineUpItemsWidget(
                        image: "assets/web_images/profile1.png",
                        number: "64",
                      ),
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          LineUpItemsWidget(
                            image: "assets/web_images/profile1.png",
                            number: "64",
                          ),
                          LineUpItemsWidget(
                            image: "assets/web_images/profile1.png",
                            number: "64",
                          ),
                          LineUpItemsWidget(
                            image: "assets/web_images/profile1.png",
                            number: "64",
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            LineUpItemsWidget(
                              image: "assets/web_images/profile1.png",
                              number: "64",
                            ),
                            LineUpItemsWidget(
                              image: "assets/web_images/profile1.png",
                              number: "64",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          LineUpItemsWidget(
                            image: "assets/web_images/profile1.png",
                            number: "64",
                          ),
                          LineUpItemsWidget(
                            image: "assets/web_images/profile1.png",
                            number: "64",
                          ),
                          LineUpItemsWidget(
                            image: "assets/web_images/profile1.png",
                            number: "64",
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                      LineUpItemsWidget(
                        image: "assets/web_images/profile1.png",
                        number: "64",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
