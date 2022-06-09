import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class AppProvider extends ChangeNotifier {
  TextEditingController nameC = TextEditingController();
  TextEditingController lastNameC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  TextEditingController verifyPasswordC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController phoneC = TextEditingController();
  TextEditingController otpC = TextEditingController();
  TextEditingController addressC = TextEditingController();
  TextEditingController locationC = TextEditingController();
  TextEditingController searchC = TextEditingController();
  bool isLoading = false;
  String? alert = 'alert';

  DateTime? dateTimeToday;
  DateTime? dateTimeTomorrow;
  DateTime? formattedDate = DateTime.now();
  setFormatedDate(DateTime dateTime) {
    formattedDate = dateTime;
    notifyListeners();
  }

  setTimeToday(DateTime dateTime) {
    dateTimeToday = dateTime;
    notifyListeners();
  }

  setTimeTomorrow(DateTime dateTime) {
    dateTimeTomorrow = dateTime;
    notifyListeners();
  }

  setLoadingTrue() {
    isLoading = true;
    notifyListeners();
  }

  setLoadingFalse() {
    isLoading = false;
    notifyListeners();
  }

  bool isShow = true;
  isShowPass() {
    isShow = !isShow;
    notifyListeners();
  }

  clearController() {
    nameC.clear();
    lastNameC.clear();
    emailC.clear();
    phoneC.clear();
    passwordC.clear();
    verifyPasswordC.clear();
    otpC.clear();
  }

  int? _selectedIndex = 0;
  int? get selectedIndex => _selectedIndex;
  setBottomIndex(int? index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
