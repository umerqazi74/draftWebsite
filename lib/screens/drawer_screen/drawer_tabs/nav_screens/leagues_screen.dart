import 'package:draft_website/core/button_widget.dart';
import 'package:draft_website/core/clickable_widget.dart';
import 'package:draft_website/core/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'nav_widgets.dart';

class LeaguesScreen extends StatefulWidget {
  final bool isShowBackButton;
  final Function()? onBackTap;

  const LeaguesScreen({
    super.key,
    this.onBackTap,
    this.isShowBackButton = true,
  });

  @override
  State<LeaguesScreen> createState() => _LeaguesScreenState();
}

class _LeaguesScreenState extends State<LeaguesScreen> {
  bool isShowLeaguesDetail = false;

  @override
  Widget build(BuildContext context) {
    return isShowLeaguesDetail
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              InkWellWidget(
                onTap: () {
                  setState(() {
                    isShowLeaguesDetail = false;
                  });
                },
                child: Row(
                  children: <Widget>[
                    SvgPicture.asset("assets/web_icons/left_side.svg"),
                    const SizedBox(width: 10),
                    Text(
                      widget.isShowBackButton
                          ? "Back / Leagues / Leagues Details"
                          : "Back / Leagues Details",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
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
                      "Leagues Details",
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
                    text: "Apply",
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
              const Row(
                children: <Widget>[
                  Expanded(
                    child: LeaguesItemsWidget(
                      title: "Stars\nLeague",
                      isShowIcons: false,
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: SizedBox(),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const LeagueDetailItemsWidget(
                lineColor: Color(0xFFF9F8FF),
                pos: "POS",
                club: "CLUB",
                w: "W",
                d: "D",
                l: "L",
                pts: "PTS",
                isHeader: true,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                primary: false,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: 16,
                itemBuilder: (BuildContext context, int index) {
                  return LeagueDetailItemsWidget(
                    lineColor: const Color(0xFF14C57B),
                    pos: index.toString(),
                    club: "Victory Green",
                    w: "34",
                    d: "25",
                    l: "47",
                    pts: "80",
                  );
                },
              ),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (widget.isShowBackButton)
                InkWellWidget(
                  onTap: widget.onBackTap,
                  child: Row(
                    children: <Widget>[
                      SvgPicture.asset("assets/web_icons/left_side.svg"),
                      const SizedBox(width: 10),
                      const Text(
                        "Back / Leagues",
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
              Text(
                "Leagues",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: textColorOne,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                primary: false,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  mainAxisExtent: 78,
                ),
                itemCount: 8,
                itemBuilder: (BuildContext context, int index) {
                  return LeaguesItemsWidget(
                    title: "Stars\nLeague",
                    onTap: () {
                      setState(() {
                        isShowLeaguesDetail = true;
                      });
                    },
                  );
                },
              ),
            ],
          );
  }
}
