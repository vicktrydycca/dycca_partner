import 'package:dycca_partner/bloc_controllers/event_history_bloc.dart';
import 'package:dycca_partner/bloc_controllers/event_live_bloc.dart';
import 'package:dycca_partner/modal_class/event_info_modelclass.dart';
import 'package:dycca_partner/screens/manage_audition/manage_audtion_tabbar.dart';
import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../../modal_class/event_history_modalclass.dart';

class EventHistoryScreen extends StatefulWidget {
  const EventHistoryScreen({Key? key}) : super(key: key);

  @override
  State<EventHistoryScreen> createState() => _EventHistoryScreenState();
}

class _EventHistoryScreenState extends State<EventHistoryScreen> {
  final _bloc = EventHistoryBloc();

  @override
  void initState() {
    // TODO: implement initState
    _bloc.getEventCategoryList();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: StreamBuilder<List<Event>>(
          stream: _bloc.EventListStream,
          builder: (context, snapshot) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ManageAuditionTabbar()));
                        },
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/profile.jpg",
                                        height: 50,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 5.0),
                                        child: Text(
                                          snapshot.data?[index].mcat.typeName ??
                                              "",
                                          style: fontStyle(neutral6Color,
                                              FontWeight.w500, 14),
                                        ),
                                      ),

                                      // Row(
                                      //   mainAxisAlignment: MainAxisAlignment.center,
                                      //   crossAxisAlignment: CrossAxisAlignment.center,
                                      //   children: [
                                      //     const Icon(Icons.inventory_2,size: 15,color: primaryColor,),
                                      //     Padding(
                                      //       padding: const EdgeInsets.only(left: 8.0,top: 2),
                                      //       child: Text(
                                      //         "Product",
                                      //         style: fontStyle(neutral6Color, FontWeight.w400, 14),
                                      //       ),
                                      //     ),
                                      //   ],
                                      // ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Expanded(
                                              flex: 1,
                                              child: Icon(
                                                Icons.calendar_month,
                                                size: 20,
                                                color: primaryColor,
                                              )),
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                              "Date",
                                              style: fontStyle(neutral6Color,
                                                  FontWeight.w500, 14),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 4,
                                            child: Text(
                                              snapshot.data?[index].startDate
                                                      .toString()
                                                      .split(" ")
                                                      .first ??
                                                  "",
                                              style: fontStyle(neutral5Color,
                                                  FontWeight.w400, 14),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 5.0),
                                        child: Row(
                                          children: [
                                            const Expanded(
                                                flex: 1,
                                                child: Icon(
                                                  Icons.event_available,
                                                  size: 20,
                                                  color: primaryColor,
                                                )),
                                            Expanded(
                                              flex: 2,
                                              child: Text(
                                                "Event name",
                                                style: fontStyle(neutral6Color,
                                                    FontWeight.w500, 14),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 4,
                                              child: Text(
                                                snapshot.data?[index]
                                                        .eventName ??
                                                    "",
                                                style: fontStyle(neutral5Color,
                                                    FontWeight.w400, 14),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5.0),
                                        child: Row(
                                          children: [
                                            const Expanded(
                                                flex: 1,
                                                child: Icon(
                                                  Icons.article,
                                                  size: 20,
                                                  color: primaryColor,
                                                )),
                                            Expanded(
                                              flex: 2,
                                              child: Text(
                                                "Event type",
                                                style: fontStyle(neutral6Color,
                                                    FontWeight.w500, 14),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 4,
                                              child: Text(
                                                snapshot.data?[index].subcat
                                                        .typeName ??
                                                    "",
                                                style: fontStyle(neutral5Color,
                                                    FontWeight.w400, 14),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      // Row(
                                      //   children: [
                                      //     const Expanded(
                                      //         flex: 1,
                                      //         child: Icon(Icons.attach_money,size: 20,color: primaryColor,)),
                                      //     Expanded(
                                      //       flex: 2,
                                      //       child: Text(
                                      //         "Paid",
                                      //         style: fontStyle(neutral6Color, FontWeight.w500, 14),
                                      //       ),
                                      //     ),
                                      //     Expanded(
                                      //       flex: 4,
                                      //       child: Text(
                                      //         "INR 500",
                                      //         style: fontStyle(neutral5Color, FontWeight.w400, 14),
                                      //       ),
                                      //     ),
                                      //   ],
                                      // )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: const Divider(
                                thickness: 1,
                              ),
                            )
                          ],
                        ),
                      ),
                    ));
          }),
    );
  }
}
