import 'package:draft_website/api/repository/formation_repository.dart';
import 'package:draft_website/api/repository/player_data_repository.dart';
import 'package:draft_website/api/response/formation_response.dart';
import 'package:draft_website/api/response/post_response_model.dart';
import 'package:draft_website/core/button_widget.dart';
import 'package:draft_website/core/clickable_widget.dart';
import 'package:draft_website/core/consts.dart';
import 'package:draft_website/core/url_img_with_icon.dart';
import 'package:draft_website/screens/drawer_screen/drawer_tabs/nav_screens/nav_widgets.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../api/response/player_data_response.dart';
import '../../../../core/common_methods.dart';

class LineUpScreen extends StatefulWidget {
  final Function()? onBackTap;
  final List<List<String>>? savedFormation;

  const LineUpScreen({
    super.key,
    this.onBackTap,
    this.savedFormation,
  });

  @override
  State<LineUpScreen> createState() => _LineUpScreenState();
}

class _LineUpScreenState extends State<LineUpScreen> {
  String selectedFormation = '';

  // TextEditingController addressController = TextEditingController();
  //
  // getAddressValue() async {
  //   final prefs = await SharedPreferences.getInstance();
  //
  //   String userWalletAddress = prefs.getString('userWalletAddress') ?? "";
  //   setState(() {
  //     addressController.text = userWalletAddress;
  //   });
  // }


  final List<String> formationItems = [
    '4-4-2',
    '4-3-3R',
    '4-4-2D',
    '4-2-4',
    '5-3-2',
    '3-5-2',
    '3-4-3',
  ];

  @override
  void initState() {
    getPlayerList();
    // getAddressValue();
    getFormation();
    selectedFormation = formationItems[1];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return apiCalling?const SpinKitFadingCircle(color: mainAppColor, size: 30,) :
    Stack(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  InkWellWidget(
                    onTap: widget.onBackTap,
                    child: Row(
                      children: <Widget>[
                        SvgPicture.asset("assets/web_icons/left_side.svg"),
                        const SizedBox(width: 10),
                        const Text(
                          "Back / Lineup",
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
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "Lineup",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: textColorOne,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      ButtonWidget(
                        height: 46,
                        width: 150,
                        text: "Save",
                        borderRadius: 10,
                        btnColor: pickedPlayers.length==11? Color(0xFF1976D2):Colors.grey.shade400,
                        borderColor: pickedPlayers.length==11? Color(0xFF1976D2):Colors.grey.shade400,
                        textColor: whiteColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        onPressed: () {
                          SnackBarClass snb = SnackBarClass();
                          if(!isFormationCompleted()){
                            snb.snackBarMethod(context: context, text: "Please Complete Whole Formation!");
                          }else{
                            saveFormation();
                          }
                        },
                      ),
                    ],
                  ),

                  // TextField(
                  //   controller: addressController,
                  // ),

                  const SizedBox(height: 20),
                  const Text(
                    "Select Formation",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Color(0xFF23303B),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          height: 55,
                          width: 373,
                          margin: const EdgeInsets.only(top: 20, right: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: whiteColor,
                          ),
                          child: Theme(
                            data: ThemeData(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                isExpanded: true,
                                iconStyleData: IconStyleData(
                                  icon: SvgPicture.asset(
                                    "assets/web_icons/down_side.svg",
                                  ),
                                ),
                                selectedItemBuilder: (BuildContext context) {
                                  return formationItems.map<Widget>((String item) {
                                    return Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.symmetric(horizontal: 10),
                                        child: Text(
                                          item,
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                            color: Color(0xFF8E949A),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList();
                                },
                                items: formationItems
                                    .map(
                                      (item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: item == selectedFormation
                                            ? Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 8),
                                                child: Text(
                                                  item,
                                                  style: const TextStyle(
                                                    color: blackColor,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              )
                                            : Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 8),
                                                child: Text(
                                                  item,
                                                  style: const TextStyle(
                                                    color: Color(0xFF8E949A),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                      ),
                                    )
                                    .toList(),
                                value: selectedFormation,
                                onChanged: (value) {
                                  print("Pressed");
                                  setState(() {
                                    selectedFormation = value as String;
                                  });
                                  _onFormationSelected(value, formationResponse);



                                },
                                buttonStyleData: const ButtonStyleData(
                                  height: 48,
                                  width: double.infinity,
                                  padding: EdgeInsets.only(
                                    left: 10,
                                    right: 10,
                                  ),
                                ),
                                dropdownStyleData: DropdownStyleData(
                                  maxHeight: 200,
                                  elevation: 1,
                                  offset: const Offset(0, -5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: whiteColor,
                                  ),
                                  scrollbarTheme: ScrollbarThemeData(
                                    radius: const Radius.circular(40),
                                    thickness: MaterialStateProperty.all(2),
                                    thumbVisibility: MaterialStateProperty.all(true),
                                  ),
                                ),
                                menuItemStyleData: const MenuItemStyleData(
                                  height: 48,
                                  padding: EdgeInsets.only(left: 10, right: 10),
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
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 1000,
                        width: double.infinity,
                        margin: const EdgeInsets.only(top: 20, bottom: 20),
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              "assets/web_images/pitch.png",
                            ),
                          ),
                        ),

                      ),
                       Center(
                        child: SizedBox(
                          width: 500,
                          height: 800,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 100),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  height: 67,
                                  width: 470,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: _selectedMatrix![0].length,
                                    itemBuilder: (context, index) {
                                      String mv = _selectedMatrix![0][index];
                                      return SizedBox(
                                        width: 100,
                                        child: mv=="0"?const SizedBox(width: 67,height: 67,):
                                            mv == "1"?
                                            currentListIndex==0&&currentIndex==index&&pickingPlayer?
                                            SizedBox(height: 67,width: 67,child: Image.asset('assets/web_images/pin.gif')):
                                        InkWell(
                                          onTap: (){
                                            setState(() {
                                              pickingPlayer = true;
                                              openPlDrawer = true;
                                              currentListIndex = 0;
                                              currentIndex = index;
                                            });
                                          },
                                          child: const LineUpItemsWidget(
                                            image: "assets/web_icons/add_button.png",
                                            number: "64",
                                          ),
                                        ): CircularImageWithClearIcon(
                                                imageUrl: getPlayerImageUrl(mv)??"",
                                                onClear: (){
                                                  returnBackPlayer(0, index, mv);
                                                }
                                            ),
                                      );
                                    },
                                  ),
                                ),

                                const SizedBox(height: 40),

                                SizedBox(
                                  height: 67,
                                  width: 470,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.horizontal,

                                    itemCount: _selectedMatrix![1].length,
                                    itemBuilder: (context, index) {
                                      String mv = _selectedMatrix![1][index];
                                      return SizedBox(
                                        width: 100,
                                        child: mv=="0"?const SizedBox(width: 67,height: 67,):
                                        currentListIndex==1&&currentIndex==index&&pickingPlayer?
                                        SizedBox(height: 67,width: 67,child: Image.asset('assets/web_images/pin.gif')):
                                        mv == "1"?
                                        InkWell(
                                          onTap: (){
                                            setState(() {
                                              pickingPlayer = true;
                                              openPlDrawer = true;
                                              currentListIndex = 1;
                                              currentIndex = index;
                                            });
                                          },
                                          child: const LineUpItemsWidget(
                                            image: "assets/web_icons/add_button.png",
                                            number: "64",
                                          ),
                                        ): CircularImageWithClearIcon(
                                            imageUrl: getPlayerImageUrl(mv)??"",
                                            onClear: (){
                                              returnBackPlayer(1, index, mv);
                                            }
                                        ),
                                      );
                                    },
                                  ),
                                ),

                                const SizedBox(height: 40),

                                SizedBox(
                                  height: 67,
                                  width: 470,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.horizontal,

                                    itemCount: _selectedMatrix![2].length,
                                    itemBuilder: (context, index) {
                                      String mv = _selectedMatrix![2][index];
                                      return SizedBox(
                                        width: 100,
                                        child: mv=="0"?const SizedBox(width: 67,height: 67,):
                                        currentListIndex==2&&currentIndex==index&&pickingPlayer?
                                        SizedBox(height: 67,width: 67,child: Image.asset('assets/web_images/pin.gif')):
                                        mv == "1"?
                                        InkWell(
                                          onTap: (){
                                            setState(() {
                                              pickingPlayer = true;
                                              openPlDrawer = true;
                                              currentListIndex = 2;
                                              currentIndex = index;
                                            });
                                          },
                                          child: const LineUpItemsWidget(
                                            image: "assets/web_icons/add_button.png",
                                            number: "64",
                                          ),
                                        ): CircularImageWithClearIcon(
                                            imageUrl: getPlayerImageUrl(mv)??"",
                                            onClear: (){
                                              returnBackPlayer(2, index, mv);
                                            }
                                        ),
                                      );
                                    },
                                  ),
                                ),

                                const SizedBox(height: 40),

                                SizedBox(
                                  height: 67,
                                  width: 500,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.horizontal,

                                    itemCount: _selectedMatrix![3].length,
                                    itemBuilder: (context, index) {
                                      String mv = _selectedMatrix![3][index];
                                      return SizedBox(
                                        width: 100,
                                        child: mv=="0"?const SizedBox(width: 67,height: 67,):
                                        currentListIndex==3&&currentIndex==index&&pickingPlayer?
                                        SizedBox(height: 67,width: 67,child: Image.asset('assets/web_images/pin.gif')):
                                        mv == "1"?
                                        InkWell(
                                          onTap: (){
                                            setState(() {
                                              pickingPlayer = true;
                                              openPlDrawer = true;
                                              currentListIndex = 3;
                                              currentIndex = index;
                                            });
                                          },
                                          child: const LineUpItemsWidget(
                                            image: "assets/web_icons/add_button.png",
                                            number: "64",
                                          ),
                                        ): CircularImageWithClearIcon(
                                            imageUrl: getPlayerImageUrl(mv)??"",
                                            onClear: (){
                                              returnBackPlayer(3, index, mv);
                                            }
                                        ),
                                      );
                                    },
                                  ),
                                ),

                                const SizedBox(height: 40),


                                SizedBox(
                                  height: 67,
                                  width: 530,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.horizontal,

                                    itemCount: _selectedMatrix![4].length,
                                    itemBuilder: (context, index) {
                                      String mv = _selectedMatrix![4][index];
                                      return SizedBox(
                                        width: 100,
                                        child: mv=="0"?const SizedBox(width: 67,height: 67,):
                                        currentListIndex==4&&currentIndex==index&&pickingPlayer?
                                        SizedBox(height: 67,width: 67,child: Image.asset('assets/web_images/pin.gif')):
                                        mv == "1"?
                                        InkWell(
                                          onTap: (){
                                            setState(() {
                                              pickingPlayer = true;
                                              openPlDrawer = true;
                                              currentListIndex = 4;
                                              currentIndex = index;
                                            });
                                          },
                                          child: const LineUpItemsWidget(
                                            image: "assets/web_icons/add_button.png",
                                            number: "64",
                                          ),
                                        ): CircularImageWithClearIcon(
                                            imageUrl: getPlayerImageUrl(mv)??"",
                                            onClear: (){
                                              returnBackPlayer(4, index, mv);
                                            }
                                        ),
                                      );
                                    },
                                  ),
                                ),



                                const SizedBox(height: 40),


                                SizedBox(
                                  height: 67,
                                  width: 530,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.horizontal,

                                    itemCount: _selectedMatrix![5].length,
                                    itemBuilder: (context, index) {
                                      String mv = _selectedMatrix![5][index];
                                      return SizedBox(
                                        width: 100,
                                        child: mv=="0"?const SizedBox(width: 67,height: 67,):
                                        currentListIndex==5&&currentIndex==index&&pickingPlayer?
                                        SizedBox(height: 67,width: 67,child: Image.asset('assets/web_images/pin.gif')):
                                        mv == "1"?
                                        InkWell(
                                          onTap: (){
                                            setState(() {
                                              pickingPlayer = true;
                                              openPlDrawer = true;
                                              currentListIndex = 5;
                                              currentIndex = index;
                                            });
                                          },
                                          child: const LineUpItemsWidget(
                                            image: "assets/web_icons/add_button.png",
                                            number: "64",
                                          ),
                                        ): CircularImageWithClearIcon(
                                            imageUrl: getPlayerImageUrl(mv)??"",
                                            onClear: (){
                                              returnBackPlayer(5, index, mv);
                                            }
                                        ),
                                      );
                                    },
                                  ),
                                ),



                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),


                ],
              ),
            ),

            const SizedBox(width: 30,),

            // !choosingPlayer?const SizedBox(height: 0,width: 0,):
            !openPlDrawer?const SizedBox():
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){
                    setState(() {
                      openPlDrawer = false;
                      pickingPlayer = false;
                    });
                  }, // Call the function when clear icon is tapped
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade300, // Background for the clear icon
                    ),
                    child: Icon(
                      Icons.clear,
                      size: 30,
                      color: Colors.black, // Icon color
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 70),
                  height: MediaQuery.of(context).size.height,
                  width: 200,
                  color: Colors.white,
                  // child: Text(listPlayers.isEmpty?"":listPlayers[0].status.toString()),
                  child:playersApiCalling?const SpinKitFadingCircle(color: mainAppColor, size: 30,) :
                  ListView.builder(
                    itemCount: listPlayers.length,
                    itemBuilder: (BuildContext context, int index) {
                      return pickedPlayers.contains(listPlayers[index].id)?const SizedBox():
                      InkWell(
                        onTap: (){
                          pickPlayer(currentListIndex, currentIndex, listPlayers[index].id??"");
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(5)
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 55,
                                width: 55,
                                child: Stack(
                                  children: <Widget>[
                                    Center(
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        // margin: const EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius: BorderRadius.circular(7),
                                          border: Border.all(
                                            color: const Color(0xFFD7D7D7),
                                            width: 1,
                                          ),
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                              listPlayers[index].imageUrl.toString(),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 0,
                                      top: 0,
                                      height: 15,
                                      width: 15,
                                      child: SvgPicture.asset(
                                        listPlayers[index].status == "free"
                                            ? "assets/web_icons/blue_per.svg"
                                            : listPlayers[index].status == "loaned"
                                            ? "assets/web_icons/yellow_per.svg"
                                            : "assets/web_icons/green_per.svg",
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 12),
                              Text(
                                listPlayers[index].name.toString(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: textColorOne,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                listPlayers[index].birthday.toString(),
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
                      );
                    },

                  ),
                ),
              ],
            )



          ],
        ),
      ],
    );
  }


  bool choosingPlayer = false;
  String? _selectedFormation;
  List<List<String>>? _selectedMatrix;

  bool apiCalling = false;
  bool error = false;
  FormationResponse? formationResponse;
  getFormation() async {

    setState(() {
      apiCalling = true;
    });

    FormationRepository formationRepository = FormationRepository();
    final responseResult = await formationRepository.getFormationData();
    formationResponse = FormationResponse.fromJson(responseResult);
    if(formationResponse!.error==true){
      print(formationResponse!.errorMsg);
      SnackBarClass snb = SnackBarClass();
      snb.snackBarMethod(context: context, text: formationResponse!.errorMsg.toString());

      setState(() {
        apiCalling = false;
        error = true;
      });


    }else{

      print(formationResponse!.l433R!.first.formationMatrix);
      setState(() {
        _selectedMatrix = widget.savedFormation == null || widget.savedFormation!.isEmpty? formationResponse!.l433R!.first.formationMatrix:widget.savedFormation;
        apiCalling = false;
        error = false;

      });


      if(widget.savedFormation!.isNotEmpty) {
        bool isIdentified = true;
        for (int j = 0; j < widget.savedFormation!.length; j++) {
          for (int i = 0; i < widget.savedFormation![j].length; i++) {
            if (widget.savedFormation![j][i] == "0" && formationResponse!.l433R!.first.formationMatrix![j][i]=="0") {

            }else if(widget.savedFormation![j][i] == "0" || formationResponse!.l433R!.first.formationMatrix![j][i]=="0"){
              isIdentified = false;
            }
          }
        }
        if(isIdentified){
          setState(() {
            selectedFormation = "4-3-3R";
          });
        }

        isIdentified = true;
        for (int j = 0; j < widget.savedFormation!.length; j++) {
          for (int i = 0; i < widget.savedFormation![j].length; i++) {
            if (widget.savedFormation![j][i] == "0" && formationResponse!.l343!.first.formationMatrix![j][i]=="0") {

            }else if(widget.savedFormation![j][i] == "0" || formationResponse!.l343!.first.formationMatrix![j][i]=="0"){
              isIdentified = false;
            }
          }
        }
        if(isIdentified){
          setState(() {
            selectedFormation = "3-4-3";
          });
        }

        isIdentified = true;
        for (int j = 0; j < widget.savedFormation!.length; j++) {
          for (int i = 0; i < widget.savedFormation![j].length; i++) {
            if (widget.savedFormation![j][i] == "0" && formationResponse!.l352!.first.formationMatrix![j][i]=="0") {

            }else if(widget.savedFormation![j][i] == "0" || formationResponse!.l352!.first.formationMatrix![j][i]=="0"){
              isIdentified = false;
            }
          }
        }
        if(isIdentified){
          setState(() {
            selectedFormation = "3-5-2";
          });
        }

        isIdentified = true;
        for (int j = 0; j < widget.savedFormation!.length; j++) {
          for (int i = 0; i < widget.savedFormation![j].length; i++) {
            if (widget.savedFormation![j][i] == "0" && formationResponse!.l424!.first.formationMatrix![j][i]=="0") {

            }else if(widget.savedFormation![j][i] == "0" || formationResponse!.l424!.first.formationMatrix![j][i]=="0"){
              isIdentified = false;
            }
          }
        }
        if(isIdentified){
          setState(() {
            selectedFormation = "4-2-4";
          });
        }

        isIdentified = true;
        for (int j = 0; j < widget.savedFormation!.length; j++) {
          for (int i = 0; i < widget.savedFormation![j].length; i++) {
            if (widget.savedFormation![j][i] == "0" && formationResponse!.l442!.first.formationMatrix![j][i]=="0") {

            }else if(widget.savedFormation![j][i] == "0" || formationResponse!.l442!.first.formationMatrix![j][i]=="0"){
              isIdentified = false;
            }
          }
        }
        if(isIdentified){
          setState(() {
            selectedFormation = "4-4-2";
          });
        }

        isIdentified = true;
        for (int j = 0; j < widget.savedFormation!.length; j++) {
          for (int i = 0; i < widget.savedFormation![j].length; i++) {
            if (widget.savedFormation![j][i] == "0" && formationResponse!.l442D!.first.formationMatrix![j][i]=="0") {

            }else if(widget.savedFormation![j][i] == "0" || formationResponse!.l442D!.first.formationMatrix![j][i]=="0"){
              isIdentified = false;
            }
          }
        }
        if(isIdentified){
          setState(() {
            selectedFormation = "4-4-2D";
          });
        }


        isIdentified = true;
        for (int j = 0; j < widget.savedFormation!.length; j++) {
          for (int i = 0; i < widget.savedFormation![j].length; i++) {
            if (widget.savedFormation![j][i] == "0" && formationResponse!.l532!.first.formationMatrix![j][i]=="0") {

            }else if(widget.savedFormation![j][i] == "0" || formationResponse!.l532!.first.formationMatrix![j][i]=="0"){
              isIdentified = false;
            }
          }
        }
        if(isIdentified){
          setState(() {
            selectedFormation = "5-3-2";
          });
        }



      }


    }

  }


  void _onFormationSelected(String? value, FormationResponse? formation) {
    setToDefault();
    setState(() {
      _selectedFormation = value;
      // Based on selected formation, update the matrix
      switch (value) {
        case '4-4-2':
          _selectedMatrix = formation!.l442?.first.formationMatrix;
          break;
        case '4-3-3R':
          _selectedMatrix = formation!.l433R?.first.formationMatrix;
          break;
        case '4-4-2D':
          _selectedMatrix = formation!.l442D?.first.formationMatrix;
          break;
        case '4-2-4':
          _selectedMatrix = formation!.l424?.first.formationMatrix;
          break;
        case '5-3-2':
          _selectedMatrix = formation!.l532?.first.formationMatrix;
          break;
        case '3-5-2':
          _selectedMatrix = formation!.l352?.first.formationMatrix;
          break;
        case '3-4-3':
          _selectedMatrix = formation!.l343?.first.formationMatrix;
          break;
      }
    });
  }


  List<Tokens> listPlayers = [];

  bool playersApiCalling = false;
  getPlayerList() async {

    setState(() {
      playersApiCalling = true;
    });

    PlayersDataRepository playersDataRepository = PlayersDataRepository();
    final responseResult = await playersDataRepository.getPlayersData();
    PlayersDataResponse playersDataResponse = PlayersDataResponse.fromJson(responseResult);
    if(playersDataResponse.error==true){
      print(playersDataResponse.errorMsg);
      SnackBarClass snb = SnackBarClass();
      snb.snackBarMethod(context: context, text: playersDataResponse.errorMsg.toString());

      setState(() {
        playersApiCalling = false;
      });


    }else{

      setState(() {
        listPlayers = playersDataResponse.tokens!;
        playersApiCalling = false;
      });

      if(widget.savedFormation!.isNotEmpty){
        for (int j = 0; j < widget.savedFormation!.length; j++) {
          for (int i = 0; i < widget.savedFormation![j].length; i++) {
            if(widget.savedFormation![j][i]!="0"){
              pickedPlayers.add(widget.savedFormation![j][i]);
            }
          }
        }
      }

    }

  }

  List<String> pickedPlayers = [];
  bool pickingPlayer = false;
  bool openPlDrawer = false;
  bool defaultFlag = false;
  int currentListIndex = -1;
  int currentIndex = -1;
  pickPlayer(int lI,int cI, String playerId){

     setState(() {
       _selectedMatrix![lI][cI] = playerId;
       pickedPlayers.add(playerId);
       pickingPlayer = false;
       currentListIndex = -1;
       currentIndex = -1;
     });

  }

  returnBackPlayer(int lI,int cI, String playerId){
    setState(() {
      _selectedMatrix![lI][cI] = "1";
      pickedPlayers.removeWhere((player) => player == playerId);
    });
  }

  setToDefault(){

      for (int j = 0; j < _selectedMatrix!.length; j++) {
        for (int i = 0; i < _selectedMatrix![j].length; i++) {
          if (pickedPlayers.contains(_selectedMatrix![j][i])) {
            setState(() {
              defaultFlag = true;
              _selectedMatrix![j][i] = '1';
            });
          }
        }
      }


      pickedPlayers.clear();
      pickingPlayer = false;
      currentListIndex = -1;
      currentIndex = -1;
      SnackBarClass snb = SnackBarClass();
      if(defaultFlag){
        snb.snackBarMethod(context: context, text: "Set To Default!");
      }
      defaultFlag = false;

      setState(() {

      });


  }

  bool isFormationCompleted(){
    bool isFormated = true;
    for (int j = 0; j < _selectedMatrix!.length; j++) {
      for (int i = 0; i < _selectedMatrix![j].length; i++) {
        if (_selectedMatrix![j][i]=='1') {
          isFormated = false;
        }
      }
    }
    return isFormated;
  }

  // Function to find player by id and return imageUrl
  String? getPlayerImageUrl(String id) {
    for (var player in listPlayers) {
      if (player.id == id) {
        return player.imageUrl; // Return imageUrl if player id matches
      }

    }
    return null; // Return null if no player with the given id is found
  }

  saveFormation() async {
    setState(() {
      apiCalling = true;
    });

    FormationRepository formationRepository = FormationRepository();
    final responseResult = await formationRepository.saveFormationData(_selectedMatrix!,selectedFormation);
    PostResponseModel postResponseModel = PostResponseModel.fromJson(responseResult);
    if(postResponseModel.status=="success"){


      SnackBarClass snb = SnackBarClass();
      snb.snackBarMethod(context: context, text: "Formation Saved Successfully!!");
      setState(() {
        apiCalling = false;
        error = false;
      });

    }else{
      SnackBarClass snb = SnackBarClass();
      snb.snackBarMethod(context: context, text: "Something went wrong!");

      setState(() {
        apiCalling = false;
        error = true;
      });


    }
  }

}
