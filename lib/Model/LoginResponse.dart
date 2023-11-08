class LoginResponse {
  Response? response;

  LoginResponse({this.response});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      response: json['response'] != null
          ? Response.fromJson(json['response'])
          : null,
    );
  }
}

class Response {
  String? success;
  Result? result;

  Response({this.success, this.result});

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      success: json['success'],
      result: json['result'] != null ? Result.fromJson(json['result']) : null,
    );
  }
}

class Result {
  String? lastName;
  List<DeviceIds>? deviceIds;
  String? loginId;
  String? profileImage;
  String? platform;
  bool? doNotDisturb;
  String? segment;
  String? email;
  bool? editAccess;
  bool? roaming;
  String? contactId;
  String? mobile;
  String? accountclass;
  String? assignedUserId;
  DashboardInfo? dashboardInfo;
  String? userName;
  String? accountNumber;
  String? accessToken;
  String? lastLoginTime;
  String? accountId;
  String? firstName;
  String? servicetype;
  bool? pushNotifications;
  String? response;
  String? success;
  String? basePlan;
  String? location;

  Result({
    this.lastName,
    this.deviceIds,
    this.loginId,
    this.profileImage,
    this.platform,
    this.doNotDisturb,
    this.segment,
    this.email,
    this.editAccess,
    this.roaming,
    this.contactId,
    this.mobile,
    this.accountclass,
    this.assignedUserId,
    this.dashboardInfo,
    this.userName,
    this.accountNumber,
    this.accessToken,
    this.lastLoginTime,
    this.accountId,
    this.firstName,
    this.servicetype,
    this.pushNotifications,
    this.response,
    this.success,
    this.basePlan,
    this.location,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      lastName: json['lastName'],
      deviceIds: (json['deviceIds'] as List<dynamic>?)
          ?.map((e) => DeviceIds.fromJson(e))
          .toList(),
      loginId: json['loginId'],
      profileImage: json['profileImage'],
      platform: json['platform'],
      doNotDisturb: json['doNotDisturb'],
      segment: json['segment'],
      email: json['email'],
      editAccess: json['editAccess'],
      roaming: json['roaming'],
      contactId: json['contactId'],
      mobile: json['mobile'],
      accountclass: json['accountclass'],
      assignedUserId: json['assigned_user_id'],
      dashboardInfo: json['dashboardInfo'] != null
          ? DashboardInfo.fromJson(json['dashboardInfo'])
          : null,
      userName: json['userName'],
      accountNumber: json['accountNumber'],
      accessToken: json['accessToken'],
      lastLoginTime: json['lastLoginTime'],
      accountId: json['accountId'],
      firstName: json['firstName'],
      servicetype: json['servicetype'],
      pushNotifications: json['pushNotifications'],
      response: json['response'],
      success: json['success'],
      basePlan: json['basePlan'],
      location: json['location'],
    );
  }
}

class DeviceIds {
  String? accountName;
  String? accountNo;
  String? deviceId;
  String? email;

  DeviceIds({this.accountName, this.accountNo, this.deviceId, this.email});

  factory DeviceIds.fromJson(Map<String, dynamic> json) {
    return DeviceIds(
      accountName: json['accountName'],
      accountNo: json['accountNo'],
      deviceId: json['deviceId'],
      email: json['email'],
    );
  }
}

class DashboardInfo {
  String? noOfServiceAccounts;

  DashboardInfo({this.noOfServiceAccounts});

  factory DashboardInfo.fromJson(Map<String, dynamic> json) {
    return DashboardInfo(
      noOfServiceAccounts: json['noOfServiceAccounts'],
    );
  }
}
