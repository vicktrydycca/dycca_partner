import 'dart:async';

import 'package:dycca_partner/api_helper/api_widgets/api_loader.dart';
import 'package:dycca_partner/api_helper/get_response/get_data.dart';
import 'package:dycca_partner/modal_class/services_list_modalclass.dart';
import 'package:dycca_partner/utils/bloc_base.dart';

class HomeBloc extends BlocBase{


  final StreamController<List<Service>> _serviceListController = StreamController.broadcast();


  StreamSink<List<Service>> get _serviceListSink  => _serviceListController.sink;
  Stream<List<Service>> get serviceListStream  => _serviceListController.stream;


  getServicesList(){

    GetData().getHomeStudioApi(onSuccess: (data){
      _serviceListSink.add(data);
    }, onError: (data){
      DialogHelper.showErroDialog(description:data);


    });
  }


  @override
  dispose() {
    // TODO: implement dispose
    _serviceListSink.close();
    // throw UnimplementedError();
  }


}