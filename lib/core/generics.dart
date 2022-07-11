
import 'package:movie_app/data/model/actor_details_model.dart';
import 'package:movie_app/data/model/actor_images_model.dart';
import 'package:movie_app/data/model/people_model.dart';

class Generics {
  static T? fromJson<T,K>(dynamic json) {
    print(T);
    print(K);
    if (json! is Iterable) {
      return _fromJsonList<K>(json) as T;
    }else if (T == PeopleModel) {
      return PeopleModel.fromJson(json) as T;
    }else if (T == ActorDetailsModel) {
      return ActorDetailsModel.fromJson(json) as T;
    }else if (T == ActorImagesModel) {
      return ActorImagesModel.fromJson(json) as T;
    }
    else
      {
        throw Exception("Unknown class");
      }

  }
  static List<K>? _fromJsonList<K>(List jsonList) {
    if (jsonList == null) {
      return null;
    }

    List<K> output = [];

    for (Map<String, dynamic> json in jsonList) {
      output.add(fromJson(json));
    }
    return output;
  }
}