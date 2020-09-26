import 'dart:ffi';
// coord = json['coord'] != null ? new Coord.fromJson(json['coord']) : null;
//     if (json['weather'] != null) {
//       weather = new List<Weather>();
//       json['weather'].forEach((v) {
//         weather.add(new Weather.fromJson(v));
//       });
//     }

class Ls {
  // Coord coord;
  List<Coord> coord;
  String name;

  Ls({this.coord, this.name});
  Ls.fromJson(Map<String, dynamic> json) {
    // coord = json['coord'] != null ? new Coord.fromJson(json['coord']) : null;
    if (json['coord'] != null) {
      coord = new List<Coord>();
      json['coord'].forEach((e) => coord.add(e));
    }

    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    // if (this.coord != null) {
    //   data['coord'] = this.coord.toJson();
    // }

    if (this.coord != null) {
      data['coord'] = this.coord.map((e) => e.toJson()).toList();
    }

    data['name'] = this.name;
  }
}

class Coord {
  double lg, log;
  Coord({this.lg, this.log});

  Coord.fromJson(Map<String, dynamic> json) {
    lg = json['lg'];
    log = json['log'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> coord = new Map<String, dynamic>();
    coord['lg'] = this.lg;
    coord['log'] = this.log;
    return coord;
  }
}
