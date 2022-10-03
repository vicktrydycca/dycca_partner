
import 'dart:async';

import 'package:dycca_partner/api_helper/api_widgets/api_loader.dart';
import 'package:dycca_partner/api_helper/get_response/get_data.dart';
import 'package:dycca_partner/modal_class/event_subtype_modalclass.dart';
import 'package:dycca_partner/utils/bloc_base.dart';

class EventSubType_Bloc extends BlocBase{

  final StreamController<List<EventSubTypeCategory>> _EventSubTypeListController = StreamController.broadcast();


  StreamSink<List<EventSubTypeCategory>> get _EventSubTypeListSink  => _EventSubTypeListController.sink;
  Stream<List<EventSubTypeCategory>> get EventSubTypeListStream  => _EventSubTypeListController.stream;


  getEventCategoryList(){

    GetData().get_event_Subtype_Api(onSuccess: (data){
      _EventSubTypeListSink.add(data);
    }, onError: (data){
      DialogHelper.showErroDialog(description:data);


    });
  }


  @override
  dispose() {
    // TODO: implement
    _EventSubTypeListSink.close();
  }
}