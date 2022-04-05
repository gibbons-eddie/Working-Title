import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:senior_project/theme.dart';

class TitleBar extends StatelessWidget {
  final String title;

  const TitleBar(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // container to add shadow
    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
          color: Color.fromARGB(45, 0, 0, 0),
          blurRadius: 10.0,
          offset: Offset(0.0, 5.0),
        )
      ]),
      // sizedbox to span screen
      child: SizedBox(
        width: double.infinity,
        height: 120,

        // stack to place image/logo on top of bar
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            // bar with text
            SizedBox(
              width: double.infinity,
              height: 65,
              child: Container(
                alignment: Alignment.centerLeft,
                color: CustomColors.lightGray,
                padding: const EdgeInsets.only(left: 156),
                child: Text(
                  title,
                  style: GoogleFonts.lexend(
                      fontSize: 36, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            // logo/image
            CircleAvatar(
              //padding: const EdgeInsets.only(left: 28),
              radius: 70,
              backgroundColor: Colors.teal,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/Logo.PNG'),
                radius: 50,
              ),
            ),
            // Container(
            //   padding: const EdgeInsets.only(left: 28),
            //   decoration: BoxDecoration(
            //       border: Border.all(
            //         color: const Color(0xFF61C791),
            //       ),
            //       borderRadius: BorderRadius.all(Radius.circular(50))
            //     ),
            //   child: const Image(
            //     image: AssetImage('assets/images/logo.png'),
            //
            //   ),
            //),
          ],
        ),
      ),
    );
  }
}
