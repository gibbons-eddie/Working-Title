import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:senior_project/theme.dart';

class FlashCardsBeginnerPost extends StatelessWidget {
  const FlashCardsBeginnerPost({Key? key}) : super(key: key);

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
          crossAxisCount: 1,
          children: <FlipCard>[
            FlipCard(
              fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front.
              direction: FlipDirection.HORIZONTAL, // default
              front: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 150,
                  padding: EdgeInsets.all(10.0),
                  child: Text('painkiller', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),),
                  color: CustomColors.lightGreen
              ),
              back: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 150,
                  padding: EdgeInsets.all(10.0),
                  child: Text('ยาแก้ปวด', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),),
                  color: CustomColors.lightPurple
              ),
            ), //painkiller
            FlipCard(
              fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front.
              direction: FlipDirection.HORIZONTAL, // default
              front: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 150,
                  padding: EdgeInsets.all(10.0),
                  child: Text('side effect', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),),
                  color: CustomColors.lightGreen
              ),
              back: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 150,
                  padding: EdgeInsets.all(10.0),
                  child: Text('ผลข้างเคียง, อาการหลังผ่าตัด', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),),
                  color: CustomColors.lightPurple
              ),
            ), //side effect
            FlipCard(
              fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front.
              direction: FlipDirection.HORIZONTAL, // default
              front: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 150,
                  padding: EdgeInsets.all(10.0),
                  child: Text('symptom', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),),
                  color: CustomColors.lightGreen
              ),
              back: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 150,
                  padding: EdgeInsets.all(10.0),
                  child: Text('อาการ, อาการก่อนผ่าตัด', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),),
                  color: CustomColors.lightPurple
              ),
            ), //symptom
            FlipCard(
              fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front.
              direction: FlipDirection.HORIZONTAL, // default
              front: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 150,
                  padding: EdgeInsets.all(10.0),
                  child: Text('medicine', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),),
                  color: CustomColors.lightGreen
              ),
              back: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 150,
                  padding: EdgeInsets.all(10.0),
                  child: Text('ยา \n = medication', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),),
                  color: CustomColors.lightPurple
              ),
            ), //medicine
            FlipCard(
              fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front.
              direction: FlipDirection.HORIZONTAL, // default
              front: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 150,
                  padding: EdgeInsets.all(10.0),
                  child: Text('medication', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),),
                  color: CustomColors.lightGreen
              ),
              back: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 150,
                  padding: EdgeInsets.all(10.0),
                  child: Text('ยา \n = medicine', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),),
                  color: CustomColors.lightPurple
              ),
            ), //medication
            FlipCard(
              fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front.
              direction: FlipDirection.HORIZONTAL, // default
              front: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 150,
                  padding: EdgeInsets.all(10.0),
                  child: Text('regularly', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),),
                  color: CustomColors.lightGreen
              ),
              back: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 150,
                  padding: EdgeInsets.all(10.0),
                  child: Text('สม่ำเสมอ', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),),
                  color: CustomColors.lightPurple
              ),
            ), //regularly
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