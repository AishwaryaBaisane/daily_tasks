
import 'package:daily_task/Daily_task_1/Todo_Modal/Todo_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Api_helper/api_helper.dart';

class TodoProvider with ChangeNotifier {
  List<TodoModal> todos = [];
  bool isGrid = false;
  bool isDarkTheme = false;
  ApiHelper apiHelper = ApiHelper();

  Future<void> fetchTodos() async {
    List pro = await apiHelper.fetchDataFromApi();
    todos = pro.map((data) => TodoModal.fromJson(data)).toList();
    notifyListeners();
  }

  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    isGrid = prefs.getBool('isGrid') ?? false;
    isDarkTheme = prefs.getBool('isDarkTheme') ?? false;
    notifyListeners();
  }

  Future<void> screenView() async {
    isGrid = !isGrid;
    print(isGrid);
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isGrid', isGrid);
    notifyListeners();
  }

  Future<void> screenTheme() async {
    isDarkTheme = !isDarkTheme;
    print(isDarkTheme);
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkTheme', isDarkTheme);
    notifyListeners();
  }

  TodoProvider() {
    loadData();
    fetchTodos();
  }
}