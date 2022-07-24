import 'dart:async';

import 'package:dycca_partner/utils/bloc_base.dart';

class HomeBloc extends BlocBase{


  final StreamController _studioListController = StreamController.broadcast();




  @override
  dispose() {
    // TODO: implement dispose
    throw UnimplementedError();
  }


}