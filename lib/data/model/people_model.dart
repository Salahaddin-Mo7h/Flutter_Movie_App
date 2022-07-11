class PeopleModel {
  bool? _adult;
  int? _gender;
  int? _id;
  List<KnownFor>? _knownFor;
  String? _knownForDepartment;
  String? _name;
  double? _popularity;
  String? _profilePath;

  PeopleModel(
      {bool? adult,
        int? gender,
        int? id,
        List<KnownFor>? knownFor,
        String? knownForDepartment,
        String? name,
        double? popularity,
        String? profilePath}) {
    if (adult != null) {
      this._adult = adult;
    }
    if (gender != null) {
      this._gender = gender;
    }
    if (id != null) {
      this._id = id;
    }
    if (knownFor != null) {
      this._knownFor = knownFor;
    }
    if (knownForDepartment != null) {
      this._knownForDepartment = knownForDepartment;
    }
    if (name != null) {
      this._name = name;
    }
    if (popularity != null) {
      this._popularity = popularity;
    }
    if (profilePath != null) {
      this._profilePath = profilePath;
    }
  }

  bool? get adult => _adult;
  set adult(bool? adult) => _adult = adult;
  int? get gender => _gender;
  set gender(int? gender) => _gender = gender;
  int? get id => _id;
  set id(int? id) => _id = id;
  List<KnownFor>? get knownFor => _knownFor;
  set knownFor(List<KnownFor>? knownFor) => _knownFor = knownFor;
  String? get knownForDepartment => _knownForDepartment;
  set knownForDepartment(String? knownForDepartment) =>
      _knownForDepartment = knownForDepartment;
  String? get name => _name;
  set name(String? name) => _name = name;
  double? get popularity => _popularity;
  set popularity(double? popularity) => _popularity = popularity;
  String? get profilePath => _profilePath;
  set profilePath(String? profilePath) => _profilePath = profilePath;

  PeopleModel.fromJson(Map<String, dynamic> json) {
    _adult = json['adult'];
    _gender = json['gender'];
    _id = json['id'];
    _knownForDepartment = json['known_for_department'];
    _name = json['name'];
    _profilePath = json['profile_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = this._adult;
    data['gender'] = this._gender;
    data['id'] = this._id;
    if (this._knownFor != null) {
      data['known_for'] = this._knownFor!.map((v) => v.toJson()).toList();
    }
    data['known_for_department'] = this._knownForDepartment;
    data['name'] = this._name;
    data['popularity'] = this._popularity;
    data['profile_path'] = this._profilePath;
    return data;
  }
}

class KnownFor {
  bool? _adult;
  String? _backdropPath;
  List<int>? _genreIds;
  int? _id;
  String? _mediaType;
  String? _originalLanguage;
  String? _originalTitle;
  String? _overview;
  String? _posterPath;
  String? _releaseDate;
  String? _title;
  bool? _video;
  double? _voteAverage;
  int? _voteCount;
  String? _firstAirDate;
  String? _name;
  List<String>? _originCountry;
  String? _originalName;

  KnownFor(
      {bool? adult,
        String? backdropPath,
        List<int>? genreIds,
        int? id,
        String? mediaType,
        String? originalLanguage,
        String? originalTitle,
        String? overview,
        String? posterPath,
        String? releaseDate,
        String? title,
        bool? video,
        double? voteAverage,
        int? voteCount,
        String? firstAirDate,
        String? name,
        List<String>? originCountry,
        String? originalName}) {
    if (adult != null) {
      this._adult = adult;
    }
    if (backdropPath != null) {
      this._backdropPath = backdropPath;
    }
    if (genreIds != null) {
      this._genreIds = genreIds;
    }
    if (id != null) {
      this._id = id;
    }
    if (mediaType != null) {
      this._mediaType = mediaType;
    }
    if (originalLanguage != null) {
      this._originalLanguage = originalLanguage;
    }
    if (originalTitle != null) {
      this._originalTitle = originalTitle;
    }
    if (overview != null) {
      this._overview = overview;
    }
    if (posterPath != null) {
      this._posterPath = posterPath;
    }
    if (releaseDate != null) {
      this._releaseDate = releaseDate;
    }
    if (title != null) {
      this._title = title;
    }
    if (video != null) {
      this._video = video;
    }
    if (voteAverage != null) {
      this._voteAverage = voteAverage;
    }
    if (voteCount != null) {
      this._voteCount = voteCount;
    }
    if (firstAirDate != null) {
      this._firstAirDate = firstAirDate;
    }
    if (name != null) {
      this._name = name;
    }
    if (originCountry != null) {
      this._originCountry = originCountry;
    }
    if (originalName != null) {
      this._originalName = originalName;
    }
  }

  bool? get adult => _adult;
  set adult(bool? adult) => _adult = adult;
  String? get backdropPath => _backdropPath;
  set backdropPath(String? backdropPath) => _backdropPath = backdropPath;
  List<int>? get genreIds => _genreIds;
  set genreIds(List<int>? genreIds) => _genreIds = genreIds;
  int? get id => _id;
  set id(int? id) => _id = id;
  String? get mediaType => _mediaType;
  set mediaType(String? mediaType) => _mediaType = mediaType;
  String? get originalLanguage => _originalLanguage;
  set originalLanguage(String? originalLanguage) =>
      _originalLanguage = originalLanguage;
  String? get originalTitle => _originalTitle;
  set originalTitle(String? originalTitle) => _originalTitle = originalTitle;
  String? get overview => _overview;
  set overview(String? overview) => _overview = overview;
  String? get posterPath => _posterPath;
  set posterPath(String? posterPath) => _posterPath = posterPath;
  String? get releaseDate => _releaseDate;
  set releaseDate(String? releaseDate) => _releaseDate = releaseDate;
  String? get title => _title;
  set title(String? title) => _title = title;
  bool? get video => _video;
  set video(bool? video) => _video = video;
  double? get voteAverage => _voteAverage;
  set voteAverage(double? voteAverage) => _voteAverage = voteAverage;
  int? get voteCount => _voteCount;
  set voteCount(int? voteCount) => _voteCount = voteCount;
  String? get firstAirDate => _firstAirDate;
  set firstAirDate(String? firstAirDate) => _firstAirDate = firstAirDate;
  String? get name => _name;
  set name(String? name) => _name = name;
  List<String>? get originCountry => _originCountry;
  set originCountry(List<String>? originCountry) =>
      _originCountry = originCountry;
  String? get originalName => _originalName;
  set originalName(String? originalName) => _originalName = originalName;

  KnownFor.fromJson(Map<String, dynamic> json) {
    _adult = json['adult'];
    _backdropPath = json['backdrop_path'];
    _genreIds = json['genre_ids'].cast<int>();
    _id = json['id'];
    _mediaType = json['media_type'];
    _originalLanguage = json['original_language'];
    _originalTitle = json['original_title'];
    _overview = json['overview'];
    _posterPath = json['poster_path'];
    _releaseDate = json['release_date'];
    _title = json['title'];
    _video = json['video'];
    _voteCount = json['vote_count'];
    _firstAirDate = json['first_air_date'];
    _name = json['name'];
    _originalName = json['original_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = this._adult;
    data['backdrop_path'] = this._backdropPath;
    data['genre_ids'] = this._genreIds;
    data['id'] = this._id;
    data['media_type'] = this._mediaType;
    data['original_language'] = this._originalLanguage;
    data['original_title'] = this._originalTitle;
    data['overview'] = this._overview;
    data['poster_path'] = this._posterPath;
    data['release_date'] = this._releaseDate;
    data['title'] = this._title;
    data['video'] = this._video;
    data['vote_average'] = this._voteAverage;
    data['vote_count'] = this._voteCount;
    data['first_air_date'] = this._firstAirDate;
    data['name'] = this._name;
    data['origin_country'] = this._originCountry;
    data['original_name'] = this._originalName;
    return data;
  }
}