import 'dart:convert';

import 'package:draft_website/api/response/team_data_response.dart';
import 'package:draft_website/core/clickable_widget.dart';
import 'package:draft_website/core/consts.dart';
import 'package:draft_website/screens/drawer_screen/drawer_tabs/nav_screens/nav_widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class TeamDetailScreen extends StatefulWidget {
  final Function()? onBackTap;
  final Function(int)? onFileTap;
  final TeamDataResponse? teamDataResponse;


  const TeamDetailScreen({
    super.key,
    this.onBackTap,
    this.onFileTap,
    this.teamDataResponse,
  });

  @override
  State<TeamDetailScreen> createState() => _TeamDetailScreenState();
}

class _TeamDetailScreenState extends State<TeamDetailScreen> {
  List<String> titleList = [
    "Team Information",
    "Players",
    "Lineup",
    "Leagues",
    "Friendly Game",
    "Training",
    "Team Staff Management",
  ];
  List<Color> boxColorList = [
    const Color(0xFFFD71AF),
    const Color(0xFF00B884),
    const Color(0xFFFFC800),
    const Color(0xFF49CCF9),
    const Color(0xFF7B68EE),
    const Color(0xFF5577FF),
    const Color(0xFF23303B),
  ];

  @override
  Widget build(BuildContext context) {
    Uint8List imageBytes = base64Decode(widget.teamDataResponse!.teamMetaData!.teamLogo.toString());
    return Column(
      children: <Widget>[
        InkWellWidget(
          onTap: widget.onBackTap,
          child: Row(
            children: <Widget>[
              SvgPicture.asset("assets/web_icons/left_side.svg"),
              const SizedBox(width: 10),
              const Text(
                "Back",
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
        Container(
          height: 200,
          width: double.infinity,
          margin: const EdgeInsets.only(top: 40, bottom: 24),
          // padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 0),
          padding: const EdgeInsets.only(left: 17,right: 17,top: 25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            image: const DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                "assets/web_images/view1.png",
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // SvgPicture.asset("assets/web_icons/abc_team.svg"),
                  SizedBox(
                    width: 150,
                      height: 150,
                      child: Image.memory(imageBytes)),
                  const SizedBox(width: 14),
                  Text(
                   widget.teamDataResponse!.teamMetaData!.teamName.toString(),
                   maxLines: 1,
                   overflow: TextOverflow.ellipsis,
                   style: TextStyle(
                     color: whiteColor,
                     fontSize: 16,
                     fontWeight: FontWeight.w700,
                   ),
                  ),

                  SizedBox(width:40,),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      SizedBox(height: 100,),
                      Text(
                        "CREATED",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: blackColor.withOpacity(.40),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                       Text(
                        widget.teamDataResponse!.teamMetaData!.dateTime.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: blackColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          primary: false,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            mainAxisExtent: 163,
          ),
          itemCount: 7,
          itemBuilder: (BuildContext context, int index) {
            return FileItemsWidget(
              boxColor: boxColorList[index],
              title: titleList[index],
              date: "Apr 2, 2023",
              onFileTap: () {
                widget.onFileTap!(index);
              },
            );
          },
        ),
      ],
    );
  }
}
