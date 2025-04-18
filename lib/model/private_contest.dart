class CreatePrivateContest {
  String? name;
  String? sportCode;
  String? competitionCode;
  String? matchCode;
  bool? isMultiMatch;
  String? startDate;
  String? endDate;
  int? maxParticipants;
  int? entryFee;
  String? joinCode;
  List<Members>? members;

  CreatePrivateContest(
      {this.name,
      this.sportCode,
      this.competitionCode,
      this.matchCode,
      this.isMultiMatch,
      this.startDate,
      this.endDate,
      this.maxParticipants,
      this.entryFee,
      this.joinCode,
      this.members});

  CreatePrivateContest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    sportCode = json['sportCode'];
    competitionCode = json['competitionCode'];
    matchCode = json['matchCode'];
    isMultiMatch = json['isMultiMatch'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    maxParticipants = json['maxParticipants'];
    entryFee = json['entryFee'];
    joinCode = json['joinCode'];
    if (json['members'] != null) {
      members = <Members>[];
      json['members'].forEach((v) {
        members!.add(Members.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['sportCode'] = sportCode;
    data['competitionCode'] = competitionCode;
    data['matchCode'] = matchCode;
    data['isMultiMatch'] = isMultiMatch;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['maxParticipants'] = maxParticipants;
    data['entryFee'] = entryFee;
    data['joinCode'] = joinCode;
    if (members != null) {
      data['members'] = members!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Members {
  String email;
  String name;
  bool isAdmin;

  Members({required this.email, required this.name, this.isAdmin = false});

  Map<String, dynamic> toJson() {
    return {
      'alias': name,
      'email': email,
      'isAdmin': isAdmin,
    };
  }

  factory Members.fromJson(Map<String, dynamic> map) {
    return Members(
      name: map['alias']!,
      email: map['email']!,
      isAdmin: map['isAdmin'] == true,
    );
  }
}
