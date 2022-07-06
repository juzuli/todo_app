class ApiResponse {
  bool? success;
  List<Data>? data;
  String? msg;
  List? errors;

  ApiResponse({this.success, this.data, this.msg, this.errors});

  ApiResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    msg = json['msg'];
    errors = [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['msg'] = msg;
    if (errors != null) {
      data['errors'] = errors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? name;
  String? startTime;
  String? endTime;
  String? date;

  Data({this.sId, this.name, this.startTime, this.endTime, this.date});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['date'] = date;
    return data;
  }
}

// class ApiResponse {
//   bool? success;
//   List<Data>? data;
//   String? msg;
//   List<void>? errors;
//
//   ApiResponse({this.success, this.data, this.msg, this.errors});
//
//   ApiResponse.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(Data.fromJson(v));
//       });
//       print(data);
//     }
//     msg = json['msg'];
//     if (json['errors'] != null) {
//       errors = <Null>[];
//       json['errors'].forEach((v) {
//         errors!.add(null);
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['success'] = success;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     data['msg'] = msg;
//     if (errors != null) {
//       data['errors'] = errors!.toList();
//     }
//     return data;
//   }
// }
//
// class Data {
//   String? sId;
//   String? name;
//   String? startTime;
//   String? endTime;
//   String? date;
//
//   Data({this.sId, this.name, this.startTime, this.endTime, this.date});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     name = json['name'];
//     startTime = json['startTime'];
//     endTime = json['endTime'];
//     date = json['date'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['_id'] = sId;
//     data['name'] = name;
//     data['startTime'] = startTime;
//     data['endTime'] = endTime;
//     data['date'] = date;
//     return data;
//   }
// }
