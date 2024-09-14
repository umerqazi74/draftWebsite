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
