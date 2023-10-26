import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Calc extends ChangeNotifier {
  int result = 0;
  int inc = 0;
  int exp = 0;
  int trs = 0;

  Calc({
    this.result = 0,
    this.inc = 0,
    this.exp = 0,
    this.trs = 0,
  }) {
    refresh();
  }
  factory Calc.fromjson(Map<String, dynamic> json) {
    return Calc(
        exp: json['exp'],
        inc: json['inc'],
        result: json['result'],
        trs: json['trs']);
  }

  Map<String, dynamic> tojson() {
    return {
      'result': result,
      'inc': inc,
      'exp': exp,
      'trs': trs,
    };
  }

  void refresh() async {
    final prefs = await SharedPreferences.getInstance();
    result = prefs.getInt('resultp') ?? 0;
    exp = prefs.getInt('eexp') ?? 0;
    inc = prefs.getInt('incc') ?? 0;
    notifyListeners();
  }

  void onSub(int sub) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // result -= sub;
    // exp +=sub;
    result = prefs.getInt('resultp') ?? 0;
    prefs.setInt('resultp', result -= sub);

    exp = prefs.getInt('eexp') ?? 0;
    prefs.setInt('eexp', exp += sub);
    notifyListeners();
  }

  void onAdd(int add) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // result += add;
    // inc += add;
    result = prefs.getInt('resultp') ?? 0;
    prefs.setInt('resultp', result += add);

    inc = prefs.getInt('incc') ?? 0;
    prefs.setInt('incc', inc += add);
    notifyListeners();
  }

  void transfer(int trs) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    result = prefs.getInt('resultp') ?? 0;
    prefs.setInt('resultp', result -= trs);
    notifyListeners();
    exp = prefs.getInt('eexp') ?? 0;
    prefs.setInt('eexp', exp += trs);
    notifyListeners();
  }

  String? selectedValue;
  String? months;
  String? incomecategory;
  String? incomewallet;
  String? expensecategory;
  String? expensewallet;

  void firstpagemonthdropdownbutton(value) {
    months = value;
    notifyListeners();
  }

  void expenseCategoryDropdownbutton(value) {
    expensecategory = value;
    notifyListeners();
  }

  void expenseWallet(value) {
    expensewallet = value;
    notifyListeners();
  }

  bool isSwitched = true;
  void expenseFlutterSwitch(val) {
    isSwitched = val;
    notifyListeners();
  }

  void incomeCategory(value) {
    incomecategory = value;
    notifyListeners();
  }

  void incomeWallet(value) {
    incomewallet = value;
    notifyListeners();
  }

  void incomeFlutterSwitch(val) {
    isSwitched = val;
    notifyListeners();
  }

  bool page = true;
  void pages(val) {
    page = val;

    notifyListeners();
    print(page);
  }
}
