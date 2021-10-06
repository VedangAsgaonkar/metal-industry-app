import 'package:shared_preferences/shared_preferences.dart';

getData() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
}
