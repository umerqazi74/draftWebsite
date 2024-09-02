import 'package:draft_website/core/button_widget.dart';
import 'package:draft_website/core/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

//team items widget...
class TeamItemsWidget extends StatelessWidget {
  final String icon, name, playerQuantity, coachQuantity;
  final Function()? onEditTeamTap;

  const TeamItemsWidget({
    super.key,
    required this.icon,
    required this.name,
    required this.playerQuantity,
    required this.coachQuantity,
    this.onEditTeamTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(14, 20, 14, 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F8FF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.centerRight,
            children: <Widget>[
              Center(child: SvgPicture.asset(icon)),
              Container(
                height: 33,
                width: 33,
                decoration: const BoxDecoration(
                  color: whiteColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgPicture.asset("assets/web_icons/right_side.svg"),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColorOne,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Players - $playerQuantity",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColorOne,
              fontSize: 11,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "$coachQuantity coach",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColorOne,
              fontSize: 11,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 10),
          ButtonWidget(
            height: 55,
            width: double.infinity,
            text: "Edit Team",
            borderRadius: 15,
            btnColor: whiteColor,
            borderColor: whiteColor,
            textColor: textColorOne,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            onPressed: onEditTeamTap,
          ),
        ],
      ),
    );
  }
}

//match items widget...
class MatchItemsWidget extends StatelessWidget {
  final String match, teamOneName, teamTwoName, date, time, league;
  final Color teamOneColor, teamTwoColor;
  final Function()? onTap;

  const MatchItemsWidget({
    super.key,
    required this.match,
    required this.teamOneName,
    required this.teamTwoName,
    required this.teamOneColor,
    required this.teamTwoColor,
    required this.date,
    required this.time,
    required this.league,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          match,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColorOne,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        Stack(
          children: <Widget>[
            Container(
              height: 54,
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 10),
              margin: const EdgeInsets.only(top: 42),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          SvgPicture.asset("assets/web_icons/calendar.svg"),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              "$date\n$time",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Color(0xFF173477),
                                fontSize: 9,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          SvgPicture.asset("assets/web_icons/cup.svg"),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              league,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Color(0xFF173477),
                                fontSize: 9,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFF3F3F3),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 11.8,
                    offset: const Offset(0, 6.64),
                    color: blackColor.withOpacity(.03),
                  )
                ],
              ),
              child: Center(
                child: Row(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          height: 28,
                          width: 28,
                          decoration: BoxDecoration(
                            color: teamOneColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Container(
                          height: 28,
                          width: 28,
                          margin: const EdgeInsets.only(left: 22),
                          decoration: BoxDecoration(
                            color: teamTwoColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: RichText(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          text: teamOneName,
                          style: TextStyle(
                            color: teamOneColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                          children: <TextSpan>[
                            const TextSpan(
                              text: '  vs  ',
                              style: TextStyle(
                                color: Color(0xFF01091C),
                                fontSize: 5.6,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text: teamTwoName,
                              style: TextStyle(
                                color: teamTwoColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
