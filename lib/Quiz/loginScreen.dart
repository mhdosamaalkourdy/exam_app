import 'package:flutter/material.dart';

import 'package:quiz_app/Quiz/test.dart';
import 'package:quiz_app/config/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController name = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text(core.get<SharedPreferences>().getString('name')?? ''),),

      body: Stack(
        children: [
          // Background circles
          const Positioned(
              top: -25, 
              child: Image(image: AssetImage("assets/a.png"))),
          const Positioned(
              left: 40,
              bottom: 450,
              child: Image(image: AssetImage("assets/b.png"))),
          const Positioned(
              bottom: -5,
              right: -5,
              child: Image(image: AssetImage("assets/c.png"))),
      
          Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                const Text(
                  'LOGIN',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff914576),
                  ),
                ),
                const SizedBox(height: 175),
                Container(
                  width: MediaQuery.sizeOf(context).width * .85,
                  height: 50,
                  child: TextField(
                    controller: name,
                    style: const TextStyle(
                        color: Color(0xff914576),
                        fontSize: 15,
                        fontWeight: FontWeight.w300),
                    decoration: InputDecoration(
                      prefixIcon: const Padding(
                          padding: EdgeInsets.only(left: 20.0, right: 15),
                          child: Icon(Icons.email, color: Color(0xff914576))),
                      hintText: 'user@gmail.com',
                      contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                      hintStyle: const TextStyle(
                          color: Color(0xff914576),
                          fontWeight: FontWeight.w300,
                          fontSize: 15),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Color(0xff914576),
                          width: 2.0, // Set the border width to 2.0
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Color(0xff914576),
                          width: 2.0, // Set the border width to 2.0
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Container(
                  width: MediaQuery.sizeOf(context).width * .85,
                  child: TextField(
                    style: const TextStyle(
                      color: Color(0xff914576),
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                    ),
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(left: 20.0, right: 10.0),
                        // Adjust the padding as needed
                        child: Icon(
                          Icons.lock,
                          color: Color(0xff914576),
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                      // Adjust as needed
                      hintStyle: const TextStyle(
                        color: Color(0xff914576),
                        fontWeight: FontWeight.w300,
                        fontSize: 15,
                      ),
                      hintText: 'P.W',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Color(0xff914576),
                          width: 2.0, // Set the border width to 2.0
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        // Adjust as needed
                        borderSide: const BorderSide(
                          color: Color(0xff914576),
                          width: 2.0, // Set the border width to 2.0
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Container(
                  width: MediaQuery.sizeOf(context).width * .85,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: const LinearGradient(
                      colors: [Color(0xffDA8BD9), Color(0xffF3BD6B)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      core.get<SharedPreferences>().setString('name', name.text);

                      core.get<SharedPreferences>().setString('pass', password.text);

                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Quiz(),
                          ));
                    },
                    style: ElevatedButton.styleFrom(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'LOGIN',
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
