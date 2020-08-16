import 'package:dixy_test/app_list/models/appModel.dart';
import 'package:fish_redux/fish_redux.dart';

class AppListState implements Cloneable<AppListState> {

  List<AppModel> items;

  static AppListState initState(Map<String, dynamic> args) {
    var state = AppListState();
    state.items = List();
    return state;
  }

  @override
  AppListState clone() => AppListState()
    ..items = items;
  
}