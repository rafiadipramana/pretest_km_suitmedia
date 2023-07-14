import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pretest_km_suitmedia/constant/color.dart';
import 'package:http/http.dart' as http;
import 'package:pretest_km_suitmedia/screens/second_page.dart';

class ThirdPage extends StatefulWidget {
  static const routeName = '/third-page';

  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  Future<Map<String, dynamic>> fetchData() async {
    final response = await http
        .get(Uri.parse('https://reqres.in/api/users?page=1&per_page=10'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 0, 0, 0),
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
            title: Text('Third Screen',
                style: GoogleFonts.poppins(fontWeight: FontWeight.w700)),
            centerTitle: true,
            shadowColor: Colors.black,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 15),
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: FutureBuilder<Map<String, dynamic>>(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text("Error Fetch"));
            } else {
              final responseData = snapshot.data!;
              final List<dynamic> itemList = responseData['data'];

              return ListView.builder(
                itemCount: itemList.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = itemList[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, SecondPage.routeName,
                          arguments: {
                            'username': args['username'],
                            'selectedUsername':
                                '${item['first_name']} ${item['last_name']}'
                          });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(width: 0.2, color: Colors.grey)),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(item['avatar']),
                          radius: 40,
                        ),
                        title: Text(
                            '${item['first_name']} ${item['last_name']}',
                            style: GoogleFonts.poppins(
                                fontSize: 16, fontWeight: FontWeight.w600)),
                        subtitle: Text(item['email'].toString().toUpperCase(),
                            style: GoogleFonts.poppins(
                                fontSize: 12, fontWeight: FontWeight.w400)),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
