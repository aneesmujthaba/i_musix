class MusicDataResponseModel {
  final int resultCount;
  final List<Results> results;

  const MusicDataResponseModel(
      {required this.resultCount, required this.results});

  factory MusicDataResponseModel.fromJson(Map<String, dynamic> json) {
    return MusicDataResponseModel(
      resultCount: json['resultCount'],
      results:
          List<Results>.from(json["results"].map((x) => Results.fromJson(x)))
              .toList(),
    );
  }
}

class Results {
  final String name;
  final String image;
  final double price;

  const Results({
    required this.name,
    required this.image,
    required this.price,
  });

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        name: json["artistName"] ?? "",
        image: json["artworkUrl100"],
        price: json["collectionPrice"] ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        "artistName": name,
        "artworkUrl100": image,
        "collectionPrice": price,
      };
}
