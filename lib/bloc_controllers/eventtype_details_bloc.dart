import 'dart:async';

import 'package:dycca_partner/api_helper/api_widgets/api_loader.dart';
import 'package:dycca_partner/api_helper/get_response/get_data.dart';
import 'package:dycca_partner/api_helper/send_reponse/send_reponse.dart';
import 'package:dycca_partner/modal_class/event_type_details_modalclass.dart';
import 'package:dycca_partner/utils/bloc_base.dart';


class EventTypeDetailsBloc extends BlocBase{

  final StreamController<List<EventRound>> _EventTypeListController = StreamController.broadcast();


  StreamSink<List<EventRound>> get _EventTypeListSink  => _EventTypeListController.sink;
  Stream<List<EventRound>> get EventTypeListStream  => _EventTypeListController.stream;


  getEventCategoryList(){

    SendData().eventTypeDetails(onSuccess: (data){
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