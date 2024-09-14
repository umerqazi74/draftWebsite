import 'package:draft_website/api/repository/formation_repository.dart';
import 'package:draft_website/api/response/formation_response.dart';
import 'package:draft_website/core/button_widget.dart';
import 'package:draft_website/core/clickable_widget.dart';
import 'package:draft_website/core/consts.dart';
import 'package:draft_website/screens/drawer_screen/drawer_tabs/nav_screens/nav_widgets.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/common_methods.dart';

class LineUpScreen extends StatefulWidget {
  final Function()? onBackTap;

  const LineUpScreen({
    super.key,
    this.onBackTap,
  });

  @override
  State<LineUpScreen> createState() => _LineUpScreenState();
}

class _LineUpScreenState extends State<LineUpScreen> {
  String selectedFormation = '';

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
    getFormation();
    selectedFormation = formationItems[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return apiCalling?SpinKitFadingCircle(color: mainAppColor, size: 30,) :
    Column(
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
              btnColor: const Color(0xFF1976D2),
              borderColor: const Color(0xFF1976D2),
              textColor: whiteColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              onPressed: () {},
            ),
          ],
        ),
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

                        print(_selectedMatrix![0]);
                        print(_selectedMatrix![2]);
                        print(_selectedMatrix![3]);
                        print(_selectedMatrix![0].first);

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
                  padding: EdgeInsets.only(top: 100),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 67,
                        width: 470,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,

                          itemCount: _selectedMatrix![0].length,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              width: 100,
                              child: _selectedMatrix![0][index]==0?SizedBox(width: 67,height: 67,):
                              LineUpItemsWidget(
                                image: "assets/web_icons/add_button.png",
                                number: "64",
                              ),
                            );
                          },
                        ),
                      ),

                      SizedBox(height: 40),

                      SizedBox(
                        height: 67,
                        width: 470,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,

                          itemCount: _selectedMatrix![1].length,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              width: 100,
                              child: _selectedMatrix![1][index]==0?SizedBox(width: 67,height: 67,):
                              LineUpItemsWidget(
                                image: "assets/web_icons/add_button.png",
                                number: "64",
                              ),
                            );
                          },
                        ),
                      ),

                      SizedBox(height: 40),

                      SizedBox(
                        height: 67,
                        width: 470,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,

                          itemCount: _selectedMatrix![2].length,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              width: 100,
                              child: _selectedMatrix![2][index]==0?SizedBox(width: 67,height: 67,):
                              LineUpItemsWidget(
                                image: "assets/web_icons/add_button.png",
                                number: "64",
                              ),
                            );
                          },
                        ),
                      ),

                      SizedBox(height: 40),

                      SizedBox(
                        height: 67,
                        width: 500,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,

                          itemCount: _selectedMatrix![3].length,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              width: 107,
                              child: _selectedMatrix![3][index]==0?SizedBox(width: 67,height: 67,):
                              LineUpItemsWidget(
                                image: "assets/web_icons/add_button.png",
                                number: "64",
                              ),
                            );
                          },
                        ),
                      ),

                      SizedBox(height: 40),


                      SizedBox(
                        height: 67,
                        width: 530,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,

                          itemCount: _selectedMatrix![4].length,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              width: 107,
                              child: _selectedMatrix![4][index]==0?SizedBox(width: 67,height: 67,):
                              LineUpItemsWidget(
                                image: "assets/web_icons/add_button.png",
                                number: "64",
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
        )
      ],
    );
  }


  String? _selectedFormation;
  List<List<int>>? _selectedMatrix;

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
      _selectedMatrix = formationResponse!.l433R!.first.formationMatrix;
      setState(() {
        apiCalling = false;
        error = false;

      });

    }

  }


  void _onFormationSelected(String? value, FormationResponse? formationResponse) {
    setState(() {
      _selectedFormation = value;

      // Based on selected formation, update the matrix
      switch (value) {
        case '4-4-2':
          _selectedMatrix = formationResponse!.l442?.first.formationMatrix;
          break;
        case '4-3-3R':
          _selectedMatrix = formationResponse!.l433R?.first.formationMatrix;
          break;
        case '4-4-2D':
          _selectedMatrix = formationResponse!.l442D?.first.formationMatrix;
          break;
        case '4-2-4':
          _selectedMatrix = formationResponse!.l424?.first.formationMatrix;
          break;
        case '5-3-2':
          _selectedMatrix = formationResponse!.l532?.first.formationMatrix;
          break;
        case '3-5-2':
          _selectedMatrix = formationResponse!.l352?.first.formationMatrix;
          break;
        case '3-4-3':
          _selectedMatrix = formationResponse!.l343?.first.formationMatrix;
          break;
        default:
          _selectedMatrix = null;
      }
    });
  }


}
