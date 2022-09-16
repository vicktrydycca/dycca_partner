import 'dart:async';

import 'package:dycca_partner/api_helper/api_widgets/api_loader.dart';
import 'package:dycca_partner/api_helper/get_response/get_data.dart';
import 'package:dycca_partner/modal_class/amenity_,modalclass.dart';
import 'package:dycca_partner/utils/bloc_base.dart';

class AmenityBloc extends BlocBase{

  final StreamController<List<Amenity>> _amenityListController = StreamController.broadcast();


  StreamSink<List<Amenity>> get _amenityListSink  => _amenityListController.sink;
  Stream<List<Amenity>> get amenityListStream  => _amenityListController.stream;


  getAmenityList(){

    GetData().getAmenityApi(onSuccess: (data){
      _amenityListSink.add(data);
    }, onError: (data){
      DialogHelper.showErroDialog(description:data);


    });
  }

  @override
  dispose() {
    // TODO: implement
    _amenityListSink.close();
  }
}