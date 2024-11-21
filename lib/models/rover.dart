import 'package:flutter_application/models/camera.dart';

class Rover {
  int? id;
  String? name;
  String? landingDate;
  String? launchDate;
  String? status;
  int? maxSol;
  String? maxDate;
  int? totalPhotos;
  List<Cameras>? cameras;

  Rover(
      {this.id,
      this.name,
      this.landingDate,
      this.launchDate,
      this.status,
      this.maxSol,
      this.maxDate,
      this.totalPhotos,
      this.cameras});

  Rover.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    landingDate = json['landing_date'];
    launchDate = json['launch_date'];
    status = json['status'];
    maxSol = json['max_sol'];
    maxDate = json['max_date'];
    totalPhotos = json['total_photos'];
    if (json['cameras'] != null) {
      cameras = <Cameras>[];
      json['cameras'].forEach((v) {
        cameras!.add(new Cameras.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['landing_date'] = this.landingDate;
    data['launch_date'] = this.launchDate;
    data['status'] = this.status;
    data['max_sol'] = this.maxSol;
    data['max_date'] = this.maxDate;
    data['total_photos'] = this.totalPhotos;
    if (this.cameras != null) {
      data['cameras'] = this.cameras!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
