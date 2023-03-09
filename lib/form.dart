import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Работа с формами и диалоговыми окнами
class FormWidget extends StatefulWidget {
  const FormWidget({Key? key}) : super(key: key);

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  String background = "assets/main.jpg";
  String name = "";
  String age = "";
  String comment = "";

  // @override
  // void initState() {
  //   super.initState();
  //   name = widget.name;
  //   age = widget.age;
  //   comment = widget.comment;
  // }


  // Сохранение введённых значений
  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('name', name);
    prefs.setString('age', age);
    prefs.setString('comment', comment);
  }


  //Сообщение о том, что введённые данные сохранены
  showTappingAgainDialog(BuildContext context) {

    // set up the button
    Widget okButton = Center(
      child: TextButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.of(context).pop(); // dismiss dialog
          // Navigator.pop(context);
        },
      ),
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: Text("Спасибо за ваше мнение. Я вас запомнил."),
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


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(background),
                  fit: BoxFit.cover)),
          child: Center(
            child: Form(
              key: _formKey,
              child: ListView(
                padding: EdgeInsets.all(10.0),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: nameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Введите ваше имя';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Ваше имя',
                        prefixIcon: Icon(Icons.person),
                        // suffixIcon: Icon(
                        //   Icons.delete_outline,
                        //   color: Colors.red,
                        // ),
                        hintText: "Введите ваше имя",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(color: Colors.black, width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(color: Colors.blue, width: 2.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(color: Colors.red, width: 2.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                          BorderSide(color: Colors.deepOrangeAccent, width: 2.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: ageController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Введите свою оценку моего скромного труда';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Ваша оценка',
                        hintText: "Введите оценку моего скромного труда",
                        prefixIcon: Icon(Icons.star),
                        // suffixIcon: Icon(
                        //   Icons.delete_outline,
                        //   color: Colors.red,
                        // ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(color: Colors.black, width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(color: Colors.blue, width: 2.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(color: Colors.red, width: 2.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                          BorderSide(color: Colors.deepOrangeAccent, width: 2.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: commentController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Введите ваш комменатрий';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Ваш комменатрий',
                        prefixIcon: Icon(Icons.textsms),
                        // suffixIcon: Icon(
                        //   Icons.delete_outline,
                        //   color: Colors.red,
                        // ),
                        hintText: "Введите ваш комменатрий",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(color: Colors.black, width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(color: Colors.blue, width: 2.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(color: Colors.red, width: 2.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                          BorderSide(color: Colors.deepOrangeAccent, width: 2.0),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        name = nameController.text;
                        age = ageController.text;
                        comment = commentController.text;;
                        showTappingAgainDialog(context);
                        nameController.clear();
                        ageController.clear();
                        commentController.clear();;
                        _saveData();
                      }
                    },
                    child: Text("Отправить"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}