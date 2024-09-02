import 'package:draft_website/core/clickable_widget.dart';
import 'package:draft_website/core/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  bool switchValue = false;

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
            InkWellWidget(
              onTap: () {
                setState(() {
                  switchValue = !switchValue;
                });
              },
              child: Container(
                height: 55,
                width: 330,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 35.87,
                      spreadRadius: 7.17,
                      offset: const Offset(0.9, 4.48),
                      color: const Color(0xFF6E7588).withOpacity(.07),
                    ),
                  ],
                ),
                child: Center(
                  child: Row(
                    children: <Widget>[
                      SvgPicture.asset(
                        "assets/web_icons/notification1.svg",
                      ),
                      const SizedBox(width: 20),
                      const Expanded(
                        child: Text(
                          "Pop-Up Notifications",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Color(0xFF23303B),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      IgnorePointer(
                        child: Switch(
                          value: switchValue,
                          activeColor: mainAppColor,
                          focusColor: mainAppColor,
                          activeTrackColor: const Color(0xFF1289C4),
                          inactiveTrackColor: const Color(0xFFEFEFEF),
                          trackOutlineColor: MaterialStateProperty.resolveWith(
                                (final Set<MaterialState> states) {
                              if (states.contains(MaterialState.selected)) {
                                return null;
                              }

                              return const Color(0xFFEFEFEF);
                            },
                          ),
                          thumbColor: MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                if (states.contains(MaterialState.disabled)) {
                                  return whiteColor;
                                }
                                return whiteColor;
                              }),
                          thumbIcon: MaterialStateProperty.all(const Icon(null)),
                          onChanged: (bool value) async {},
                        ),
                      )

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
