import 'dart:async';

import 'package:dycca_partner/api_helper/api_widgets/api_loader.dart';
import 'package:dycca_partner/api_helper/get_response/get_data.dart';
import 'package:dycca_partner/modal_class/amenity_,modalclass.dart';
import 'package:dycca_partner/modal_class/equipment_modalclass.dart';
import 'package:dycca_partner/utils/bloc_base.dart';

class EquipmentBloc extends BlocBase{

  final StreamController<List<Equipment>> _equipmentListController = StreamController.broadcast();


  StreamSink<List<Equipment>> get _equipmentListSink  => _equipmentListController.sink;
  Stream<List<Equipment>> get equipmentListStream  => _equipmentListController.stream;


  getEquipmentsList(){

    GetData().getEquipmentApi(onSuccess: (data){
      _equipmentListSink.add(data);
    }, onError: (data){
      DialogHelper.showErroDialog(description:data);


    });
  }

  @override
  dispose() {
    // TODO: implement
    _equipmentListSink.close();
  }
}