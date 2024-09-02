import 'package:draft_website/core/consts.dart';
import 'package:draft_website/screens/drawer_screen/drawer_tabs/nav_screens/players_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyPlayersScreen extends StatefulWidget {
  bool? isDraftPage;
  MyPlayersScreen({super.key,this.isDraftPage});

  @override
  State<MyPlayersScreen> createState() => _MyPlayersScreenState();
}

class _MyPlayersScreenState extends State<MyPlayersScreen> {
  TextEditingController mySearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: const Color(0xFFF9F8FF),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 55,
                      width: double.infinity,
                      margin: const EdgeInsets.only(right: 16),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color(0xFFD7DCE4),
                          width: 1,
                        ),
                      ),
                      child: Center(
                        child: TextField(
                          controller: mySearchController,
                          textInputAction: TextInputAction.done,
                          style: const TextStyle(
                            color: Color(0xFF8B98B1),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: InputDecoration(
                            fillColor: whiteColor,
                            filled: true,
                            hoverColor: Colors.transparent,
                            hintText: "Search Player...",
                            prefixIcon:
                                SvgPicture.asset("assets/web_icons/search.svg"),
                            prefixIconConstraints: const BoxConstraints(
                              minHeight: 10,
                              minWidth: 55,
                            ),
                            hintStyle: const TextStyle(
                              color: Color(0xFF8B98B1),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.only(
                              left: 20,
                              right: 12,
                              top: 20,
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
              const SizedBox(height: 20),
               PlayersScreen(
                 isShowBackButton: false,
                 title: "My Players",
                 isDraftPage: widget.isDraftPage,
               )
            ],
          ),
        ),
      ),
    );
  }
}
