import 'dart:async';

import 'package:dycca_partner/api_helper/api_widgets/api_loader.dart';
import 'package:dycca_partner/api_helper/get_response/get_data.dart';
import 'package:dycca_partner/api_helper/send_reponse/send_reponse.dart';
import 'package:dycca_partner/modal_class/workflow_assignlist_modelclass.dart';
import 'package:dycca_partner/modal_class/workflow_modelclass.dart';

class ViewManageAuditionlistBloc{
  final StreamController<List<Assignworkflow>?> _EventTypeListController = StreamController.broadcast();

  StreamSink<List<Assignworkflow>?> get _EventTypeListSink  => _EventTypeListController.sink;
  Stream<List<Assignworkflow>?> get EventTypeListStream  => _EventTypeListController.stream;

  getManageAuditionList({required roundId}){

    SendData().eventDetailsView(roundId: roundId,onSuccess: (data){
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