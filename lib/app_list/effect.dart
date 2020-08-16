import 'package:dixy_test/app_list/action.dart';
import 'package:dixy_test/app_list/models/appModel.dart';
import 'package:dixy_test/app_list/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' as m;
import 'package:http/http.dart' as http;

Effect<AppListState> buildEffect() {
  return combineEffects(<Object, Effect<AppListState>>{
    Lifecycle.initState: _onInit,
    AppListAction.itemTapped: _itemTapped,
  });
}

Future _onInit(Action action, Context<AppListState> context) async {
  final response = await http.get('https://my.api.mockaroo.com/testflutter.json', headers: <String, String>{
    'X-API-Key': '3edf9730',
  });
  if (response.statusCode == 200) {
    final data = appModelFromJson(response.body);
    final action = AppListActionCreator.setLoadedApps(data);
    context.dispatch(action);
  } else {
    print('error');
  }
  
}

Future _itemTapped(Action action, Context<AppListState> context) async {
  if (action.payload == null || action.payload.isEmpty) {
    return;
  } else {
    await m.Navigator.pushNamed(context.context, 'detail', arguments: {
      'employee': action.payload,
    });
  }
  
}