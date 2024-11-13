import 'dart:convert';

GMapData gMapDataFromJson(String str) => GMapData.fromJson(json.decode(str));

class GMapData {
  GMapData({
    required this.plusCode,
    required this.results,
    required this.status,
  });

  PlusCode plusCode;
  List<Result> results;
  String status;

  factory GMapData.fromJson(Map<String, dynamic> json) => GMapData(
        plusCode: PlusCode.fromJson(json["plus_code"]),
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        status: json["status"],
      );
}

class PlusCode {
  PlusCode({
    required this.compoundCode,
  });

  String compoundCode;

  factory PlusCode.fromJson(Map<String, dynamic> json) => PlusCode(
        compoundCode: json["compound_code"],
      );
}

class Result {
  Result({
    required this.addressComponents,
  });

  List<AddressComponent> addressComponents;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        addressComponents: List<AddressComponent>.from(
            json["address_components"]
                .map((x) => AddressComponent.fromJson(x))),
      );
}

class AddressComponent {
  AddressComponent({
    required this.longName,
    required this.shortName,
    required this.types,
  });

  String longName;
  String shortName;
  List<String> types;

  factory AddressComponent.fromJson(Map<String, dynamic> json) =>
      AddressComponent(
        longName: json["long_name"],
        shortName: json["short_name"],
        types: List<String>.from(json["types"].map((x) => x)),
      );
}
