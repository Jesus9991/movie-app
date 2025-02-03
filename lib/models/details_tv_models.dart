import 'dart:convert';

/*detalles de las series */

DetailsTvModel detailsTvModelFromJson(String str) =>
    DetailsTvModel.fromJson(json.decode(str));

String detailsTvModelToJson(DetailsTvModel data) => json.encode(data.toJson());

class DetailsTvModel {
  bool adult;
  String backdropPath;
  List<CreatedByTv> createdBy;
  List<dynamic> episodeRunTime;
  String firstAirDate;
  List<GenreTv> genres;
  String homepage;
  int id;
  bool inProduction;
  List<String> languages;
  DateTime lastAirDate;
  LastEpisodeToAirTv lastEpisodeToAir;
  String name;
  dynamic nextEpisodeToAir;
  List<NetworkTv> networks;
  int numberOfEpisodes;
  int numberOfSeasons;
  List<String> originCountry;
  String originalLanguage;
  String originalName;
  String overview;
  double popularity;
  String posterPath;
  List<NetworkTv> productionCompanies;
  List<ProductionCountryTv> productionCountries;
  List<SeasonTv> seasons;
  List<SpokenLanguageTv> spokenLanguages;
  String status;
  String tagline;
  String type;
  double voteAverage;
  int voteCount;

  DetailsTvModel({
    required this.adult,
    required this.backdropPath,
    required this.createdBy,
    required this.episodeRunTime,
    required this.firstAirDate,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.inProduction,
    required this.languages,
    required this.lastAirDate,
    required this.lastEpisodeToAir,
    required this.name,
    this.nextEpisodeToAir,
    required this.networks,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.seasons,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.type,
    required this.voteAverage,
    required this.voteCount,
  });

  factory DetailsTvModel.fromJson(Map<String, dynamic> json) => DetailsTvModel(
        adult: json["adult"] ?? false,
        backdropPath: json["backdrop_path"] ?? '',
        createdBy: json["created_by"] != null
            ? List<CreatedByTv>.from(
                json["created_by"].map((x) => CreatedByTv.fromJson(x)))
            : [],
        episodeRunTime: json["episode_run_time"] != null
            ? List<dynamic>.from(json["episode_run_time"].map((x) => x))
            : [],
        firstAirDate: json["first_air_date"] ?? '',
        genres: json["genres"] != null
            ? List<GenreTv>.from(json["genres"].map((x) => GenreTv.fromJson(x)))
            : [],
        homepage: json["homepage"] ?? '',
        id: json["id"] ?? 0,
        inProduction: json["in_production"] ?? false,
        languages: json["languages"] != null
            ? List<String>.from(json["languages"].map((x) => x))
            : [],
        lastAirDate: json["last_air_date"] != null
            ? DateTime.parse(json["last_air_date"])
            : DateTime.now(),
        lastEpisodeToAir: json["last_episode_to_air"] != null
            ? LastEpisodeToAirTv.fromJson(json["last_episode_to_air"])
            : LastEpisodeToAirTv(
                id: 0,
                name: '',
                overview: '',
                voteAverage: 0,
                voteCount: 0,
                airDate: '',
                episodeNumber: 0,
                episodeType: '',
                productionCode: '',
                runtime: 0,
                seasonNumber: 0,
                showId: 0,
                stillPath: null),
        name: json["name"] ?? '',
        nextEpisodeToAir: json["next_episode_to_air"] ?? '',
        networks: json["networks"] != null
            ? List<NetworkTv>.from(
                json["networks"].map((x) => NetworkTv.fromJson(x)))
            : [],
        numberOfEpisodes: json["number_of_episodes"] ?? 0,
        numberOfSeasons: json["number_of_seasons"] ?? 0,
        originCountry: json["origin_country"] != null
            ? List<String>.from(json["origin_country"].map((x) => x))
            : [],
        originalLanguage: json["original_language"] ?? '',
        originalName: json["original_name"] ?? '',
        overview: json["overview"] ?? '',
        popularity: (json["popularity"] ?? 0.0).toDouble(),
        posterPath: json["poster_path"] ?? '',
        productionCompanies: json["production_companies"] != null
            ? List<NetworkTv>.from(
                json["production_companies"].map((x) => NetworkTv.fromJson(x)))
            : [],
        productionCountries: json["production_countries"] != null
            ? List<ProductionCountryTv>.from(json["production_countries"]
                .map((x) => ProductionCountryTv.fromJson(x)))
            : [],
        seasons: json["seasons"] != null
            ? List<SeasonTv>.from(
                json["seasons"].map((x) => SeasonTv.fromJson(x)))
            : [],
        spokenLanguages: json["spoken_languages"] != null
            ? List<SpokenLanguageTv>.from(json["spoken_languages"]
                .map((x) => SpokenLanguageTv.fromJson(x)))
            : [],
        status: json["status"] ?? '',
        tagline: json["tagline"] ?? '',
        type: json["type"] ?? '',
        voteAverage: (json["vote_average"] ?? 0.0).toDouble(),
        voteCount: json["vote_count"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "created_by": List<dynamic>.from(createdBy.map((x) => x.toJson())),
        "episode_run_time": List<dynamic>.from(episodeRunTime.map((x) => x)),
        "first_air_date": firstAirDate,
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
        "homepage": homepage,
        "id": id,
        "in_production": inProduction,
        "languages": List<dynamic>.from(languages.map((x) => x)),
        "last_air_date":
            "${lastAirDate.year.toString().padLeft(4, '0')}-${lastAirDate.month.toString().padLeft(2, '0')}-${lastAirDate.day.toString().padLeft(2, '0')}",
        "last_episode_to_air": lastEpisodeToAir.toJson(),
        "name": name,
        "next_episode_to_air": nextEpisodeToAir,
        "networks": List<dynamic>.from(networks.map((x) => x.toJson())),
        "number_of_episodes": numberOfEpisodes,
        "number_of_seasons": numberOfSeasons,
        "origin_country": List<dynamic>.from(originCountry.map((x) => x)),
        "original_language": originalLanguage,
        "original_name": originalName,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "production_companies":
            List<dynamic>.from(productionCompanies.map((x) => x.toJson())),
        "production_countries":
            List<dynamic>.from(productionCountries.map((x) => x.toJson())),
        "seasons": List<dynamic>.from(seasons.map((x) => x.toJson())),
        "spoken_languages":
            List<dynamic>.from(spokenLanguages.map((x) => x.toJson())),
        "status": status,
        "tagline": tagline,
        "type": type,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}

class CreatedByTv {
  int id;
  String creditId;
  String name;
  String originalName;
  int gender;
  dynamic profilePath;

  CreatedByTv({
    required this.id,
    required this.creditId,
    required this.name,
    required this.originalName,
    required this.gender,
    required this.profilePath,
  });

  factory CreatedByTv.fromJson(Map<String, dynamic> json) => CreatedByTv(
        id: json["id"] ?? 0,
        creditId: json["credit_id"] ?? '',
        name: json["name"] ?? '',
        originalName: json["original_name"] ?? '',
        gender: json["gender"] ?? 0,
        profilePath: json["profile_path"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "credit_id": creditId,
        "name": name,
        "original_name": originalName,
        "gender": gender,
        "profile_path": profilePath,
      };
}

class GenreTv {
  int id;
  String name;

  GenreTv({required this.id, required this.name});

  factory GenreTv.fromJson(Map<String, dynamic> json) => GenreTv(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class LastEpisodeToAirTv {
  int id;
  String name;
  String overview;
  double voteAverage;
  int voteCount;
  String airDate;
  int episodeNumber;
  String episodeType;
  String productionCode;
  int runtime;
  int seasonNumber;
  int showId;
  dynamic stillPath;

  LastEpisodeToAirTv({
    required this.id,
    required this.name,
    required this.overview,
    required this.voteAverage,
    required this.voteCount,
    required this.airDate,
    required this.episodeNumber,
    required this.episodeType,
    required this.productionCode,
    required this.runtime,
    required this.seasonNumber,
    required this.showId,
    required this.stillPath,
  });

  factory LastEpisodeToAirTv.fromJson(Map<String, dynamic> json) =>
      LastEpisodeToAirTv(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        overview: json["overview"] ?? '',
        voteAverage: (json["vote_average"] ?? 0.0).toDouble(),
        voteCount: json["vote_count"] ?? 0,
        airDate: json["air_date"] ?? '',
        episodeNumber: json["episode_number"] ?? 0,
        episodeType: json["episode_type"] ?? '',
        productionCode: json["production_code"] ?? '',
        runtime: json["runtime"] ?? 0,
        seasonNumber: json["season_number"] ?? 0,
        showId: json["show_id"] ?? 0,
        stillPath: json["still_path"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "overview": overview,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "air_date": airDate,
        "episode_number": episodeNumber,
        "episode_type": episodeType,
        "production_code": productionCode,
        "runtime": runtime,
        "season_number": seasonNumber,
        "show_id": showId,
        "still_path": stillPath,
      };
}

class NetworkTv {
  int id;
  String name;
  String logoPath;
  String originCountry;

  NetworkTv({
    required this.id,
    required this.name,
    required this.logoPath,
    required this.originCountry,
  });

  factory NetworkTv.fromJson(Map<String, dynamic> json) => NetworkTv(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        logoPath: json["logo_path"] ?? '',
        originCountry: json["origin_country"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo_path": logoPath,
        "origin_country": originCountry,
      };
}

class ProductionCountryTv {
  String iso31661;
  String name;

  ProductionCountryTv({required this.iso31661, required this.name});

  factory ProductionCountryTv.fromJson(Map<String, dynamic> json) =>
      ProductionCountryTv(
        iso31661: json["iso_3166_1"] ?? '',
        name: json["name"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "iso_3166_1": iso31661,
        "name": name,
      };
}

class SeasonTv {
  int id;
  String name;
  int episodeCount;
  String airDate;
  String posterPath;

  SeasonTv({
    required this.id,
    required this.name,
    required this.episodeCount,
    required this.airDate,
    required this.posterPath,
  });

  factory SeasonTv.fromJson(Map<String, dynamic> json) => SeasonTv(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        episodeCount: json["episode_count"] ?? 0,
        airDate: json["air_date"] ?? '',
        posterPath: json["poster_path"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "episode_count": episodeCount,
        "air_date": airDate,
        "poster_path": posterPath,
      };
}

class SpokenLanguageTv {
  String iso6391;
  String name;

  SpokenLanguageTv({
    required this.iso6391,
    required this.name,
  });

  factory SpokenLanguageTv.fromJson(Map<String, dynamic> json) =>
      SpokenLanguageTv(
        iso6391: json["iso_639_1"] ?? '',
        name: json["name"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "iso_639_1": iso6391,
        "name": name,
      };
}
