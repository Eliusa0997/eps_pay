import 'package:get/state_manager.dart';
import 'package:get/utils.dart';

validInput(value, int min, int max, type) {
  if (type == "username") {
    if (!GetUtils.isUsername(value)) {
      return "Not Valid Username";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(value)) {
      return "Not Valid Email";
    }
  }

  if (value.length < min) {
    return "Cant Be Less Than $min";
  }
  if (value.length > max) {
    return "Cant Be larger Than $max";
  }
  if (value.isEmpty) {
    return "Cant Be Empty";
  }
}
