import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoanPlayerRepository{

  Future getLoanPlayer(String playerId) async {
    final prefs = await SharedPreferences.getInstance();
    String userWalletAddress = prefs.getString('userWalletAddress') ?? "";

    const String url = 'https://fhgwe79cnd.us-east-1.awsapprunner.com/loan_player/';

    print("ye address hai: $userWalletAddress");
    print("ye id hai: $playerId");

    // Define the headers
    Map<String, String> headers = {
      "UserAddress": userWalletAddress,  // Passing actual userWalletAddress value here
      "Content-Type": 'application/json',
    };

    // Define the request body
    Map<String, dynamic> body = {
        "player_id": playerId,
    };

    String jsonBody = json.encode(body);
    try {
      // Send the POST request
      final http.Response response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonBody,  // Encoding the body as JSON
      );

      // Check if the request was successful
      if (response.statusCode == 200) {
        // Parse the JSON response
        Map<String, dynamic> responseResult = jsonDecode(response.body);
        print('Loan player data fetched successfully');
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