
class ActorImagesModel {
  double? _aspectRatio;
  int? _height;
  Null? _iso6391;
  String? _filePath;
  double? _voteAverage;
  int? _voteCount;
  int? _width;

  ActorImagesModel(
      {double? aspectRatio,
        int? height,
        Null? iso6391,
        String? filePath,
        double? voteAverage,
        int? voteCount,
        int? width}) {
    if (aspectRatio != null) {
      this._aspectRatio = aspectRatio;
    }
    if (height != null) {
      this._height = height;
    }
    if (iso6391 != null) {
      this._iso6391 = iso6391;
    }
    if (filePath != null) {
      this._filePath = filePath;
    }
    if (voteAverage != null) {
      this._voteAverage = voteAverage;
    }
    if (voteCount != null) {
      this._voteCount = voteCount;
    }
    if (width != null) {
      this._width = width;
    }
  }

  double? get aspectRatio => _aspectRatio;
  set aspectRatio(double? aspectRatio) => _aspectRatio = aspectRatio;
  int? get height => _height;
  set height(int? height) => _height = height;
  Null? get iso6391 => _iso6391;
  set iso6391(Null? iso6391) => _iso6391 = iso6391;
  String? get filePath => _filePath;
  set filePath(String? filePath) => _filePath = filePath;
  double? get voteAverage => _voteAverage;
  set voteAverage(double? voteAverage) => _voteAverage = voteAverage;
  int? get voteCount => _voteCount;
  set voteCount(int? voteCount) => _voteCount = voteCount;
  int? get width => _width;
  set width(int? width) => _width = width;

  ActorImagesModel.fromJson(Map<String, dynamic> json) {
    _aspectRatio = json['aspect_ratio'];
    _height = json['height'];
    _iso6391 = json['iso_639_1'];
    _filePath = json['file_path'];
    _voteAverage = json['vote_average'];
    _voteCount = json['vote_count'];
    _width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aspect_ratio'] = this._aspectRatio;
    data['height'] = this._height;
    data['iso_639_1'] = this._iso6391;
    data['file_path'] = this._filePath;
    data['vote_average'] = this._voteAverage;
    data['vote_count'] = this._voteCount;
    data['width'] = this._width;
    return data;
  }
}