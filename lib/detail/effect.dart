import 'package:dixy_test/detail/state.dart';
import 'package:fish_redux/fish_redux.dart';

Effect<DetailState> buildEffect() {
  return combineEffects(<Object, Effect<DetailState>>{
    Lifecycle.initState: _onInit,
  });
}

void _onInit(Action action, Context<DetailState> context) {
  // context.state.info = action.payload;
}