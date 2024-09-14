import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';




class TeamRepository{

// Function to fetch team data
  Future getTeamData() async {

    String userWalletAddress = await loadWalletValue();

    const String url = 'https://fhgwe79cnd.us-east-1.awsapprunner.com/get_team/';

    // Define the headers
    Map<String, String> headers = {
      "UserAddress": userWalletAddress,
      "Content-Type": 'application/json',
    };

    try {
      // Send the GET request
      final http.Response response = await http.get(
        Uri.parse(url),
        headers: headers,
      );

      // Check if the request was successful
      if (response.statusCode == 200) {
        // Parse the JSON response
        Map<String, dynamic> responseResult = jsonDecode(response.body);
        // Convert the JSON to a TeamData object
        // TeamDataModel teamData = TeamDataModel.fromJson(jsonData);
        print('Team data fetched successfully');
        return responseResult;

      } else {
        return {
          "error": true,
          "errorMsg": "Error : ${response.statusCode} code",
        };
      }
    } catch (e) {
      return {
        "error": true,
        "errorMsg": "Please check your internet connection!",
      };
    }
  }



  Future<int> createTeam(Uint8List? _imageBytes,String teamName, String homeColor,String outColor) async {

    String userWalletAddress = await loadWalletValue();
    int status = 0;

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('MMM d, h:mm a').format(now);

    // Convert the image to a base64 string
    String base64Image = base64Encode(_imageBytes!);

    // Define the API URL
    const String url = 'https://fhgwe79cnd.us-east-1.awsapprunner.com/create_team/';

    // Define the headers
    Map<String, String> headers = {
      "UserAddress": userWalletAddress,
      "Content-Type": 'application/json',
    };

    // Define the body
    Map<String, dynamic> body = {
      'content': { // Add the 'content' key
        'meta_data': {
          'homeColor': homeColor,
          'outColor': outColor,
          'teamName': teamName,
          'teamLogo': base64Image.toString(),  // Include the base64 string of the image
          'dateTime': formattedDate,  // Include the base64 string of the image
        },
      },
    };
    // Convert the body to JSON
    String jsonBody = json.encode(body);
    try {
      // Send the POST request
      final http.Response response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonBody,
      );

      // Check if the request was successful
      if (response.statusCode == 200) {
        status = 200;
        print('Team created successfully');
      } else {
        status = 0;
        print('Failed to create team. Status code: ${response.statusCode}');
        print('error description: ${response.body}');
      }
    } catch (e) {
      status = 33;
      print('Error occurred: $e');
    }

    return status;

  }





  Future<void> storeWalletValue(String userWalletAddress) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userWalletAddress', userWalletAddress);
  }

  Future<String> loadWalletValue() async {
    final prefs = await SharedPreferences.getInstance();

    String userWalletAddress = prefs.getString('userWalletAddress') ?? "";
    return userWalletAddress;
  }

}

