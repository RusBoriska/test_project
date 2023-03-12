import 'package:flutter/material.dart';
import 'dart:io';


//Моя кнопка
class GradientButton extends StatelessWidget {
  const GradientButton({Key? key, required this.label, required this.onTap}) : super(key: key);
  final String label;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            gradient: LinearGradient(
              colors: <Color>[
                Color(0xFF0D47A1),
                Color(0xFF1976D2),
                Color(0xFF42A5F5),
              ],
            ),
          ),
          child: Text(label, style: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.normal, decoration: TextDecoration.none),),
        ),
      ),
    );
  }
}


//Мой текст
class CustomText extends StatelessWidget {
  final String text;

  const CustomText(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          backgroundColor: Colors.yellow
      ),
    );
  }
}


//Сообщение о доступе в Интернет
class MyInternetDialogHandler {
  showInternetDialog(BuildContext context, String text) {
    // set up the button
    Widget okButton = Center(
      child: TextButton(
        child: const Text("OK"),
        onPressed: () {
          Navigator.of(context).pop(); // dismiss dialog
        },
      ),
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: Text(text),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}


//Проверка Интернет-соединения
class CheckUserConnection {

  Future checkInternetAvailability() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
  }
}