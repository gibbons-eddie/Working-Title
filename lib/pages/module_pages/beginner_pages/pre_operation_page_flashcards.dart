import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:senior_project/theme.dart';

class FlashCardsBeginner extends StatelessWidget {
  const FlashCardsBeginner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.darkPurple,
      appBar: AppBar(
        title: const Text('Flashcards'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 4,
          children: <FlipCard>[
            FlipCard(
              fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front.
                direction: FlipDirection.HORIZONTAL, // default
                front: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 150,
                  padding: EdgeInsets.all(10.0),
                  child: Text('pain', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),),
                  color: CustomColors.lightGreen
                ),
                back: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 150,
                  padding: EdgeInsets.all(10.0),
                  child: Text('เจ็บ,  แสบ', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),),
                  color: CustomColors.lightPurple
                ),
              ), //pain
            FlipCard(
              fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front.
              direction: FlipDirection.HORIZONTAL, // default
              front: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 150,
                  padding: EdgeInsets.all(10.0),
                  child: Text('aching', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),),
                  color: CustomColors.lightGreen
              ),
              back: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 150,
                  padding: EdgeInsets.all(10.0),
                  child: Text('ปวด', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),),
                  color: CustomColors.lightPurple
              ),
            ), //aching
            FlipCard(
              fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front.
              direction: FlipDirection.HORIZONTAL, // default
              front: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 150,
                  padding: EdgeInsets.all(10.0),
                  child: Text('numbness', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),),
                  color: CustomColors.lightGreen
              ),
              back: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 150,
                  padding: EdgeInsets.all(10.0),
                  child: Text('เย็นชา', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),),
                  color: CustomColors.lightPurple
              ),
            ), //numbness
            FlipCard(
              fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front.
              direction: FlipDirection.HORIZONTAL, // default
              front: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 150,
                  padding: EdgeInsets.all(10.0),
                  child: Text('inflammation', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),),
                  color: CustomColors.lightGreen
              ),
              back: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 150,
                  padding: EdgeInsets.all(10.0),
                  child: Text('การอักเสบ, บวม', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),),
                  color: CustomColors.lightPurple
              ),
            ), //inflammation
            FlipCard(
              fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front.
              direction: FlipDirection.HORIZONTAL, // default
              front: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 150,
                  padding: EdgeInsets.all(10.0),
                  child: Text('treatment', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),),
                  color: CustomColors.lightGreen
              ),
              back: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 150,
                  padding: EdgeInsets.all(10.0),
                  child: Text('การรักษา', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),),
                  color: CustomColors.lightPurple
              ),
            ), //treatment
            FlipCard(
              fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front.
              direction: FlipDirection.HORIZONTAL, // default
              front: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 150,
                  padding: EdgeInsets.all(10.0),
                  child: Text('procedure', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),),
                  color: CustomColors.lightGreen
              ),
              back: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 150,
                  padding: EdgeInsets.all(10.0),
                  child: Text('การรักษา', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),),
                  color: CustomColors.lightPurple
              ),
            ), //procedure
            FlipCard(
              fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front.
              direction: FlipDirection.HORIZONTAL, // default
              front: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 150,
                  padding: EdgeInsets.all(10.0),
                  child: Text('operation', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),),
                  color: CustomColors.lightGreen
              ),
              back: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 150,
                  padding: EdgeInsets.all(10.0),
                  child: Text('การผ่าตัด', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),),
                  color: CustomColors.lightPurple
              ),
            ), //operation
            FlipCard(
              fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front.
              direction: FlipDirection.HORIZONTAL, // default
              front: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 150,
                  padding: EdgeInsets.all(10.0),
                  child: Text('condition', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),),
                  color: CustomColors.lightGreen
              ),
              back: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 150,
                  padding: EdgeInsets.all(10.0),
                  child: Text('อาการป่วย', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),),
                  color: CustomColors.lightPurple
              ),
            ), //condition
            FlipCard(
              fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front.
              direction: FlipDirection.HORIZONTAL, // default
              front: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 150,
                  padding: EdgeInsets.all(10.0),
                  child: Text('high blood pressure', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),),
                  color: CustomColors.lightGreen
              ),
              back: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 150,
                  padding: EdgeInsets.all(10.0),
                  child: Text('ความดันสูง \n = hypertension', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),),
                  color: CustomColors.lightPurple
              ),
            ), //high blood pressure
            FlipCard(
              fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front.
              direction: FlipDirection.HORIZONTAL, // default
              front: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 150,
                  padding: EdgeInsets.all(10.0),
                  child: Text('anesthetic', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),),
                  color: CustomColors.lightGreen
              ),
              back: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 150,
                  padding: EdgeInsets.all(10.0),
                  child: Text('ยาชา', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),),
                  color: CustomColors.lightPurple
              ),
            ), //anesthetic
            FlipCard(
              fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front.
              direction: FlipDirection.HORIZONTAL, // default
              front: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 150,
                  padding: EdgeInsets.all(10.0),
                  child: Text('sensitive teeth / tingling', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),),
                  color: CustomColors.lightGreen
              ),
              back: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 150,
                  padding: EdgeInsets.all(10.0),
                  child: Text('เสียวฟัน', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),),
                  color: CustomColors.lightPurple
              ),
            ), //sensitive teeth
            FlipCard(
              fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front.
              direction: FlipDirection.HORIZONTAL, // default
              front: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 150,
                  padding: EdgeInsets.all(10.0),
                  child: Text('wisdom teeth', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),),
                  color: CustomColors.lightGreen
              ),
              back: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 150,
                  padding: EdgeInsets.all(10.0),
                  child: Text('ฟันคุด \n = impacted teeth', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),),
                  color: CustomColors.lightPurple
              ),
            ), //wisdom teetch
            FlipCard(
              fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front.
              direction: FlipDirection.HORIZONTAL, // default
              front: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 150,
                  padding: EdgeInsets.all(10.0),
                  child: Text('fracture', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),),
                  color: CustomColors.lightGreen
              ),
              back: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 150,
                  padding: EdgeInsets.all(10.0),
                  child: Text('กระดูกหัก, กระดูกหร้าว', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),),
                  color: CustomColors.lightPurple
              ),
            ), //fracture
            FlipCard(
              fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front.
              direction: FlipDirection.HORIZONTAL, // default
              front: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 150,
                  padding: EdgeInsets.all(10.0),
                  child: Text('roof of your mouth', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),),
                  color: CustomColors.lightGreen
              ),
              back: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 150,
                  padding: EdgeInsets.all(10.0),
                  child: Text('เพดานปาก \n = palate', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),),
                  color: CustomColors.lightPurple
              ),
            ), //roof of your mouth
            FlipCard(
              fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front.
              direction: FlipDirection.HORIZONTAL, // default
              front: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 150,
                  padding: EdgeInsets.all(10.0),
                  child: Text('back teeth', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),),
                  color: CustomColors.lightGreen
              ),
              back: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 150,
                  padding: EdgeInsets.all(10.0),
                  child: Text('ฟันกราม, ฟันกรามใหญ่ \n = molar teeth', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),),
                  color: CustomColors.lightPurple
              ),
            ), //molar teeth / back teeth
            FlipCard(
              fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front.
              direction: FlipDirection.HORIZONTAL, // default
              front: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 150,
                  padding: EdgeInsets.all(10.0),
                  child: Text('front teeth', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),),
                  color: CustomColors.lightGreen
              ),
              back: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 150,
                  padding: EdgeInsets.all(10.0),
                  child: Text('ฟันหน้า, ฟันกรามใหญ่ \n = incisors, canine teeth', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),),
                  color: CustomColors.lightPurple
              ),
            ), //incisor / front teeth
            FlipCard(
              fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front.
              direction: FlipDirection.HORIZONTAL, // default
              front: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 150,
                  padding: EdgeInsets.all(10.0),
                  child: Text('taste bud', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),),
                  color: CustomColors.lightGreen
              ),
              back: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 150,
                  padding: EdgeInsets.all(10.0),
                  child: Text('ต่อมรับรส \n = papillae', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),),
                  color: CustomColors.lightPurple
              ),
            ), //taste bud
            FlipCard(
              fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front.
              direction: FlipDirection.HORIZONTAL, // default
              front: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 150,
                  padding: EdgeInsets.all(10.0),
                  child: Text('tip of your tongue', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),),
                  color: CustomColors.lightGreen
              ),
              back: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 150,
                  padding: EdgeInsets.all(10.0),
                  child: Text('ปลายลิ้น', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),),
                  color: CustomColors.lightPurple
              ),
            ), //tip of your tongue
            FlipCard(
              fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front.
              direction: FlipDirection.HORIZONTAL, // default
              front: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 150,
                  padding: EdgeInsets.all(10.0),
                  child: Text('gap', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),),
                  color: CustomColors.lightGreen
              ),
              back: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 150,
                  padding: EdgeInsets.all(10.0),
                  child: Text('ฟันห่าง \n = diastema', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),),
                  color: CustomColors.lightPurple
              ),
            ), //gap tooth
            FlipCard(
              fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front.
              direction: FlipDirection.HORIZONTAL, // default
              front: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 150,
                  padding: EdgeInsets.all(10.0),
                  child: Text('crowded teeth', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),),
                  color: CustomColors.lightGreen
              ),
              back: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 150,
                  padding: EdgeInsets.all(10.0),
                  child: Text('ฟันเบียด, ฟันเก \n = diastema', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),),
                  color: CustomColors.lightPurple
              ),
            ), //crowded teeth
            FlipCard(
              fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front.
              direction: FlipDirection.HORIZONTAL, // default
              front: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 150,
                  padding: EdgeInsets.all(10.0),
                  child: Text('crooked teeth', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),),
                  color: CustomColors.lightGreen
              ),
              back: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 150,
                  padding: EdgeInsets.all(10.0),
                  child: Text('ฟันเบียด, ฟันเก \n = diastema', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),),
                  color: CustomColors.lightPurple
              ),
            ), //crooked teeth
            FlipCard(
              fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front.
              direction: FlipDirection.HORIZONTAL, // default
              front: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 150,
                  padding: EdgeInsets.all(10.0),
                  child: Text('baby teeth', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),),
                  color: CustomColors.lightGreen
              ),
              back: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 150,
                  padding: EdgeInsets.all(10.0),
                  child: Text('ฟันเด็ก, ฟันน้ำนม \n = milk teeth', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),),
                  color: CustomColors.lightPurple
              ),
            ), //baby teeth

          ],
        )
      ),
    );
  }
}