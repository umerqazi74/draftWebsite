import 'package:draft_website/core/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web3/ethereum.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../bloc/home_bloc/home_bloc.dart';
import '../../../meta_mask_feature/meta_mask_provider.dart';
import 'drawer_widgets.dart';

class DrawerSideMenu extends StatefulWidget {
  const DrawerSideMenu({super.key});

  @override
  State<DrawerSideMenu> createState() => _DrawerSideMenuState();
}

class _DrawerSideMenuState extends State<DrawerSideMenu> {

  @override
  void initState() {
    // TODO: implement initState
    isWalletAddressExist();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      height: double.infinity,
      width: 260,
      decoration: const BoxDecoration(
        color: whiteColor,
        border: Border(
          right: BorderSide(
            color: borderColor,
            width: 1,
          ),
        ),
      ),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Image.asset(
                            height: 38,
                            width: 38,
                            "assets/web_images/logo.png",
                          ),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Text(
                              "Draft Pick",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: blackColor,
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 26),
                      const DrawerItemsWidget(
                        title: "Draft",
                        svgIcon: "assets/web_icons/draft.svg",
                        id: 0,
                      ),
                      const DrawerItemsWidget(
                        title: "My Players",
                        svgIcon: "assets/web_icons/add1.svg",
                        id: 1,
                      ),
                      const DrawerItemsWidget(
                        title: "My Team",
                        svgIcon: "assets/web_icons/team.svg",
                        id: 2,
                      ),
                      const DrawerItemsWidget(
                        title: "Leagues",
                        svgIcon: "assets/web_icons/leagues.svg",
                        id: 3,
                      ),

                      // Container(
                      //   height: 40,
                      //   width: double.infinity,
                      //   margin: const EdgeInsets.only(top: 30, bottom: 10),
                      //   padding: const EdgeInsets.symmetric(horizontal: 10),
                      //   decoration: const BoxDecoration(
                      //     color: Colors.transparent,
                      //     border: Border(
                      //       top: BorderSide(
                      //         color: borderColor,
                      //         width: 1,
                      //       ),
                      //     ),
                      //   ),
                      //   child: Center(
                      //     child: Row(
                      //       children: <Widget>[
                      //         const Expanded(
                      //           child: Text(
                      //             "My Teams ",
                      //             maxLines: 1,
                      //             overflow: TextOverflow.ellipsis,
                      //             style: TextStyle(
                      //               color: Color(0xFFD3D2DC),
                      //               fontSize: 14,
                      //               fontWeight: FontWeight.w500,
                      //             ),
                      //           ),
                      //         ),
                      //         const SizedBox(width: 10),
                      //         SvgPicture.asset(
                      //           "assets/web_icons/add.svg",
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // const DrawerTeamWidget(
                      //   image: "assets/web_images/laab_team.png",
                      //   title: "LAAB Team",
                      // ),
                      // const DrawerTeamWidget(
                      //   image: "assets/web_images/cloth.png",
                      //   title: "Cloth",
                      // ),
                      // const DrawerTeamWidget(
                      //   image: "assets/web_images/gamer.png",
                      //   title: "Gamer Boy",
                      // ),
                      Container(
                        height: 1,
                        width: double.infinity,
                        color: borderColor,
                        margin: const EdgeInsets.only(top: 10, bottom: 20),
                      ),
                      const LogoutWidget(),
                    ],
                  ),


                  ProfileInfoWidget(
                    image: "assets/web_images/profile.png",
                    title: isConnected? "Connected":"Disconnected",
                    subTitle: "",
                    onTap: () {
                      context.read<HomeBloc>().add(const DoSelectDrawerEvent(4));
                    },
                  ),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }


  bool isConnected = false;
  isWalletAddressExist() async {// Function to check if wallet address exists

    ethereum!.onAccountsChanged((accounts) {//account change

      if(accounts.isNotEmpty){
        setState(() {
          isConnected = true;
        });
      }else{

        ethereum!.onDisconnect((listener){
          setState(() {
            isConnected = false;
          });
        });
      }
    });

    bool connection = ethereum!.isConnected();
    if(connection){
      setState(() {
        isConnected = true;
      });
    }else{
      setState(() {
        isConnected = false;
      });
    }

  }


}
