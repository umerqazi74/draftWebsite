import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
class FormationRepository{

  Future getFormationData() async {

    final prefs = await SharedPreferences.getInstance();
    String userWalletAddress = prefs.getString('userWalletAddress') ?? "";

    const String url = 'https://fhgwe79cnd.us-east-1.awsapprunner.com/get_formation';

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

}