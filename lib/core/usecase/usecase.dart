import 'package:either_type/either_type.dart';
import 'package:movie_app/core/error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>>? call(Params params);
}
class NoParams {
}
// ignore: must_be_immutable
class Params {
  final Map? body;
  final int? index;
  final bool? boolValue;
  final String? value;
  String? id;

  Params({this.body,this.index,this.boolValue,this.id,this.value});
}