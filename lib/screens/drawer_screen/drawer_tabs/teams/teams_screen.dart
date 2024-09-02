import 'dart:typed_data';

import 'package:draft_website/core/button_widget.dart';
import 'package:draft_website/core/consts.dart';
import 'package:draft_website/data_models/team_model.dart';
import 'package:draft_website/screens/drawer_screen/drawer_tabs/home/home_widgets.dart';
import 'package:draft_website/screens/drawer_screen/drawer_tabs/nav_screens/friendly_screen.dart';
import 'package:draft_website/screens/drawer_screen/drawer_tabs/nav_screens/line_up_screen.dart';
import 'package:draft_website/screens/drawer_screen/drawer_tabs/nav_screens/players_screen.dart';
import 'package:draft_website/screens/drawer_screen/drawer_tabs/nav_screens/staff_screen.dart';
import 'package:draft_website/screens/drawer_screen/drawer_tabs/nav_screens/team_detail_screen.dart';
import 'package:draft_website/screens/drawer_screen/drawer_tabs/nav_screens/team_info_screen.dart';
import 'package:draft_website/screens/drawer_screen/drawer_tabs/nav_screens/training_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../api/repository/create_team_repository.dart';
import '../../../../core/common_methods.dart';
import '../nav_screens/leagues_screen.dart';

class TeamsScreen extends StatefulWidget {
  const TeamsScreen({super.key});

  @override
  State<TeamsScreen> createState() => _TeamsScreenState();
}

class _TeamsScreenState extends State<TeamsScreen> {
  TextEditingController mySearchController = TextEditingController();
  bool isShowTeamDetail = false;
  bool isShowCreateTeam = false;
  bool isShowTeamInfo = false;
  int fileIndex = -1;

  @override
  void initState() {
    teamChecker();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return error?Center(child: Text("Something went wrong!"),):
    apiCalling?const Center(child: SpinKitFadingCircle(
      color: mainAppColor,
      size: 30,),) :
    Container(
      height: double.infinity,
      color: const Color(0xFFF9F8FF),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              // Row(
              //   children: <Widget>[
              //     Expanded(
              //       child: Container(
              //         height: 55,
              //         width: double.infinity,
              //         margin: const EdgeInsets.only(right: 16),
              //         decoration: BoxDecoration(
              //           color: whiteColor,
              //           borderRadius: BorderRadius.circular(12),
              //           border: Border.all(
              //             color: const Color(0xFFD7DCE4),
              //             width: 1,
              //           ),
              //         ),
              //         child: Center(
              //           child: TextField(
              //             controller: mySearchController,
              //             textInputAction: TextInputAction.done,
              //             style: const TextStyle(
              //               color: Color(0xFF8B98B1),
              //               fontSize: 16,
              //               fontWeight: FontWeight.w400,
              //             ),
              //             decoration: InputDecoration(
              //               fillColor: whiteColor,
              //               filled: true,
              //               hoverColor: Colors.transparent,
              //               hintText: "Search Team...",
              //               prefixIcon:
              //                   SvgPicture.asset("assets/web_icons/search.svg"),
              //               prefixIconConstraints: const BoxConstraints(
              //                 minHeight: 10,
              //                 minWidth: 55,
              //               ),
              //               hintStyle: const TextStyle(
              //                 color: Color(0xFF8B98B1),
              //                 fontSize: 16,
              //                 fontWeight: FontWeight.w400,
              //               ),
              //               border: OutlineInputBorder(
              //                 borderRadius: BorderRadius.circular(12),
              //                 borderSide: BorderSide.none,
              //               ),
              //               focusedBorder: OutlineInputBorder(
              //                 borderRadius: BorderRadius.circular(12),
              //                 borderSide: BorderSide.none,
              //               ),
              //               enabledBorder: OutlineInputBorder(
              //                 borderRadius: BorderRadius.circular(12),
              //                 borderSide: BorderSide.none,
              //               ),
              //               contentPadding: const EdgeInsets.only(
              //                 left: 20,
              //                 right: 12,
              //                 top: 20,
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //     ButtonWidget(
              //       height: 55,
              //       width: 330,
              //       text: "+ Create a new team",
              //       borderRadius: 12,
              //       btnColor: const Color(0xFFF9F8FF),
              //       borderColor: const Color(0xFFD7DCE4),
              //       textColor: const Color(0xFF1976D2),
              //       fontSize: 14,
              //       fontWeight: FontWeight.w500,
              //       onPressed: () {
              //         setState(() {
              //           isShowCreateTeam = true;
              //         });
              //       },
              //     ),
              //   ],
              // ),
              const SizedBox(height: 20),

              !isShowCreateTeam?SizedBox():
              TeamInfoScreen(
                onBackTap: () {
                  setState(() {
                    // isShowCreateTeam = false;
                  });
                },
              ),
              !isShowTeamDetail?SizedBox():
              TeamDetailScreen(
                teamDataModel: teamDataModel,
                onBackTap: () {
                  setState(() {
                    // isShowTeamDetail = false;
                  });
                },
                onFileTap: (int index) {
                  setState(() {
                    // isShowTeamDetail = false;
                    // isShowTeamInfo = true;
                    // fileIndex = index;
                  });
                },
              ),

              // isShowTeamDetail
              //     ? TeamDetailScreen(
              //         onBackTap: () {
              //           setState(() {
              //             isShowTeamDetail = false;
              //           });
              //         },
              //         onFileTap: (int index) {
              //           setState(() {
              //             isShowTeamDetail = false;
              //             isShowTeamInfo = true;
              //             fileIndex = index;
              //           });
              //         },
              //       )
              //     : isShowCreateTeam
              //         ? TeamInfoScreen(
              //             onBackTap: () {
              //               setState(() {
              //                 isShowCreateTeam = false;
              //               });
              //             },
              //           )
              //         : fileIndex == 0 && isShowTeamInfo
              //             ? TeamInfoScreen(
              //                 onBackTap: () {
              //                   setState(() {
              //                     fileIndex = -1;
              //                     isShowTeamInfo = false;
              //                     isShowTeamDetail = true;
              //                   });
              //                 },
              //               )
              //             : fileIndex == 1 && isShowTeamInfo
              //                 ? PlayersScreen(
              //                     onBackTap: () {
              //                       setState(() {
              //                         fileIndex = -1;
              //                         isShowTeamInfo = false;
              //                         isShowTeamDetail = true;
              //                       });
              //                     },
              //                   )
              //                 : fileIndex == 2 && isShowTeamInfo
              //                     ? LineUpScreen(
              //                         onBackTap: () {
              //                           setState(() {
              //                             fileIndex = -1;
              //                             isShowTeamInfo = false;
              //                             isShowTeamDetail = true;
              //                           });
              //                         },
              //                       )
              //                     : fileIndex == 3 && isShowTeamInfo
              //                         ? LeaguesScreen(
              //                             onBackTap: () {
              //                               setState(() {
              //                                 fileIndex = -1;
              //                                 isShowTeamInfo = false;
              //                                 isShowTeamDetail = true;
              //                               });
              //                             },
              //                           )
              //                         : fileIndex == 4 && isShowTeamInfo
              //                             ? FriendlyScreen(
              //                                 onBackTap: () {
              //                                   setState(() {
              //                                     fileIndex = -1;
              //                                     isShowTeamInfo = false;
              //                                     isShowTeamDetail = true;
              //                                   });
              //                                 },
              //                               )
              //                             : fileIndex == 5 && isShowTeamInfo
              //                                 ? TrainingScreen(
              //                                     onBackTap: () {
              //                                       setState(() {
              //                                         fileIndex = -1;
              //                                         isShowTeamInfo = false;
              //                                         isShowTeamDetail = true;
              //                                       });
              //                                     },
              //                                   )
              //                                 : fileIndex == 6 && isShowTeamInfo
              //                                     ? StaffScreen(
              //                                         onBackTap: () {
              //                                           setState(() {
              //                                             fileIndex = -1;
              //                                             isShowTeamInfo =
              //                                                 false;
              //                                             isShowTeamDetail =
              //                                                 true;
              //                                           });
              //                                         },
              //                                       )
              //                                     : Container(
              //                                       width:
              //                                           double.infinity,
              //                                       padding:
              //                                           const EdgeInsets
              //                                               .all(20),
              //                                       margin:
              //                                           const EdgeInsets
              //                                               .only(
              //                                               bottom: 26),
              //                                       decoration:
              //                                           BoxDecoration(
              //                                         color: whiteColor,
              //                                         borderRadius:
              //                                             BorderRadius
              //                                                 .circular(
              //                                                     20),
              //                                         border:
              //                                             const Border(
              //                                           bottom:
              //                                               BorderSide(
              //                                             color:
              //                                                 borderColor,
              //                                             width: 1,
              //                                           ),
              //                                         ),
              //                                       ),
              //                                       child:
              //                                           GridView.builder(
              //                                         physics:
              //                                             const NeverScrollableScrollPhysics(),
              //                                         primary: false,
              //                                         shrinkWrap: true,
              //                                         padding:
              //                                             EdgeInsets.zero,
              //                                         gridDelegate:
              //                                             const SliverGridDelegateWithFixedCrossAxisCount(
              //                                           crossAxisCount: 3,
              //                                           mainAxisSpacing:
              //                                               20,
              //                                           crossAxisSpacing:
              //                                               20,
              //                                           mainAxisExtent:
              //                                               240,
              //                                         ),
              //                                         itemCount: 6,
              //                                         itemBuilder:
              //                                             (BuildContext
              //                                                     context,
              //                                                 int index) {
              //                                           return TeamItemsWidget(
              //                                             icon:
              //                                                 "assets/web_icons/abc_team.svg",
              //                                             name:
              //                                                 "ABC Team",
              //                                             playerQuantity:
              //                                                 "14",
              //                                             coachQuantity:
              //                                                 "1",
              //                                             onEditTeamTap:
              //                                                 () {
              //                                               setState(() {
              //                                                 isShowTeamDetail =
              //                                                     true;
              //                                               });
              //                                             },
              //                                           );
              //                                         },
              //                                       ),
              //                                     ),
            ],
          ),
        ),
      ),
    );
  }


  bool apiCalling = false;
  bool error = false;
  TeamDataModel? teamDataModel;
  teamChecker() async {

    setState(() {
      apiCalling = true;
    });

    TeamRepository createTeamRep = TeamRepository();
    final responseResult = await createTeamRep.getTeamData();
     teamDataModel = TeamDataModel.fromJson(responseResult);
     if(teamDataModel!.error==true){
       print(teamDataModel!.errorMsg);
       SnackBarClass snb = SnackBarClass();
       snb.snackBarMethod(context: context, text: teamDataModel!.errorMsg.toString());

       setState(() {
         apiCalling = false;
         error = true;
         isShowTeamDetail = false;
         isShowCreateTeam = false;

       });


     }else if(teamDataModel!.teamMetaData==null){

       print("has no team");
       // print(teamDataModel!.teamMetaData!.teamName);
       setState(() {
         apiCalling = false;
         error = false;
         isShowCreateTeam = true;
         isShowTeamDetail = false;
       });

     }else{
       print(teamDataModel!.teamMetaData!.homeColor);
       print(teamDataModel!.teamMetaData!.outColor);
       setState(() {
         teamDataModel;
         apiCalling = false;
         error = false;
         isShowTeamDetail = true;
         isShowCreateTeam = false;
       });

     }

  }

}
