import 'dart:async';

import 'package:dycca_partner/api_helper/api_widgets/api_loader.dart';
import 'package:dycca_partner/api_helper/get_response/get_data.dart';
import 'package:dycca_partner/utils/bloc_base.dart';

import '../modal_class/event_subcategory_type_modalclass.dart';

class EventType_Bloc extends BlocBase{

  final StreamController<List<Category>> _EventTypeListController = StreamController.broadcast();


  StreamSink<List<Category>> get _EventTypeListSink  => _EventTypeListController.sink;
  Stream<List<Category>> get EventTypeListStream  => _EventTypeListController.stream;


  getEventCategoryList(){

    GetData().get_event_type_Api(onSuccess: (data){
      _EventTypeListSink.add(data);
    }, onError: (data){
      DialogHelper.showErroDialog(description:data);


    });
  }


  @override
  dispose() {
    // TODO: implement
    _EventTypeListSink.close();
  }
}