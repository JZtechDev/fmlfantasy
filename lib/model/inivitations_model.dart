class Invitations {
  List<dynamic>? contactUserIds;
  List<dynamic>? userGroupIds;

  Invitations({this.contactUserIds, this.userGroupIds});

  Invitations.fromJson(Map<String, dynamic> json) {
    contactUserIds = json['contactUserIds'].cast<String>();
    userGroupIds = json['userGroupIds'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['contactUserIds'] = contactUserIds;
    data['userGroupIds'] = userGroupIds;
    return data;
  }
}
