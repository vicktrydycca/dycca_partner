import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

class PayOutPolicyScreen extends StatefulWidget {
  const PayOutPolicyScreen({Key? key}) : super(key: key);

  @override
  State<PayOutPolicyScreen> createState() => _PayOutPolicyScreenState();
}

class _PayOutPolicyScreenState extends State<PayOutPolicyScreen> {
  bool checkboxSelect = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:  FloatingActionButton(
        elevation: 0.0,
        child:  const Icon(Icons.arrow_forward,color: whiteColour,),
        backgroundColor:  primaryColor,
        onPressed: (){
          Navigator.pushNamed(context, '/refundPolicyRoutes');
        },
      ),
      backgroundColor: whiteColour,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColour,
        leading: const Icon(
          Icons.arrow_back_ios,
          color: neutral6Color,
        ),
        title: const Text("Pay out Policy", style: appbarConstFont),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                "The quick, brown fox jumps over a lazy dog. DJs flock by when MTV ax quiz prog. Junk MTV quiz graced by fox whelps. Bawds jog, flick quartz, vex nymphs. Waltz, bad nymph, for quick jigs vex! Fox nymphs grab quick-jived waltz. Brick quiz whangs jumpy veldt fox. Bright vixens jump; dozy fowl quack. Quick wafting zephyrs vex bold Jim. Quick zephyrs blow, vexing daft Jim. Sex-charged fop blew my junk TV quiz. How quickly daft jumping zebras vex. Two driven jocks help fax my big quiz. Quick, Baz, get my woven flax jodhpurs! Now fax quiz Jack! my brave ghost pled. Five quacking zephyrs jolt my wax bed. Flummoxed by job, kvetching W. zaps Iraq. Cozy sphinx waves quart jug of bad milk. A very bad quack might jinx zippy fowls. Few quips galvanized the mock jury box. Quick brown dogs jump over the lazy fox. The jay, pig, fox, zebra, and my wolves quack! Blowzy red vixens fight for a quick jump. Joaquin Phoenix was gazed by MTV for luck. A wizard’s job is to vex chumps quickly in fog. Watch Jeopardy!, Alex Trebeks fun TV quiz game. The quick, brown fox jumps over a lazy dog. DJs flock by when MTV ax quiz prog. Junk MTV quiz graced by fox whelps. Bawds jog, flick quartz, vex nymphs. Waltz",
                style: fontStyle(neutral4Color, FontWeight.w500, 17),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox(value: checkboxSelect, onChanged: (val){
                  checkboxSelect = val!;
                }),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(
                    "I agree to the",
                    style: fontStyle(neutral5Color, FontWeight.w500, 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text(
                    "  Pay out Policy",
                    style: fontStyle(primaryColor, FontWeight.w500, 16),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
