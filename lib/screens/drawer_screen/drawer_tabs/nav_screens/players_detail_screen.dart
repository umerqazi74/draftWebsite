import 'package:draft_website/api/repository/loan_player_repository.dart';
import 'package:draft_website/api/response/player_data_response.dart';
import 'package:draft_website/api/response/post_response_model.dart';
import 'package:draft_website/core/clickable_widget.dart';
import 'package:draft_website/core/consts.dart';
import 'package:draft_website/screens/drawer_screen/drawer_tabs/nav_screens/nav_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_web3/ethereum.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../api/repository/player_data_repository.dart';
import '../../../../core/button_widget.dart';
import '../../../../core/common_methods.dart';
import '../../../../meta_mask_feature/meta_mask_provider.dart';

class PlayerDetailScreen extends StatefulWidget {
  final Tokens tokens;
  final bool isDraft;
  final Function()? onBackTap;
  final double speed,
      shootPrecision,
      shootPower,
      dribble,
      mentality,
      injuryRisk,
      passPrecision,
      tacklePrecision,
      aggression,
      diving,
      kicking,
      reflexes,
      gameVision,
      leaderShip;
  final String title, image, name, dob, status;

  const PlayerDetailScreen({
    super.key,
    this.onBackTap,
    required this.speed,
    required this.shootPrecision,
    required this.shootPower,
    required this.dribble,
    required this.mentality,
    required this.injuryRisk,
    required this.passPrecision,
    required this.tacklePrecision,
    required this.aggression,
    required this.diving,
    required this.kicking,
    required this.reflexes,
    required this.gameVision,
    required this.leaderShip,
    this.title = "Player",
    required this.image,
    required this.name,
    required this.dob,
    required this.status,
    required this.tokens,
    required this.isDraft,
  });

  @override
  State<PlayerDetailScreen> createState() => _PlayerDetailScreenState();
}

class _PlayerDetailScreenState extends State<PlayerDetailScreen> {

  @override
  void initState() {
    // TODO: implement initState
    // isWalletAddressExist();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InkWellWidget(
          onTap: widget.onBackTap,
          child: Row(
            children: <Widget>[
              SvgPicture.asset("assets/web_icons/left_side.svg"),
              const SizedBox(width: 10),
              Text(
                "Back / ${widget.title} / Players details",
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
        Text(
          "Player",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: textColorOne,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 20),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TagsWidget(
              title: "Loaned",
              icons: "assets/web_icons/yellow_per.svg",
            ),
            SizedBox(width: 70),
            TagsWidget(
              title: "Belong to user",
              icons: "assets/web_icons/green_per.svg",
            ),
            SizedBox(width: 70),
            TagsWidget(
              title: "Free",
              icons: "assets/web_icons/blue_per.svg",
            ),
          ],
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.fromLTRB(24, 38, 24, 11),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: borderColor,
              width: 1,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 76,
                        width: 76,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(13),
                          border: Border.all(
                            color: const Color(0xFFD7D7D7),
                            width: 1,
                          ),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              widget.image,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: SvgPicture.asset(
                          widget.status == "free"
                              ? "assets/web_icons/blue_per.svg"
                              : widget.status == "loaned"
                                  ? "assets/web_icons/yellow_per.svg"
                                  : "assets/web_icons/green_per.svg",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: textColorOne,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.dob,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: textColorOne,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: LinearItemsWidget(
                            title: "Speed",
                            value: widget.speed,
                            isBig: true,
                          ),
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          child: LinearItemsWidget(
                            title: "Shoot Precision",
                            value: widget.shootPrecision,
                            isBig: true,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: LinearItemsWidget(
                            title: "Shoot Power",
                            value: widget.shootPower,
                            isBig: true,
                          ),
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          child: LinearItemsWidget(
                            title: "Dribble",
                            value: widget.dribble,
                            isBig: true,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: LinearItemsWidget(
                            title: "Mentality",
                            value: widget.mentality,
                            isBig: true,
                          ),
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          child: LinearItemsWidget(
                            title: "Injury Risk",
                            value: widget.injuryRisk,
                            isBig: true,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: LinearItemsWidget(
                            title: "Pass Precision",
                            value: widget.passPrecision,
                            isBig: true,
                          ),
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          child: LinearItemsWidget(
                            title: "Tackle Precision",
                            value: widget.tacklePrecision,
                            isBig: true,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: LinearItemsWidget(
                            title: "Aggression",
                            value: widget.aggression,
                            isBig: true,
                          ),
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          child: LinearItemsWidget(
                            title: "Diving",
                            value: widget.diving,
                            isBig: true,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: LinearItemsWidget(
                            title: "Kicking",
                            value: widget.kicking,
                            isBig: true,
                          ),
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          child: LinearItemsWidget(
                            title: "Reflexes",
                            value: widget.reflexes,
                            isBig: true,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: LinearItemsWidget(
                            title: "Game vision",
                            value: widget.gameVision,
                            isBig: true,
                          ),
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          child: LinearItemsWidget(
                            title: "Leadership",
                            value: widget.leaderShip,
                            isBig: true,
                          ),
                        ),
                      ],
                    ),

                    !widget.isDraft?SizedBox(height: 1,width: 1,):
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ButtonWidget(
                          height: 35,
                          width: 120,
                          text: "Buy",
                          borderRadius: 10,
                          btnColor: const Color(0xFF1976D2),
                          borderColor: const Color(0xFF1976D2),
                          textColor: whiteColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          onPressed: () {
                            _launchUrl(widget.tokens.openseaUrl.toString());
                          },
                        ),


                        ChangeNotifierProvider(                                                  //Change the provider
                          create: (context) => MetaMaskProvider()..init(),                              //create an instant
                          builder: (context, child) {
                            return Stack(
                                children: [
                                  Center(
                                    child: Consumer<MetaMaskProvider>(
                                      builder: (context, provider, child) {
                                        late final String text;                                               //check the state and display it

                                        if (provider.isConnected && provider.isInOperatingChain) {
                                          isWalletAddressExist();
                                          text = 'Connected';//connected
                                          print(provider.currentAddress);

                                          return buttonWidgetToLoan();


                                        } else if (provider.isEnabled) {
                                          context.read<MetaMaskProvider>().connect();

                                        }

                                        return buttonWidgetToLoan();
                                      },
                                    ),
                                  ),

                                ],
                              );
                          },
                        ),




                      ],
                    )

                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  bool apiCalling = false;
  bool isConnected = false;
  bool isLoanAllow = false;
  bool loanTaken = false;
  String address = "";
  isWalletAddressExist() async {// Function to check if wallet address exists

    final accs = await ethereum!.requestAccount();
      if (accs.isNotEmpty){
        PlayersDataRepository playerDR = PlayersDataRepository();
        await playerDR.storeWalletValue(accs.first);
        final responseResult = await playerDR.getPlayersData();
        PlayersDataResponse playersDataResponse = PlayersDataResponse.fromJson(responseResult);
        print(playersDataResponse.loanData!.isLoanable!);
        print(playersDataResponse.loanData!.numLoanedPossible!);
        address = accs.first;
        setState(() {
          isLoanAllow = playersDataResponse.loanData!.isLoanable!;
          isConnected = true;
        });
      } //assign current address to first address


    ethereum!.onDisconnect((listener){
      setState(() {
        isConnected = false;
      });
    });

  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }


  Widget buttonWidgetToLoan()=> apiCalling? SpinKitFadingCircle(color: mainAppColor, size: 30,) :ButtonWidget(
    height: 35,
    width: 120,
    text: "Loan",
    borderRadius: 10,
    btnColor: widget.tokens.status=="free" && isConnected && isLoanAllow && !loanTaken? Colors.green:Colors.grey.shade400,
    borderColor: widget.tokens.status=="free" && isConnected && isLoanAllow && !loanTaken? Colors.green:Colors.grey.shade400,
    textColor: whiteColor,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    onPressed: () async {
      if(widget.tokens.status=="free" && isConnected && isLoanAllow && !loanTaken){

        setState(() {
          apiCalling = true;
        });

        LoanPlayerRepository loanPlayerRep = LoanPlayerRepository();
        final responseResult = await loanPlayerRep.getLoanPlayer(widget.tokens.id.toString());
        PostResponseModel postResModel = PostResponseModel.fromJson(responseResult);
        if(postResModel.error==true){
          SnackBarClass snb = SnackBarClass();
          snb.snackBarMethod(context: context, text: postResModel.errorMsg.toString());
        }else{
          SnackBarClass snb = SnackBarClass();
          snb.snackBarMethod(context: context, text: "Player Loaned Successfully!");
          setState(() {
            loanTaken = true;
          });
        }

        setState(() {
          apiCalling = false;
        });

      }
    },);

}
