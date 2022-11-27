import 'package:dycca_partner/bloc_controllers/eventtype_details_bloc.dart';
import 'package:dycca_partner/modal_class/event_type_details_modalclass.dart';
import 'package:dycca_partner/screens/manage_audition/customizeAudition.dart';
import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

class ManageAuditionHomePage extends StatefulWidget {
  const ManageAuditionHomePage({Key? key}) : super(key: key);

  @override
  State<ManageAuditionHomePage> createState() => _ManageAuditionHomePageState();
}

class _ManageAuditionHomePageState extends State<ManageAuditionHomePage> {
  EventTypeDetailsBloc _bloc = EventTypeDetailsBloc();

  @override
  void initState() {
    // TODO: implement initState
    _bloc.getEventCategoryList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: managerAudition(),
    );
  }

  managerAudition() {
    return StreamBuilder<List<EventRound>>(
        stream: _bloc.EventTypeListStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {return

                  Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                         CustomizeAudition()));
                          },
                          title: Text(
                            snapshot.data?[index].round.toString() ?? "",
                            style: appFontStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          trailing: Container(
                            width: 100,
                            height: 50,
                            decoration: BoxDecoration(color: primaryColor),
                            child: Center(
                              child: Text(
                                "Customize",
                                style: appFontStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Divider()
                      ],
                    );});
          } else {
            return Center(
              child: CircularProgressIndicator(
                strokeWidth: 0.9,
              ),
            );
          }
        });
  }
}
