import 'package:draft_website/api/repository/create_team_repository.dart';
import 'package:draft_website/core/clickable_widget.dart';
import 'package:draft_website/core/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../../core/button_widget.dart';
import '../../../../core/common_methods.dart';
import '../../../responsive_screen.dart';

class TeamInfoScreen extends StatefulWidget {
  final Function()? onBackTap;

  const TeamInfoScreen({super.key, this.onBackTap,});

  @override
  State<TeamInfoScreen> createState() => _TeamInfoScreenState();
}

class _TeamInfoScreenState extends State<TeamInfoScreen> {
  TextEditingController mySearchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('MMM d, h:mm a').format(now);
    print(formattedDate); // Output: Mar 23, 10:34 PM
  }
  @override
  Widget build(BuildContext context) {
    return apiCalling?
    Center(child: SpinKitFadingCircle(
      color: mainAppColor,
      size: 30,),) :
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
                // "Back / Team Information",
                "",
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
          "Team Information",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: textColorOne,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "Team Name",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Color(0xFF23303B),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 55,
                    width: double.infinity,
                    margin: const EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: TextField(
                        controller: mySearchController,
                        textInputAction: TextInputAction.done,
                        style: const TextStyle(
                          color: Color(0xFF8E949A),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        decoration: InputDecoration(
                          fillColor: whiteColor,
                          hoverColor: Colors.transparent,
                          filled: true,
                          hintText: "ADD",
                          hintStyle: const TextStyle(
                            color: Color(0xFF8E949A),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
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
                  const SizedBox(height: 10),
                  const Text(
                    "Non-editable",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Color(0xFF4D586B),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "Team Logo (drag-and-drop or file selection)",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Color(0xFF23303B),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 55,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[

                          _imageBytes==null? SizedBox(height: 37,width: 30,):
                          SizedBox(
                              height: 100,
                              width: 100,
                              child: Image.memory(_imageBytes!)),

                          // SvgPicture.asset(
                          //   "assets/web_icons/abc_team.svg",
                          //   height: 37,
                          //   width: 30,
                          // ),
                          InkWell(
                            onTap: (){
                              _pickImage();
                            },
                              child: SvgPicture.asset("assets/web_icons/upload.svg")),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: InkWell(
                onTap: (){
                  doHomeClrPick();
                },
                child: Container(
                  height: 55,
                  width: double.infinity,
                  margin: const EdgeInsets.only(right: 20),
                  padding: EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: IgnorePointer(
                      child: TextField(
                        // controller: mySearchController,
                        textInputAction: TextInputAction.done,
                        style: const TextStyle(
                          color: Color(0xFF8E949A),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        decoration: InputDecoration(
                          fillColor: whiteColor,
                          filled: true,
                          suffixIcon: Container(
                            height: 33,
                            width: 33,
                            decoration: BoxDecoration(
                              color: currentHomeColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          suffixIconConstraints: const BoxConstraints(
                            minHeight: 10,
                            minWidth: 33,
                          ),
                          hintText: "Choose color / Home",
                          hintStyle: const TextStyle(
                            color: Color(0xFF8E949A),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                            top: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  doOutClrPick();
                },
                child: Container(
                  height: 55,
                  width: double.infinity,
                  padding: EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: IgnorePointer(
                      child: TextField(
                        // controller: mySearchController,
                        textInputAction: TextInputAction.done,
                        style: const TextStyle(
                          color: Color(0xFF8E949A),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        decoration: InputDecoration(
                          fillColor: whiteColor,
                          filled: true,
                          suffixIcon: Container(
                            height: 33,
                            width: 33,
                            decoration: BoxDecoration(
                              color: currentOutColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          suffixIconConstraints: const BoxConstraints(
                            minHeight: 10,
                            minWidth: 33,
                          ),
                          hintText: "Choose color / Out",
                          hintStyle: const TextStyle(
                            color: Color(0xFF8E949A),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                            top: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),


            const SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonWidget(
                  height: 55,
                  width: 330,
                  text: "Create team",
                  borderRadius: 12,
                  btnColor: const Color(0xFFF9F8FF),
                  borderColor: const Color(0xFFD7DCE4),
                  textColor: const Color(0xFF1976D2),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  onPressed: () async {
                    SnackBarClass snb = SnackBarClass();
                    if(_imageBytes==null || mySearchController.text.isEmpty){
                      snb.snackBarMethod(context: context, text: "Please complete all requirements!");
                    }else{

                      setState(() {
                        apiCalling = true;
                      });

                      TeamRepository createTeamRep = TeamRepository();
                      int status = await createTeamRep.createTeam(_imageBytes, mySearchController.text, "0x${currentHomeColor.value.toRadixString(16)}","0x${currentOutColor.value.toRadixString(16)}");
                      if(status==200){
                        snb.snackBarMethod(context: context, text: "Created Successfully!");
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => ResponsivePage(index: 2,)),
                              (Route<dynamic> route) => false,  // This removes all the routes until the condition is met
                        );

                      }else{
                        snb.snackBarMethod(context: context, text: "Something went wrong!");
                      }

                      setState(() {
                        apiCalling = false;
                      });

                    }

                  },
                ),
              ],
            ),


      ],
    );
  }

  bool apiCalling = false;

  Uint8List? _imageBytes;

  // Method to pick image from gallery or camera
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      try {
        // Read the image bytes
        Uint8List imageBytes = await pickedFile.readAsBytes();

        // Check the first few bytes of the image to validate it
        if (_isValidImage(imageBytes)) {
          setState(() {
            _imageBytes = imageBytes;
          });
        } else {
          print('The selected file is not a valid image.');
        }
      } catch (e) {
        print('Error loading image: $e');
      }
    }
  }

  // Helper function to validate if the file is a valid image by checking the header
  bool _isValidImage(Uint8List bytes) {
    if (bytes.length < 8) return false;

    // Convert the first few bytes to a hex string for inspection
    final String header = bytes.sublist(0, 8).map((e) => e.toRadixString(16).padLeft(2, '0')).join();

    print('Image header: $header'); // Debug output

    // Check for common image headers
    return header.startsWith('ffd8ff') || // JPEG
        header.startsWith('89504e47') || // PNG
        header.startsWith('47494638') || // GIF
        header.startsWith('49492a00') || // TIFF
        header.startsWith('424d'); // BMP
  }


  // create some values
  Color pickerHomeColor = Color(0xff443a49);
  Color currentHomeColor = Color(0xff443a49);
  Color pickerOutColor = Color(0xff443a49);
  Color currentOutColor = Color(0xff443a92);
  // ValueChanged<Color> callback
  void changeHomeColor(Color color) {
    setState(() => pickerHomeColor = color);
  }
  doHomeClrPick(){

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Pick Home color!'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: pickerHomeColor,
              onColorChanged: changeHomeColor,
            ),

          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Confirm'),
              onPressed: () {
                setState(() => currentHomeColor = pickerHomeColor);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }



  void changeOutColor(Color color) {
    setState(() => pickerOutColor = color);
  }
  doOutClrPick(){

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Pick Out color!'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: pickerOutColor,
              onColorChanged: changeOutColor,
            ),

          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Confirm'),
              onPressed: () {
                setState(() => currentOutColor = pickerOutColor);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


}
