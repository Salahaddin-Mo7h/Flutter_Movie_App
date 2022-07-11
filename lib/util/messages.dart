import 'package:get/get.dart';

class Messages extends Translations{
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'click_me': 'Click Me',
      },
    'fa_IR': {
      'click_me': 'اضغطني',
    }
  };
}