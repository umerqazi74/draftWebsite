import 'package:draft_website/bloc/player_bloc/player_bloc.dart';
import 'package:draft_website/core/button_widget.dart';
import 'package:draft_website/core/clickable_widget.dart';
import 'package:draft_website/core/consts.dart';
import 'package:draft_website/screens/drawer_screen/drawer_tabs/nav_screens/nav_widgets.dart';
import 'package:draft_website/screens/drawer_screen/drawer_tabs/nav_screens/players_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PlayersScreen extends StatefulWidget {
  final Function()? onBackTap;
  final bool isShowBackButton;
  final String title;
  bool? isDraftPage;

   PlayersScreen({
    super.key,
    this.onBackTap,
    this.isShowBackButton = true,
    this.title = "Players",
    this.isDraftPage
  });

  @override
  State<PlayersScreen> createState() => _PlayersScreenState();
}

class _PlayersScreenState extends State<PlayersScreen> {
  bool isShowDetail = false;
  int selectedIndex = -1;

  @override
  void initState() {
    context.read<PlayerBloc>().add(
          DoGetPlayersDataEvent(isDraftPage: widget.isDraftPage),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlayerBloc, PlayerState>(
      listener: (BuildContext context, Object? state) {},
      builder: (BuildContext context, state) {
        if (state is GetPlayersSuccessState) {
          return isShowDetail
              ? PlayerDetailScreen(
                  status: state.listPlayers[selectedIndex].status!,
                  image:
                      state.listPlayers[selectedIndex].imageUrl?.isEmpty ?? true
                          ? ""
                          : state.listPlayers[selectedIndex].imageUrl!,
                  name: state.listPlayers[selectedIndex].name?.isEmpty ?? true
                      ? ""
                      : state.listPlayers[selectedIndex].name!,
                  dob: state.listPlayers[selectedIndex].birthday!,
                  speed: state.listPlayers[selectedIndex].speed!,
                  shootPrecision:
                      state.listPlayers[selectedIndex].shootPrecision!,
                  shootPower: state.listPlayers[selectedIndex].shootPower!,
                  dribble: state.listPlayers[selectedIndex].dribble!,
                  mentality: state.listPlayers[selectedIndex].physicality!,
                  injuryRisk: state.listPlayers[selectedIndex].injuryRisk!,
                  passPrecision:
                      state.listPlayers[selectedIndex].passPrecision!,
                  tacklePrecision:
                      state.listPlayers[selectedIndex].tacklePrecision!,
                  aggression: state.listPlayers[selectedIndex].aggression!,
                  diving: state.listPlayers[selectedIndex].diving!,
                  kicking: state.listPlayers[selectedIndex].gKKicking!,
                  reflexes: state.listPlayers[selectedIndex].reflexes!,
                  gameVision: state.listPlayers[selectedIndex].gameVision!,
                  leaderShip: state.listPlayers[selectedIndex].gKKicking!,
                  title: widget.isShowBackButton ? "Players" : "My Players",
                  onBackTap: () {
                    setState(() {
                      isShowDetail = false;
                    });
                  },
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
                              "Back / Players",
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
                      widget.isDraftPage==true?"Draft": widget.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: textColorOne,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 20),
                    state.listPlayers.isEmpty
                        ? clickToAdd?
                        PlayersScreen(isDraftPage: true,)
                        :
                    Container(
                            height: 470,
                            width: 400,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 50),
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(18),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 23,
                                  offset: const Offset(0, 11),
                                  color: borderColor.withOpacity(.20),
                                )
                              ],
                            ),
                            child: Column(
                              children: <Widget>[
                                SvgPicture.asset("assets/web_icons/empty.svg"),
                                const Text(
                                  "No player found Try adding players from the available ones.",
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF4A4A4A),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 30),
                                ButtonWidget(
                                  text: "+ Add Player",
                                  height: 55,
                                  borderRadius: 30,
                                  btnColor: const Color(0xFF1D5EFF),
                                  borderColor: const Color(0xFF1D5EFF),
                                  textColor: whiteColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  onPressed: () {

                                    setState(() {
                                      clickToAdd = true;
                                    });
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (BuildContext context) =>
                                    //         const DrawerScreens(selectedIndex: 1),
                                    //   ),
                                    // );
                                  },
                                ),
                              ],
                            ),
                          )
                        :
                    StreamBuilder(
                      stream: _delayedStream(),
                      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(
                            child: SpinKitFadingCircle(
                              color: mainAppColor,
                              size: 30,
                            ),
                          ); // Show a loading indicator while waiting
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }
                        return SingleChildScrollView(
                          child: GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            primary: false,
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 20,
                              mainAxisExtent: 265,
                            ),
                            itemCount: state.listPlayers.length,
                            itemBuilder: (BuildContext context, int index) {
                              return PlayersItemsWidget(
                                status: state.listPlayers[index].status!,
                                image: state.listPlayers[index].imageUrl
                                    ?.isEmpty ??
                                    true
                                    ? ""
                                    : state.listPlayers[index].imageUrl!,
                                name: state.listPlayers[index].name?.isEmpty ??
                                    true
                                    ? ""
                                    : state.listPlayers[index].name!,
                                dob: state.listPlayers[index].birthday!,
                                speed: state.listPlayers[index].speed!,
                                shootPrecision:
                                state.listPlayers[index].shootPrecision!,
                                shootPower:
                                state.listPlayers[index].shootPower!,
                                dribble: state.listPlayers[index].diving!,
                                mentality:
                                state.listPlayers[index].physicality!,
                                onTapSeeMore: () {
                                  setState(() {
                                    isShowDetail = true;
                                    selectedIndex = index;
                                  });
                                },
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ],
                );
        } else if (state is GetPlayersFailureState) {
          return Container();
        } else if (state is GetPlayersLoadingState) {
          return const Center(
            child: SpinKitFadingCircle(
              color: mainAppColor,
              size: 30,
            ),
          );
        } else {
          return const Center(
            child: SpinKitFadingCircle(
              color: mainAppColor,
              size: 30,
            ),
          );
        }
      },
    );
  }

  Stream<String> _delayedStream() async* {
    await Future.delayed(const Duration(seconds: 2)); // Wait for 3 seconds
    yield 'Hello after 3 seconds!'; // Emit data after the delay
  }

  bool clickToAdd = false;


}






// class DraftPlayersScreen extends StatefulWidget {
//   final Function()? onBackTap;
//   final bool isShowBackButton;
//   final String title;
//   bool? isDraftPage;
//
//   DraftPlayersScreen({
//     super.key,
//     this.onBackTap,
//     this.isShowBackButton = true,
//     this.title = "Players",
//     this.isDraftPage
//   });
//
//   @override
//   State<DraftPlayersScreen> createState() => _DraftPlayersScreenState();
// }
//
// class _DraftPlayersScreenState extends State<DraftPlayersScreen> {
//   bool isShowDetail = false;
//   int selectedIndex = -1;
//
//   @override
//   void initState() {
//     context.read<PlayerBloc>().add(
//       DoGetPlayersDataEvent(isDraftPage: widget.isDraftPage),
//     );
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<PlayerBloc, PlayerState>(
//       listener: (BuildContext context, Object? state) {},
//       builder: (BuildContext context, state) {
//         if (state is GetPlayersSuccessState) {
//           return isShowDetail
//               ? PlayerDetailScreen(
//             status: state.listPlayers[selectedIndex].status!,
//             image:
//             state.listPlayers[selectedIndex].imageUrl?.isEmpty ?? true
//                 ? ""
//                 : state.listPlayers[selectedIndex].imageUrl!,
//             name: state.listPlayers[selectedIndex].name?.isEmpty ?? true
//                 ? ""
//                 : state.listPlayers[selectedIndex].name!,
//             dob: state.listPlayers[selectedIndex].birthday!,
//             speed: state.listPlayers[selectedIndex].speed!,
//             shootPrecision:
//             state.listPlayers[selectedIndex].shootPrecision!,
//             shootPower: state.listPlayers[selectedIndex].shootPower!,
//             dribble: state.listPlayers[selectedIndex].dribble!,
//             mentality: state.listPlayers[selectedIndex].physicality!,
//             injuryRisk: state.listPlayers[selectedIndex].injuryRisk!,
//             passPrecision:
//             state.listPlayers[selectedIndex].passPrecision!,
//             tacklePrecision:
//             state.listPlayers[selectedIndex].tacklePrecision!,
//             aggression: state.listPlayers[selectedIndex].aggression!,
//             diving: state.listPlayers[selectedIndex].diving!,
//             kicking: state.listPlayers[selectedIndex].gKKicking!,
//             reflexes: state.listPlayers[selectedIndex].reflexes!,
//             gameVision: state.listPlayers[selectedIndex].gameVision!,
//             leaderShip: state.listPlayers[selectedIndex].gKKicking!,
//             title: widget.isShowBackButton ? "Players" : "My Players",
//             onBackTap: () {
//               setState(() {
//                 isShowDetail = false;
//               });
//             },
//           )
//               : Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               if (widget.isShowBackButton)
//                 InkWellWidget(
//                   onTap: widget.onBackTap,
//                   child: Row(
//                     children: <Widget>[
//                       SvgPicture.asset("assets/web_icons/left_side.svg"),
//                       const SizedBox(width: 10),
//                       const Text(
//                         "Back / Players",
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                         style: TextStyle(
//                           color: Color(0xFF4F4F4F),
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               const SizedBox(height: 40),
//               Text(
//                 widget.title,
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//                 style: TextStyle(
//                   color: textColorOne,
//                   fontSize: 18,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               state.listPlayers.isEmpty
//                   ? Container(
//                 height: 470,
//                 width: 400,
//                 padding: const EdgeInsets.symmetric(
//                     horizontal: 30, vertical: 50),
//                 decoration: BoxDecoration(
//                   color: whiteColor,
//                   borderRadius: BorderRadius.circular(18),
//                   boxShadow: [
//                     BoxShadow(
//                       blurRadius: 23,
//                       offset: const Offset(0, 11),
//                       color: borderColor.withOpacity(.20),
//                     )
//                   ],
//                 ),
//                 child: Column(
//                   children: <Widget>[
//                     SvgPicture.asset("assets/web_icons/empty.svg"),
//                     const Text(
//                       "No player found Try adding players from the available ones.",
//                       maxLines: 3,
//                       overflow: TextOverflow.ellipsis,
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Color(0xFF4A4A4A),
//                         fontSize: 20,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     const SizedBox(height: 30),
//                     ButtonWidget(
//                       text: "+ Add Player",
//                       height: 55,
//                       borderRadius: 30,
//                       btnColor: const Color(0xFF1D5EFF),
//                       borderColor: const Color(0xFF1D5EFF),
//                       textColor: whiteColor,
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                       onPressed: () {
//                         // Navigator.push(
//                         //   context,
//                         //   MaterialPageRoute(
//                         //     builder: (BuildContext context) =>
//                         //         const DrawerScreens(selectedIndex: 1),
//                         //   ),
//                         // );
//                       },
//                     ),
//                   ],
//                 ),
//               )
//                   :
//               StreamBuilder(
//                 stream: _delayedStream(),
//                 builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return const CircularProgressIndicator(); // Show a loading indicator while waiting
//                   } else if (snapshot.hasError) {
//                     return Text('Error: ${snapshot.error}');
//                   }
//                   return GridView.builder(
//                     physics: const NeverScrollableScrollPhysics(),
//                     primary: false,
//                     shrinkWrap: true,
//                     padding: EdgeInsets.zero,
//                     gridDelegate:
//                     const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 3,
//                       mainAxisSpacing: 20,
//                       crossAxisSpacing: 20,
//                       mainAxisExtent: 265,
//                     ),
//                     itemCount: state.listPlayers.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       return PlayersItemsWidget(
//                         status: state.listPlayers[index].status!,
//                         image: state.listPlayers[index].imageUrl
//                             ?.isEmpty ??
//                             true
//                             ? ""
//                             : state.listPlayers[index].imageUrl!,
//                         name: state.listPlayers[index].name?.isEmpty ??
//                             true
//                             ? ""
//                             : state.listPlayers[index].name!,
//                         dob: state.listPlayers[index].birthday!,
//                         speed: state.listPlayers[index].speed!,
//                         shootPrecision:
//                         state.listPlayers[index].shootPrecision!,
//                         shootPower:
//                         state.listPlayers[index].shootPower!,
//                         dribble: state.listPlayers[index].diving!,
//                         mentality:
//                         state.listPlayers[index].physicality!,
//                         onTapSeeMore: () {
//                           setState(() {
//                             isShowDetail = true;
//                             selectedIndex = index;
//                           });
//                         },
//                       );
//                     },
//                   );
//                 },
//               ),
//             ],
//           );
//         } else if (state is GetPlayersFailureState) {
//           return Container();
//         } else if (state is GetPlayersLoadingState) {
//           return const Center(
//             child: SpinKitFadingCircle(
//               color: mainAppColor,
//               size: 30,
//             ),
//           );
//         } else {
//           return const Center(
//             child: SpinKitFadingCircle(
//               color: mainAppColor,
//               size: 30,
//             ),
//           );
//         }
//       },
//     );
//   }
//
//   Stream<String> _delayedStream() async* {
//     await Future.delayed(const Duration(seconds: 3)); // Wait for 3 seconds
//     yield 'Hello after 3 seconds!'; // Emit data after the delay
//   }
//
// }