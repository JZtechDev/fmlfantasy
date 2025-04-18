class Contacts {
  String? contactUserId;
  String? email;
  String? fullName;
  String? alias;
  String? imageUrl;
  String? userName;
  String? mobile;
  String? additionalEmail;

  Contacts({
    this.email,
    this.fullName,
    this.alias,
    this.imageUrl,
    this.userName,
    this.mobile,
    this.additionalEmail,
    this.contactUserId,
  });

  Contacts.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    fullName = json['fullName'];
    alias = json['alias'] ?? '';
    imageUrl = json['imageUrl'] ?? '';
    userName = json['userName'] ?? '';
    mobile = json['mobile'] ?? '';
    additionalEmail = json['additionalEmail'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['fullName'] = fullName;
    data['alias'] = alias;
    data['imageUrl'] = imageUrl;
    data['userName'] = userName;
    data['mobile'] = mobile;
    data['additionalEmail'] = additionalEmail ?? '';
    data['contactId'] = contactUserId;
    return data;
  }
}

class Groups {
  String? groupName;
  List<GroupMembers>? groupMembers;

  Groups({this.groupName, this.groupMembers});

  Groups.fromJson(Map<String, dynamic> json) {
    groupName = json['groupName'];
    if (json['groupMembers'] != null) {
      groupMembers = <GroupMembers>[];
      json['groupMembers'].forEach((v) {
        groupMembers!.add(GroupMembers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['groupName'] = groupName;
    if (groupMembers != null) {
      data['groupMembers'] = groupMembers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GroupMembers {
  String? contactUserId;
  bool? contactUserIsAdmin;

  GroupMembers({this.contactUserId, this.contactUserIsAdmin});

  GroupMembers.fromJson(Map<String, dynamic> json) {
    contactUserId = json['contactUserId'];
    contactUserIsAdmin = json['contactUserIsAdmin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['contactUserId'] = contactUserId;
    data['contactUserIsAdmin'] = contactUserIsAdmin;
    return data;
  }
}

class GetContacts {
  String? contactId;
  String? mobile;
  String? additionalEmail;
  String? dateAddedUtc;
  bool? isActive;
  List<Groups>? userGroups;
  String? userId;
  String? email;
  String? fullName;
  String? alias;
  String? imageUrl;
  String? userName;

  GetContacts(
      {this.mobile,
      this.additionalEmail,
      this.dateAddedUtc,
      this.isActive,
      this.userGroups,
      this.userId,
      this.email,
      this.fullName,
      this.alias,
      this.imageUrl,
      this.userName});

  GetContacts.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
    additionalEmail = json['additionalEmail'] ?? '';
    dateAddedUtc = json['dateAddedUtc'];
    isActive = json['isActive'];
    if (json['userGroups'] != null) {
      userGroups = <Groups>[];
      json['userGroups'].forEach((v) {
        userGroups!.add(Groups.fromJson(v));
      });
    }
    userId = json['userId'];
    email = json['email'];
    fullName = json['fullName'];
    alias = json['alias'] ?? '';
    imageUrl = json['imageUrl'] ?? '';
    userName = json['userName'] ?? '';
    contactId = json['contactId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mobile'] = mobile;
    data['additionalEmail'] = additionalEmail ?? '';
    data['dateAddedUtc'] = dateAddedUtc;
    data['isActive'] = isActive;
    if (userGroups != null) {
      data['userGroups'] = userGroups!.map((v) => v.toJson()).toList();
    }
    data['userId'] = userId;
    data['email'] = email;
    data['fullName'] = fullName;
    data['alias'] = alias;
    data['imageUrl'] = imageUrl;
    data['userName'] = userName;
    data['contactId'] = contactId;
    return data;
  }
}

class GetGroups {
  String? userId;
  String? userGroupId;
  String? userGroupIcon;
  String? userGroupName;

  GetGroups(
      {this.userId, this.userGroupId, this.userGroupIcon, this.userGroupName});

  GetGroups.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    userGroupId = json['userGroupId'];
    userGroupIcon = json['userGroupIcon'];
    userGroupName = json['userGroupName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['userGroupId'] = userGroupId;
    data['userGroupIcon'] = userGroupIcon;
    data['userGroupName'] = userGroupName;
    return data;
  }
}

class GetGroupMembers {
  String? userGroupId;
  String? contactUserId;
  int? userGroupRole;
  String? userId;
  String? email;
  String? fullName;
  String? alias;
  String? imageUrl;
  String? userName;

  GetGroupMembers(
      {this.userGroupId,
      this.contactUserId,
      this.userGroupRole,
      this.userId,
      this.email,
      this.fullName,
      this.alias,
      this.imageUrl,
      this.userName});

  GetGroupMembers.fromJson(Map<String, dynamic> json) {
    userGroupId = json['userGroupId'] ?? '';
    contactUserId = json['contactUserId'] ?? '';
    userGroupRole = json['userGroupRole'] ?? 1;
    userId = json['userId'] ?? '';
    email = json['email'] ?? '';
    fullName = json['fullName'] ?? '';
    alias = json['alias'] ?? '';
    imageUrl = json['imageUrl'] ?? '';
    userName = json['userName'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userGroupId'] = userGroupId;
    data['contactUserId'] = contactUserId;
    data['userGroupRole'] = userGroupRole;
    data['userId'] = userId;
    data['email'] = email;
    data['fullName'] = fullName;
    data['alias'] = alias;
    data['imageUrl'] = imageUrl;
    data['userName'] = userName;
    return data;
  }
}
