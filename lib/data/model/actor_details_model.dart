
class ActorDetailsModel {
  bool? _adult;
  List<String>? _alsoKnownAs;
  String? _biography;
  String? _birthday;
  Null? _deathday;
  int? _gender;
  Null? _homepage;
  int? _id;
  String? _imdbId;
  String? _knownForDepartment;
  String? _name;
  String? _placeOfBirth;
  double? _popularity;
  String? _profilePath;

  ActorDetailsModel(
      {bool? adult,
        List<String>? alsoKnownAs,
        String? biography,
        String? birthday,
        int? gender,
        int? id,
        String? imdbId,
        String? knownForDepartment,
        String? name,
        String? placeOfBirth,
        double? popularity,
        String? profilePath}) {
    if (adult != null) {
      this._adult = adult;
    }
    if (alsoKnownAs != null) {
      this._alsoKnownAs = alsoKnownAs;
    }
    if (biography != null) {
      this._biography = biography;
    }
    if (birthday != null) {
      this._birthday = birthday;
    }
    if (deathday != null) {
      this._deathday = deathday;
    }
    if (gender != null) {
      this._gender = gender;
    }
    if (id != null) {
      this._id = id;
    }
    if (imdbId != null) {
      this._imdbId = imdbId;
    }
    if (knownForDepartment != null) {
      this._knownForDepartment = knownForDepartment;
    }
    if (name != null) {
      this._name = name;
    }
    if (placeOfBirth != null) {
      this._placeOfBirth = placeOfBirth;
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
  List<String>? get alsoKnownAs => _alsoKnownAs;
  set alsoKnownAs(List<String>? alsoKnownAs) => _alsoKnownAs = alsoKnownAs;
  String? get biography => _biography;
  set biography(String? biography) => _biography = biography;
  String? get birthday => _birthday;
  set birthday(String? birthday) => _birthday = birthday;
  Null? get deathday => _deathday;
  set deathday(Null? deathday) => _deathday = deathday;
  int? get gender => _gender;
  set gender(int? gender) => _gender = gender;
  int? get id => _id;
  set id(int? id) => _id = id;
  String? get imdbId => _imdbId;
  set imdbId(String? imdbId) => _imdbId = imdbId;
  String? get knownForDepartment => _knownForDepartment;
  set knownForDepartment(String? knownForDepartment) =>
      _knownForDepartment = knownForDepartment;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get placeOfBirth => _placeOfBirth;
  set placeOfBirth(String? placeOfBirth) => _placeOfBirth = placeOfBirth;
  double? get popularity => _popularity;
  set popularity(double? popularity) => _popularity = popularity;
  String? get profilePath => _profilePath;
  set profilePath(String? profilePath) => _profilePath = profilePath;

  ActorDetailsModel.fromJson(Map<String, dynamic> json) {
    _adult = json['adult'];
    _alsoKnownAs = json['also_known_as'].cast<String>();
    _biography = json['biography'];
    _birthday = json['birthday'];
    _gender = json['gender'];
    _id = json['id'];
    _imdbId = json['imdb_id'];
    _knownForDepartment = json['known_for_department'];
    _name = json['name'];
    _placeOfBirth = json['place_of_birth'];
    _popularity = json['popularity'];
    _profilePath = json['profile_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = this._adult;
    data['also_known_as'] = this._alsoKnownAs;
    data['biography'] = this._biography;
    data['birthday'] = this._birthday;
    data['deathday'] = this._deathday;
    data['gender'] = this._gender;
    data['id'] = this._id;
    data['imdb_id'] = this._imdbId;
    data['known_for_department'] = this._knownForDepartment;
    data['name'] = this._name;
    data['place_of_birth'] = this._placeOfBirth;
    data['popularity'] = this._popularity;
    data['profile_path'] = this._profilePath;
    return data;
  }
}