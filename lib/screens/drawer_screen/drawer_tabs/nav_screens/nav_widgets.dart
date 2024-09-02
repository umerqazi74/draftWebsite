import 'package:draft_website/core/button_widget.dart';
import 'package:draft_website/core/clickable_widget.dart';
import 'package:draft_website/core/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/percent_indicator.dart';

//file items widget...
class FileItemsWidget extends StatelessWidget {
  final String title, date;
  final Color boxColor;
  final Function()? onFileTap;

  const FileItemsWidget({
    super.key,
    required this.title,
    required this.date,
    required this.boxColor,
    this.onFileTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWellWidget(
      onTap: onFileTap,
      child: SizedBox(
        height: 164,
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            Container(
              height: 140,
              margin: const EdgeInsets.only(top: 23),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                border: Border.all(
                  color: borderColor,
                  width: 1,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SvgPicture.asset(
                        "assets/web_icons/file_ring.svg",
                        colorFilter: ColorFilter.mode(
                          boxColor,
                          BlendMode.srcIn,
                        ),
                      ),
                      const SizedBox(width: 7),
                      Expanded(
                        child: Text(
                          title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Color(0xFF82808F),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          date,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Color(0xFFA3A3A3),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(width: 7),
                      SvgPicture.asset(
                        "assets/web_icons/right_side1.svg",
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SvgPicture.asset("assets/web_icons/file_shade.svg"),
          ],
        ),
      ),
    );
  }
}

//players items widget...
class PlayersItemsWidget extends StatelessWidget {
  final String image, name, dob, status;
  final double speed, shootPrecision, shootPower, dribble, mentality;
  final Function()? onTapSeeMore;

  const PlayersItemsWidget({
    super.key,
    required this.name,
    required this.dob,
    required this.speed,
    required this.shootPrecision,
    required this.shootPower,
    required this.dribble,
    required this.mentality,
    this.onTapSeeMore,
    required this.image,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 265,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 17),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Player name",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: textColorOne,
                        fontSize: 9,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "DOB",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: textColorOne,
                        fontSize: 9,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Stack(
                children: <Widget>[
                  Container(
                    height: 34,
                    width: 18,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color(0xFFD7D7D7),
                        width: 0.76,
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(image),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: SvgPicture.asset(
                      height: 17,
                      width: 17,
                      status == "free"
                          ? "assets/web_icons/blue_per.svg"
                          : status == "loaned"
                              ? "assets/web_icons/yellow_per.svg"
                              : "assets/web_icons/green_per.svg",
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: textColorOne,
                        fontSize: 10.50,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      dob,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: textColorOne,
                        fontSize: 10.50,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          LinearItemsWidget(
            title: "Speed",
            value: speed,
          ),
          LinearItemsWidget(
            title: "Shoot Precision",
            value: shootPrecision,
          ),
          LinearItemsWidget(
            title: "Shoot Power",
            value: shootPower,
          ),
          LinearItemsWidget(
            title: "Dribble",
            value: dribble,
          ),
          LinearItemsWidget(
            title: "Mentality",
            value: mentality,
          ),
          const SizedBox(height: 10),
          ButtonWidget(
            height: 42,
            width: double.infinity,
            text: "See More",
            borderRadius: 12,
            btnColor: const Color(0xFFF9F8FF),
            borderColor: const Color(0xFFF9F8FF),
            textColor: textColorOne,
            fontSize: 10.57,
            fontWeight: FontWeight.w600,
            onPressed: onTapSeeMore,
          ),
        ],
      ),
    );
  }
}

//linear items widget...
class LinearItemsWidget extends StatelessWidget {
  final String title;
  final double value;
  final bool isBig;

  const LinearItemsWidget({
    super.key,
    required this.value,
    required this.title,
    this.isBig = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: textColorOne,
                  fontSize: isBig ? 9 : 8,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Text(
              value.toStringAsFixed(0),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF14233A),
                fontSize: isBig ? 9 : 8,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(height: isBig ? 6 : 2),
        LinearPercentIndicator(
          padding: EdgeInsets.zero,
          lineHeight: isBig ? 5.3 : 4,
          barRadius: const Radius.circular(10),
          percent: value / 100,
          center: const SizedBox(),
          backgroundColor: const Color(0xFFB9C0C9),
          progressColor: const Color(0xFF1976D2),
        ),
        SizedBox(height: isBig ? 27 : 6),
      ],
    );
  }
}

//tags widget...
class TagsWidget extends StatelessWidget {
  final String title, icons;

  const TagsWidget({
    super.key,
    required this.title,
    required this.icons,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SvgPicture.asset(icons),
        const SizedBox(height: 7),
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColorOne,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

//leagues items widget...
class LeaguesItemsWidget extends StatelessWidget {
  final String title;
  final bool isShowIcons;
  final Function()? onTap;

  const LeaguesItemsWidget({
    super.key,
    required this.title,
    this.onTap,
    this.isShowIcons = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWellWidget(
      onTap: onTap,
      child: Container(
        height: 78,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 22),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color(0xFFF3F3F3),
            width: 1,
          ),
        ),
        child: Center(
          child: Row(
            children: <Widget>[
              SvgPicture.asset("assets/web_icons/star_leagues.svg"),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    height: 1,
                    color: textColorOne,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              if (isShowIcons) const SizedBox(width: 20),
              if (isShowIcons)
                SvgPicture.asset(
                  "assets/web_icons/right_side.svg",
                  colorFilter: const ColorFilter.mode(
                    Color(0xFF4F4F4F),
                    BlendMode.srcIn,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

//staff items widget...
class StaffItemsWidget extends StatelessWidget {
  final String name, role;
  final Function()? onTap;

  const StaffItemsWidget({
    super.key,
    required this.name,
    required this.role,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 22),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xFF60708F),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Role - $role",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xFF60708F),
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            RotatedBox(
              quarterTurns: 3,
              child: SvgPicture.asset(
                "assets/web_icons/down_side.svg",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//leagues detail items widget...
class LeagueDetailItemsWidget extends StatelessWidget {
  final String pos, club, w, d, l, pts;
  final Function()? onTap;
  final bool isHeader;
  final Color lineColor;

  const LeagueDetailItemsWidget({
    super.key,
    this.onTap,
    required this.pos,
    required this.club,
    required this.w,
    required this.d,
    required this.l,
    required this.pts,
    this.isHeader = false,
    required this.lineColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43,
      width: double.infinity,
      padding: const EdgeInsets.only(right: 10),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: isHeader ? const Color(0xFFF9F8FF) : const Color(0xFFF3F3F3),
        borderRadius: BorderRadius.circular(9),
      ),
      child: Center(
        child: Row(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: 9,
              decoration: BoxDecoration(
                color: lineColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(9),
                  bottomLeft: Radius.circular(9),
                ),
              ),
            ),
            Expanded(
              child: Text(
                pos,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isHeader ? const Color(0xFF8EA2AB) : textColorOne,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              flex: 3,
              child: Text(
                club,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isHeader ? const Color(0xFF8EA2AB) : textColorOne,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Text(
                w,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isHeader ? const Color(0xFF8EA2AB) : textColorOne,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Text(
                d,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isHeader ? const Color(0xFF8EA2AB) : textColorOne,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Text(
                l,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isHeader ? const Color(0xFF8EA2AB) : textColorOne,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              height: double.infinity,
              width: 5,
              color: isHeader ? const Color(0xFFF9F8FF) : whiteColor,
            ),
            Expanded(
              child: Text(
                pts,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isHeader ? const Color(0xFF8EA2AB) : textColorOne,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//profile items widget...
class ProfileItemsWidget extends StatelessWidget {
  final String name;
  final Function()? onTap;

  const ProfileItemsWidget({
    super.key,
    required this.name,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWellWidget(
      onTap: onTap,
      child: Container(
        height: 55,
        width: 264,
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.symmetric(horizontal: 22),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFF8E949A),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              RotatedBox(
                quarterTurns: 3,
                child: SvgPicture.asset(
                  "assets/web_icons/down_side.svg",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//line up items widget...
class LineUpItemsWidget extends StatelessWidget {
  final String image, number;

  const LineUpItemsWidget({
    super.key,
    required this.image,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 66,
          width: 66,
          decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(
              color: blackColor,
              width: 1,
            ),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(image),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            height: 26,
            width: 26,
            decoration: const BoxDecoration(
              color: blackColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                number,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: whiteColor,
                  fontSize: 9,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
