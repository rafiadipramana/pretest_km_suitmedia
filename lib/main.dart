import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pretest_km_suitmedia/constant/color.dart';
import 'package:pretest_km_suitmedia/screens/second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _sentencesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _sentencesController = TextEditingController();
    _usernameController = TextEditingController();
  }

  bool checkPalindrome(String sentences) {
    sentences = sentences.replaceAll(" ", "");
    int length = sentences.length;
    int divideByTwo = (length / 2).floor();
    String beginData;
    String endData;

    if (length % 2 != 0) {
      beginData = sentences.substring(0, divideByTwo);
      endData = sentences.substring(divideByTwo + 1, length);
    } else {
      beginData = sentences.substring(0, divideByTwo);
      endData = sentences.substring(divideByTwo, length);
    }

    endData = endData.split('').reversed.join('');

    return beginData == endData;
  }

  @override
  void dispose() {
    _sentencesController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.asset('assets/background@3x.png')),
            ),
            Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/ic_photo@3x.png',
                    width: 116,
                  ),
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 51),
                        width: MediaQuery.of(context).size.width * 0.95,
                        child: TextField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                              labelText: 'Name',
                              labelStyle: GoogleFonts.poppins(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 8),
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12))),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 22),
                        width: MediaQuery.of(context).size.width * 0.95,
                        child: TextField(
                          controller: _sentencesController,
                          decoration: InputDecoration(
                              labelText: 'Palindrome',
                              labelStyle: GoogleFonts.poppins(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 8),
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12))),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 45),
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
                              if (_sentencesController.text != '') {
                                bool isPalindrome =
                                    checkPalindrome(_sentencesController.text);
                                isPalindrome
                                    ? showDialog(
                                        context: context,
                                        builder: (_) => AlertDialog(
                                          title: Text(
                                            'Check Palindrome',
                                            style: GoogleFonts.poppins(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          content: Text(
                                            'The sentence is Palindrome',
                                            style: GoogleFonts.poppins(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context, 'OK'),
                                              child: Text('OK',
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700)),
                                            ),
                                          ],
                                        ),
                                      )
                                    : showDialog(
                                        context: context,
                                        builder: (_) => AlertDialog(
                                          title: Text(
                                            'Check Palindrome',
                                            style: GoogleFonts.poppins(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          content: Text(
                                            'The sentence is not Palindrome',
                                            style: GoogleFonts.poppins(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context, 'OK'),
                                              child: Text('OK',
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700)),
                                            ),
                                          ],
                                        ),
                                      );
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Text('CHECK',
                                  style: GoogleFonts.poppins(
                                      fontSize: 14, color: onPrimary)),
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SecondPage(
                                          userName: _usernameController.text)));
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Text('NEXT',
                                  style: GoogleFonts.poppins(
                                      fontSize: 14, color: onPrimary)),
                            )),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
