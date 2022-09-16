import 'dart:async';

import 'package:dycca_partner/api_helper/api_widgets/api_loader.dart';
import 'package:dycca_partner/api_helper/get_response/get_data.dart';
import 'package:dycca_partner/modal_class/event_category_modalclass.dart';
import 'package:dycca_partner/utils/bloc_base.dart';

class EventCategory_Bloc extends BlocBase{

  final StreamController<List<Category>> _EventCategoryListController = StreamController.broadcast();


  StreamSink<List<Category>> get _EventCategoryListSink  => _EventCategoryListController.sink;
  Stream<List<Category>> get EventCategoryListStream  => _EventCategoryListController.stream;


  getEventCategoryList(){

    GetData().get_event_homepage_Api(onSuccess: (data){
      _EventCategoryListSink.add(data);
    }, onError: (data){
      DialogHelper.showErroDialog(description:data);


    });
  }


  @override
  dispose() {
    // TODO: implement
    _EventCategoryListSink.close();
  }
}