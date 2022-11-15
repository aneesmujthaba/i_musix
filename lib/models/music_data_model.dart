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
  final int id;
  final String name;
  final String image;
  final double price;
  final String description;
  final String country;
  final String genre;

  const Results({
    required this.name,
    required this.id,
    required this.image,
    required this.price,
    required this.description,
    required this.country,
    required this.genre,
  });

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        id: json["artistId"] ?? 0,
        name: json["artistName"] ?? "",
        image: json["artworkUrl100"],
        price: json["collectionPrice"] ?? 0.0,
        description: json["description"] ?? "",
        country: json["country"] ?? "",
        genre: json["primaryGenreName"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "artistId": id,
        "artistName": name,
        "artworkUrl100": image,
        "collectionPrice": price,
        "description": description,
        "country": country,
        "primaryGenreName": genre,
      };
}
