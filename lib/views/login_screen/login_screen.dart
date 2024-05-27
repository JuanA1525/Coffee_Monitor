import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_monitor/services/firebase_service.dart';
import 'package:coffee_monitor/theme/theme_helper.dart';
import 'package:coffee_monitor/views/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key})
      : super(
          key: key,
        );

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.colorFondo,
        body: SafeArea(
          child: Center(
            // Add this
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Add this
              children: [
                Text(
                  "Bienvenido a Coffee Monitor",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32, // Increase the font size
                    fontWeight: FontWeight.bold, // Make the text bold
                    color: appTheme.verdeOscuro, // Add a custom color
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(40),
                  child: TextField(
                    controller: _controller,
                    style: TextStyle(
                      color: appTheme.verdeOscuro,
                    ),
                    cursorColor: appTheme.verdeOscuro,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nombre de la Finca',
                      labelStyle:
                          TextStyle(color: appTheme.verdeOscuro, fontSize: 24),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: appTheme.verdeOscuro),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final name = _controller.text;
                    if (await FirestoreService.instance.doesFincaExist(name)) {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  HomeScreen(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            var begin =
                                Offset(0.0, 1.0); // Start from the bottom
                            var end = Offset.zero; // End at the top
                            var curve = Curves.ease;

                            var tween = Tween(begin: begin, end: end)
                                .chain(CurveTween(curve: curve));

                            return SlideTransition(
                              position: animation.drive(tween),
                              child: child,
                            );
                          },
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                          'No existe ese nombre de Finca en Nuestro Sistema',
                          textAlign: TextAlign.center,
                        )),
                      );
                    }
                  },
                  child: Text(
                    'Ingresar',
                    style: TextStyle(
                        color: appTheme.colorFondo,
                        fontSize: 20), // Make the text a little bigger
                  ),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Color(0xFF364027)),
                    padding: WidgetStatePropertyAll(EdgeInsets.all(15)),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
