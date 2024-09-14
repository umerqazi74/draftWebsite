class PlayersDataResponse {
  List<Tokens>? tokens;
  LoanData? loanData;
  bool? error;
  String? errorMsg;

  PlayersDataResponse({
    this.tokens,
    this.error,
    this.errorMsg,
    this.loanData
  });

  PlayersDataResponse.fromJson(Map<String, dynamic> json) {
    if (json['tokens'] != null) {
      tokens = <Tokens>[];
      json['tokens'].forEach((v) {
        tokens!.add(Tokens.fromJson(v));
      });
    }
    loanData = json['loan_data'] != null
        ? new LoanData.fromJson(json['loan_data'])
        : null;
    error = json['error'];
    errorMsg = json['errorMsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (tokens != null) {
      data['tokens'] = tokens!.map((v) => v.toJson()).toList();
    }
    if (loanData != null) {
      data['loan_data'] = loanData!.toJson();
    }
    data['error'] = error;
    data['errorMsg'] = errorMsg;
    return data;
  }
}

class Tokens {
  String? id;
  double? diving;
  double? injuryRisk;
  double? heading;
  double? physicality;
  double? reflexes;
  double? leadership;
  double? shootPrecision;
  double? passPrecision;
  double? tacklePrecision;
  double? endurance;
  double? speed;
  double? aggression;
  double? dribble;
  double? shootPower;
  double? gameVision;
  double? gKKicking;
  String? name;
  String? description;
  String? imageUrl;
  String? openseaUrl;
  String? teamName;
  String? status;
  String? birthday;

  Tokens(
      {this.id,
      this.diving,
      this.injuryRisk,
      this.heading,
      this.physicality,
      this.reflexes,
      this.leadership,
      this.shootPrecision,
      this.passPrecision,
      this.tacklePrecision,
      this.endurance,
      this.speed,
      this.aggression,
      this.dribble,
      this.shootPower,
      this.gameVision,
      this.gKKicking,
      this.name,
      this.description,
      this.imageUrl,
      this.openseaUrl,
      this.teamName,
      this.status,
      this.birthday});

  Tokens.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    diving = json['Diving'];
    injuryRisk = json['Injury_Risk'];
    heading = json['Heading'];
    physicality = json['Physicality'];
    reflexes = json['Reflexes'];
    leadership = json['Leadership'];
    shootPrecision = json['Shoot_Precision'];
    passPrecision = json['Pass_Precision'];
    tacklePrecision = json['Tackle_Precision'];
    endurance = json['Endurance'];
    speed = json['Speed'];
    aggression = json['Aggression'];
    dribble = json['Dribble'];
    shootPower = json['Shoot_Power'];
    gameVision = json['Game_vision'];
    gKKicking = json['GK_Kicking'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['image_url'];
    openseaUrl = json['opensea_url'];
    teamName = json['team_name'];
    status = json['status'];
    birthday = json['birthday'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['Diving'] = diving;
    data['Injury_Risk'] = injuryRisk;
    data['Heading'] = heading;
    data['Physicality'] = physicality;
    data['Reflexes'] = reflexes;
    data['Leadership'] = leadership;
    data['Shoot_Precision'] = shootPrecision;
    data['Pass_Precision'] = passPrecision;
    data['Tackle_Precision'] = tacklePrecision;
    data['Endurance'] = endurance;
    data['Speed'] = speed;
    data['Aggression'] = aggression;
    data['Dribble'] = dribble;
    data['Shoot_Power'] = shootPower;
    data['Game_vision'] = gameVision;
    data['GK_Kicking'] = gKKicking;
    data['name'] = name;
    data['description'] = description;
    data['image_url'] = imageUrl;
    data['opensea_url'] = openseaUrl;
    data['team_name'] = teamName;
    data['status'] = status;
    data['birthday'] = birthday;
    return data;
  }
}

class LoanData {
  int? numLoanedPlayers;
  int? numLoanedPossible;
  bool? isLoanable;

  LoanData({this.numLoanedPlayers, this.numLoanedPossible, this.isLoanable});

  LoanData.fromJson(Map<String, dynamic> json) {
    numLoanedPlayers = json['num_loaned_players'];
    numLoanedPossible = json['num_loaned_possible'];
    isLoanable = json['is_loanable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['num_loaned_players'] = numLoanedPlayers;
    data['num_loaned_possible'] = numLoanedPossible;
    data['is_loanable'] = isLoanable;
    return data;
  }
}