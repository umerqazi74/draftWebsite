import 'package:draft_website/core/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../drawer_widget/drawer_widgets.dart';

class RightSideDesign extends StatelessWidget {
  const RightSideDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: MediaQuery.of(context).size.width >= 1200 ? 350 : 200,
      decoration: const BoxDecoration(
        color: whiteColor,
        border: Border(
          left: BorderSide(
            color: borderColor,
            width: 1,
          ),
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset(
                    "assets/web_icons/notification.svg",
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    "Notification",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Color(0xFF56555C),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: borderColor,
                margin: const EdgeInsets.only(top: 20, bottom: 20),
              ),
              const NotificationItemsWidget(
                date: "Apr 2, 2023",
                title: "System Update",
                subTitle:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut id dui mi. Fusce varius bibendum ante, non lacinia. Fall usasc ce variu slorem ipsum dolor sit amet",
              ),
              const NotificationItemsWidget(
                date: "Apr 3, 2023",
                title: "Winner!!! Team ABC",
                subTitle:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut id dui mi. Fusce varius bibendum ante, non lacinia. Fall usasc ce variu slorem ipsum dolor sit amet",
              ),
              const NotificationItemsWidget(
                date: "Apr 4, 2023",
                title: "System upgrade",
                subTitle:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut id dui mi. Fusce varius bibendum ante, non lacinia. Fall usasc ce variu slorem ipsum dolor sit amet",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
