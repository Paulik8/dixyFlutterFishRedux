import 'package:dixy_test/detail/page.dart';
import 'package:dixy_test/page.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:http/http.dart';

class Router {
  static AbstractRoutes generateRoute() {
    final AbstractRoutes routes = PageRoutes(
        pages: <String, Page<Object, dynamic>>{
          'home': AppListPage(),
          'detail': DetailPage(),
        },
    );
    return routes;
  }
}


