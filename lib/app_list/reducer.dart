import 'package:dixy_test/app_list/action.dart';
import 'package:dixy_test/app_list/state.dart';
import 'package:fish_redux/fish_redux.dart';

Reducer<AppListState> buildReducer() {
  return asReducer(<Object, Reducer<AppListState>> {
    AppListAction.setLoadedApps: _setLoadedApps,
  });
}

AppListState _setLoadedApps(AppListState state, Action action) {
  return state.clone()
    ..items = action.payload;
}