import 'package:draft_website/bloc/home_bloc/home_bloc.dart';
import 'package:draft_website/core/button_widget.dart';
import 'package:draft_website/core/clickable_widget.dart';
import 'package:draft_website/core/consts.dart';
import 'package:draft_website/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

//drawerItemsWidget...
class DrawerItemsWidget extends StatelessWidget {
  final int id;
  final String title;
  final String svgIcon;

  const DrawerItemsWidget({
    super.key,
    required this.id,
    required this.title,
    required this.svgIcon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (id == 0) {
          context.read<HomeBloc>().add(const DoSelectDrawerEvent(0));
        } else if (id == 1) {
          context.read<HomeBloc>().add(const DoSelectDrawerEvent(1));
        } else if (id == 2) {
          context.read<HomeBloc>().add(const DoSelectDrawerEvent(2));
        } else if (id == 3) {
          context.read<HomeBloc>().add(const DoSelectDrawerEvent(3));
        }
        // else if (id == 4) {
        //   context.read<HomeBloc>().add(const DoSelectDrawerEvent(4));
        // }
      },
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          bool isActive;
          if (state.index == id) {
            isActive = true;
          } else {
            isActive = false;
          }
          return Container(
            height: 50,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              color: isActive ? mainAppColor : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Row(
                children: <Widget>[
                  SvgPicture.asset(
                    svgIcon,
                    colorFilter: ColorFilter.mode(
                      isActive ? whiteColor : const Color(0xFF9896A3),
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      title,
                      maxLines: 1,
                      style: TextStyle(
                        color: isActive ? whiteColor : const Color(0xFF9896A3),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

//drawer team widget...
class DrawerTeamWidget extends StatelessWidget {
  final String image, title;
  final Function()? onTap;

  const DrawerTeamWidget({
    super.key,
    required this.image,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      color: Colors.transparent,
      child: Center(
        child: Row(
          children: <Widget>[
            Image.asset(
              height: 32,
              width: 32,
              image,
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Color(0xFF888793),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//logout widget...
class LogoutWidget extends StatelessWidget {
  const LogoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWellWidget(
      onTap: () {
        return showDialog<void>(
          context: context,
          barrierColor: const Color(0xFF1E1E1E).withOpacity(.50),
          barrierDismissible: true,
          builder: (BuildContext context) {
            return AlertDialog(
              insetPadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.zero,
              content: Container(
                height: 300,
                width: 380,
                padding:
                    const EdgeInsets.symmetric(horizontal: 48, vertical: 38),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  children: <Widget>[
                    const Text(
                      "Are you sure?",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF1289C4),
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Text(
                      "Are you sure you want to logout?",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFA4A9AE),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 30),
                    ButtonWidget(
                      text: "Log Out",
                      height: 55,
                      borderRadius: 9,
                      btnColor: const Color(0xFF1D5EFF),
                      borderColor: const Color(0xFF1D5EFF),
                      textColor: whiteColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const LoginScreen(),
                          ),
                          (route) => false,
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    ButtonWidget(
                      text: "Cancel",
                      height: 55,
                      borderRadius: 7,
                      btnColor: const Color(0xFFA4A9AE).withOpacity(.15),
                      borderColor: const Color(0xFFA4A9AE).withOpacity(.15),
                      textColor: const Color(0xFF8E949A),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Container(
        height: 50,
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color(0xFFE6E4F0),
            width: 1,
          ),
        ),
        child: Center(
          child: Row(
            children: <Widget>[
              SvgPicture.asset(
                "assets/web_icons/logout.svg",
              ),
              const SizedBox(width: 40),
              const Expanded(
                child: Text(
                  "Logout",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Color(0xFF53515B),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//profile Info widget...
class ProfileInfoWidget extends StatelessWidget {
  final String image, title, subTitle;
  final Function()? onTap;

  const ProfileInfoWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWellWidget(
      onTap: onTap,
      child: Container(
        height: 64,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: borderColor,
            width: 1,
          ),
        ),
        child: Center(
          child: Row(
            children: <Widget>[
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(image))
                ),
                child: Column(
                 mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 11,
                      width: 11,
                      margin: EdgeInsets.fromLTRB(0, 0, 3, 4),
                      alignment: Alignment.bottomRight,
                      decoration: BoxDecoration(
                        color: title=="Connected"?Colors.green:Colors.red,
                      ),
                      // color: Colors.red,
                    ),
                  ],
                ),
                // child: Image.asset(
                //   height: 48,
                //   width: 48,
                //   image,
                // ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color(0xFF53515B),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    // Text(
                    //   subTitle,
                    //   maxLines: 1,
                    //   overflow: TextOverflow.ellipsis,
                    //   style: const TextStyle(
                    //     color: Color(0xFFA0A0A3),
                    //     fontSize: 14,
                    //     fontWeight: FontWeight.w400,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//notification items widget...
class NotificationItemsWidget extends StatelessWidget {
  final String date, title, subTitle;

  const NotificationItemsWidget({
    super.key,
    required this.date,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            spreadRadius: 0,
            blurRadius: 8,
            offset: const Offset(0, 4),
            color: const Color(0xFF060315).withOpacity(.08),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                "assets/web_icons/paper.svg",
              ),
              const SizedBox(width: 6),
              Text(
                date,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Color(0xFFA3A3A3),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Color(0xFF4F4F4F),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            subTitle,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Color(0xFF999999),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
