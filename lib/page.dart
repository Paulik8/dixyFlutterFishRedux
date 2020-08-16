import 'package:dixy_test/app_list/effect.dart';
import 'package:dixy_test/app_list/reducer.dart';
import 'package:dixy_test/app_list/state.dart';
import 'package:dixy_test/app_list/view.dart';
import 'package:fish_redux/fish_redux.dart';
import 'app_list/view.dart';

class AppListPage extends Page<AppListState, Map<String, dynamic>> {
  AppListPage() : super(
    initState: AppListState.initState,
    view: buildView,
    effect: buildEffect(),
    reducer: buildReducer(),
  );
}