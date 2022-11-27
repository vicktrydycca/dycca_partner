import 'dart:async';

import 'package:dycca_partner/api_helper/api_widgets/api_loader.dart';
import 'package:dycca_partner/api_helper/get_response/get_data.dart';
import 'package:dycca_partner/modal_class/workflow_modelclass.dart';

class ManageAuditionWorkFlowBloc{
  final StreamController<List<Workflow>> _EventTypeListController = StreamController.broadcast();
  final StreamController<List<String>> _judgesListController = StreamController.broadcast();


  List<String> auditionList = [];

  StreamSink<List<Workflow>> get _EventTypeListSink  => _EventTypeListController.sink;
  Stream<List<Workflow>> get EventTypeListStream  => _EventTypeListController.stream;
  Stream<List<String>> get judgesList  => _judgesListController.stream;
  StreamSink<List<String>> get judgesListSink  => _judgesListController.sink;
  getEventCategoryList(){

    GetData().getManageAuditionHomepage(onSuccess: (data){
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