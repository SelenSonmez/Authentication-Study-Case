import 'package:flutter/material.dart';

class LoginScreenView extends StatelessWidget {
  const LoginScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    // Get device width and height for responsive design
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
          child: Stack(
        children: [
          Container(color: Colors.grey.shade300),

          //Purple header with rounded corners
          Container(
            height: MediaQuery.of(context).size.height / 2.75,
            decoration: const BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25))),
          ),

          //Sign in text
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 130),
            child: Text(
              "Sign In",
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
          ),

          //Form container at the center
          Align(
            alignment: Alignment.center,
            child: Container(
              width: deviceWidth / 1.1,
              height: deviceHeight / 2.5,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(25)),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            label: Text("username"), icon: Icon(Icons.people)),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            label: Text("password"), icon: Icon(Icons.lock)),
                      ),

                      //Sign in button
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple.shade100,
                            minimumSize:
                                Size(deviceWidth / 1.1, deviceHeight / 15)),
                        child: const Text("Sign In"),
                      )
                    ]),
              ),
            ),
          )
        ],
      )),
    );
  }
}
