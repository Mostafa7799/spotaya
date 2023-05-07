class ZonesModel {
  String? city;
  String? long;
  String? lat;

  ZonesModel({
    this.city,
    this.long,
    this.lat,
  });

  ZonesModel.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    long = json['long'];
    lat = json['lat'];
  }
}
