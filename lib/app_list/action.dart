import 'package:fish_redux/fish_redux.dart';

import 'models/appModel.dart';

enum AppListAction {
  setLoadedApps,
  itemTapped,
}

class AppListActionCreator {

  static Action setLoadedApps(List<AppModel> apps) {
    return Action(AppListAction.setLoadedApps, payload: apps);
  }

  static Action itemTapped(List<Employee> employee) {
    return Action(AppListAction.itemTapped, payload: employee);
  }

}