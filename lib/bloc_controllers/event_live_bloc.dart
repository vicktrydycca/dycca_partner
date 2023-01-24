import 'dart:async';

import 'package:dycca_partner/api_helper/api_widgets/api_loader.dart';
import 'package:dycca_partner/api_helper/get_response/get_data.dart';
import 'package:dycca_partner/api_helper/send_reponse/send_reponse.dart';
import 'package:dycca_partner/modal_class/event_info_modelclass.dart';
import 'package:dycca_partner/modal_class/event_type_details_modalclass.dart';
import 'package:dycca_partner/utils/bloc_base.dart';


class LiveEventDetailsBloc extends BlocBase{

  final StreamController<AboutEvent> _EventListController = StreamController.broadcast();


  StreamSink<AboutEvent> get _EventListSink  => _EventListController.sink;
  Stream<AboutEvent> get EventListStream  => _EventListController.stream;


  getEventCategoryList(){

    SendData().eventDetails(onSuccess: (data){
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