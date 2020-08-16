import 'package:dixy_test/detail/effect.dart';
import 'package:dixy_test/detail/reducer.dart';
import 'package:dixy_test/detail/state.dart';
import 'package:dixy_test/detail/view.dart';
import 'package:fish_redux/fish_redux.dart';

class DetailPage extends Page<DetailState, Map<String, dynamic>> {
  DetailPage() : super(
    initState: DetailState.initState,
    view: buildView,
    effect: buildEffect(),
    reducer: buildReducer(),
  );
}