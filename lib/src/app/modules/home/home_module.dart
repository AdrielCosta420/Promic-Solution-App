
import 'package:flutter_modular/flutter_modular.dart';
import 'package:promic_app/src/app/modules/home/ui/home_page.dart';

class HomeModule extends Module{
  @override
  // TODO: implement binds
 

 // TODO: implement routes
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const HomePage()),
  ];
}