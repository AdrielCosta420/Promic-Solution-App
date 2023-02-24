import 'package:flutter_modular/flutter_modular.dart';
import 'modules/home/ui/home_page.dart';

class AppModule extends Module {
  @override
  // TODO: implement binds

  @override
  // TODO: implement routes
  List<ModularRoute> get routes =>
      [ChildRoute('/', child: (context, args) => const HomePage())];
}
