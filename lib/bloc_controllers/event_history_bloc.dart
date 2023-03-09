import 'dart:async';

import 'package:dycca_partner/api_helper/api_widgets/api_loader.dart';
import 'package:dycca_partner/api_helper/get_response/get_data.dart';

import 'package:dycca_partner/utils/bloc_base.dart';

import '../modal_class/event_history_modalclass.dart';


class EventHistoryBloc extends BlocBase{

  final StreamController<List<Event>> _EventListController = StreamController.broadcast();


  StreamSink<List<Event>> get _EventListSink  => _EventListController.sink;
  Stream<List<Event>> get EventListStream  => _EventListController.stream;


  getEventCategoryList(){

    GetData().getEventHistoryApi(onSuccess: (data){
      _EventListSink.add(data);
    }, onError: (data){
      DialogHelper.showErroDialog(description:data);
    });
  }


  @override
  dispose() {
    // TODO: implement
    _EventListSink.close();
  }
}