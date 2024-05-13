class RoomOption {
  int id;
  String imageName;
  String imagePath;
  String tier;
  int price;
  int salePrice;
  String saleState;
  Information information;
  List<RoomDetailOption> options;

  RoomOption({
    required this.id,
    required this.imageName,
    required this.imagePath,
    required this.tier,
    required this.price,
    required this.salePrice,
    required this.saleState,
    required this.information,
    required this.options,
  });


  @override
  String toString() {
    return 'RoomOption{id: $id, imageName: $imageName, imagePath: $imagePath, tier: $tier, price: $price, salePrice: $salePrice, saleState: $saleState, information: $information, options: $options}';
  }

  factory RoomOption.fromJson(Map<String, dynamic> json) => RoomOption(
    id: json["id"],
    imageName: json["imageName"] ?? 'room1.jpg',
    imagePath: json["imagePath"] ?? '',
    tier: json["tier"],
    price: json["price"],
    salePrice: json["salePrice"],
    saleState: json["saleState"],
    information: Information.fromJson(json["information"]),
    options: List<RoomDetailOption>.from(json["options"].map((x) => RoomDetailOption.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "imageName": imageName,
    "imagePath": imagePath,
    "tier": tier,
    "price": price,
    "salePrice": salePrice,
    "saleState": saleState,
    "information": information.toJson(),
    "Options": List<dynamic>.from(options.map((x) => x.toJson())),
  };
}

class Information {
  int minPerson;
  int maxPerson;
  String moreinfo;

  Information({
    required this.minPerson,
    required this.maxPerson,
    required this.moreinfo,
  });

  @override
  String toString() {
    return 'Information{minPerson: $minPerson, maxPerson: $maxPerson, moreinfo: $moreinfo}';
  }

  factory Information.fromJson(Map<String, dynamic> json) => Information(
    minPerson: json["minPerson"],
    maxPerson: json["maxPerson"],
    moreinfo: json["moreinfo"],
  );

  Map<String, dynamic> toJson() => {
    "minPerson": minPerson,
    "maxPerson": maxPerson,
    "moreinfo": moreinfo,
  };
}

class RoomDetailOption {
  String name;
  String iconName;

  RoomDetailOption({
    required this.name,
    required this.iconName,
  });

  @override
  String toString() {
    return 'Option{name: $name, iconName: $iconName}';
  }

  factory RoomDetailOption.fromJson(Map<String, dynamic> json) => RoomDetailOption(
    name: json["name"],
    iconName: json["iconName"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "iconName": iconName,
  };
}