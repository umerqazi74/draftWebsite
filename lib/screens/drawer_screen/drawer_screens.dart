import 'package:draft_website/bloc/home_bloc/home_bloc.dart';
import 'package:draft_website/bloc/player_bloc/player_bloc.dart';
import 'package:draft_website/core/consts.dart';
import 'package:draft_website/meta_mask_feature/meta_mask_connector.dart';
import 'package:draft_website/screens/drawer_screen/drawer_tabs/teams/teams_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'drawer_tabs/draft/draft_screen.dart';
import 'drawer_tabs/home/home_screen.dart';
import 'drawer_tabs/leagues/leagues_drawer_screen.dart';
import 'drawer_tabs/profile/profile_screen.dart';
import 'drawer_widget/drawer_side_menu.dart';

class DrawerPage extends StatelessWidget {
  final int selectedIndex;
  const DrawerPage({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlayerBloc(),
      child: DrawerScreens(
        selectedIndex: selectedIndex,
      ),
    );
  }
}

class DrawerScreens extends StatefulWidget {
  final int selectedIndex;

  const DrawerScreens({super.key, required this.selectedIndex});

  @override
  State<DrawerScreens> createState() => _DrawerScreensState();
}

class _DrawerScreensState extends State<DrawerScreens> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<Widget> drawerPages = [
    // const DraftScreen(),
     MyPlayersScreen(isDraftPage: true,),
    const MetaMaskConnector(featureToOpen: "myPlayers"),
    const MetaMaskConnector(featureToOpen: "myTeam"),
    // const TeamsScreen(),
    const LeaguesDrawerScreen(),
    const ProfileScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            key: _scaffoldKey,
            backgroundColor: whiteColor,
            drawer: const DrawerSideMenu(),
            body:
            // Responsive.isDesktop(context)
            //     ? Row(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: <Widget>[
            //           Expanded(
            //             child: drawerPages[state.index],
            //           ),
            //           const RightSideDesign(),
            //         ],
            //       )
            //     :
            drawerPages[state.index],
          ),
        );
      },
    );
  }
}
