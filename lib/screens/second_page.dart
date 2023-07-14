import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pretest_km_suitmedia/constant/color.dart';
import 'package:pretest_km_suitmedia/screens/third_page.dart';

class SecondPage extends StatelessWidget {
  static const routeName = '/second-page';

  SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 0, 0, 0),
              offset: Offset(0, 0.1),
              blurRadius: 0.1,
            )
          ]),
          child: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.chevron_left_rounded,
                size: 40,
                color: secondary,
              ),
            ),
            title: Text('Second Screen',
                style: GoogleFonts.poppins(fontWeight: FontWeight.w700)),
            centerTitle: true,
            shadowColor: Colors.black,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 21, vertical: 13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome',
                    style: GoogleFonts.poppins(
                        fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    args["username"] != '' ? args["username"] : "John Doe",
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Text(
              (args["selectedUsername"] != null)
                  ? args["selectedUsername"].toString()
                  : 'Selected Username',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  fontSize: 24, fontWeight: FontWeight.w700),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 32),
              width: MediaQuery.of(context).size.width * 0.95,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primary,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, ThirdPage.routeName,
                        arguments: {'username': args['username']});
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text('Choose a User',
                        style: GoogleFonts.poppins(
                            fontSize: 14, color: onPrimary)),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
