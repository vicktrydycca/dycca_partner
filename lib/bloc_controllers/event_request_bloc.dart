import 'dart:async';

import 'package:dycca_partner/api_helper/api_widgets/api_loader.dart';
import 'package:dycca_partner/api_helper/get_response/get_data.dart';
import 'package:dycca_partner/api_helper/send_reponse/send_reponse.dart';
import 'package:dycca_partner/modal_class/event_info_modelclass.dart';
import 'package:dycca_partner/modal_class/event_request_modalclass.dart';
import 'package:dycca_partner/modal_class/event_type_details_modalclass.dart';
import 'package:dycca_partner/utils/bloc_base.dart';


class EventRequestBloc extends BlocBase{

  final StreamController<List<Eventreq>> _EventListController = StreamController.broadcast();


  StreamSink<List<Eventreq>> get _EventListSink  => _EventListController.sink;
  Stream<List<Eventreq>> get EventListStream  => _EventListController.stream;


  getEventCategoryList(){

    SendData().eventRequest(onSuccess: (data){
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