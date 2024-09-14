
import 'dart:convert';

class TeamDataResponse {
  TeamMetaData? teamMetaData;
  List<dynamic>? players;
  bool? error;
  String? errorMsg;

  TeamDataResponse({
    this.teamMetaData,
    this.players,
    this.error,
    this.errorMsg,
  });

  // Factory method to create a `TeamDataModel` instance from JSON
  TeamDataResponse.fromJson(Map<String, dynamic> json) {
    teamMetaData = json['team_meta_data'] != null
        ? TeamMetaData.fromJson(json['team_meta_data'])
        : null;
    if (json['players'] != null) {
      players = <dynamic>[];
      json['players'].forEach((v) {
        players!.add(v); // Assuming `players` can be a list of dynamic items
      });
    }
    error = json['error'];
    errorMsg = json['errorMsg'];
  }

  // Method to convert `TeamDataModel` instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (teamMetaData != null) {
      data['team_meta_data'] = teamMetaData!.toJson();
    }
    if (players != null) {
      data['players'] = players!;
    }
    data['error'] = error;
    data['errorMsg'] = errorMsg;
    return data;
  }
}

// Class for `team_meta_data`
class TeamMetaData {
  String? homeColor;
  String? outColor;
  String? teamName;
  String? teamLogo;
  String? dateTime;

  TeamMetaData({
    this.teamName,
    this.homeColor,
    this.outColor,
    this.dateTime,
    this.teamLogo,
  });

  // Factory method to create a `TeamMetaData` instance from JSON
  TeamMetaData.fromJson(Map<String, dynamic> json) {
    teamName = json['teamName'];
    homeColor = json['homeColor'];
    outColor = json['outColor'];
    dateTime = json['dateTime'];
    teamLogo = json['teamLogo'];
  }

  // Method to convert `TeamMetaData` instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['teamName'] = teamName;
    data['homeColor'] = homeColor;
    data['outColor'] = outColor;
    data['dateTime'] = dateTime;
    data['teamLogo'] = teamLogo;
    return data;
  }
}