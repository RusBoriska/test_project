import 'package:flutter/material.dart';

import './my classes.dart';

// Работа с изображениями
class ImageWidget extends StatefulWidget {
  const ImageWidget({Key? key}) : super(key: key);

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  String background = "assets/main.jpg";
  final String cat = "assets/images/cat.jpg";
  final String dog = "assets/images/dog.jpg";
  final String pig = "assets/images/pig.jpg";
  String selected = "";

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
            child: Column(
              children: [
                CustomText('Давайте посмотрим, как выглядят некоторые животные.'),
                GradientButton(label: "Кошка", onTap: ()
                {
                  setState(() {
                    selected = cat;
                  });
                  {Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FullImageWidget(selected: selected)),
                  );
                  };
                }
                ),
                GradientButton(label: "Собака", onTap: ()
                {
                  setState(() {
                    selected = dog;
                  });
                  {Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FullImageWidget(selected: selected)),
                  );
                  };
                }
                ),
                GradientButton(label: "Свинья", onTap: ()
                {
                  setState(() {
                    selected = pig;
                  });
                  {Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FullImageWidget(selected: selected)),
                  );
                  };
                }
                ),
                CustomText('А теперь попробуйте сменить фон. Если вы нажмёте на кнопку "Сменить фон" до того, как выбрали изображение, то получите предупреждение.'),
                GradientButton(label: "Сменить фон", onTap: () {
                  if (selected != "") {
                    setState(() {
                      background = selected;
                    });
                  }
                  else {
                    showTappingAgainDialog(context);
                  }
                }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


//Предупреждение о том, что сначала надо выбрать любое животное
showTappingAgainDialog(BuildContext context) {

  // set up the button
  Widget okButton = Center(
    child: TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop(); // dismiss dialog
      },
    ),
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    content: Text("Сначала выберите одно из животных, пожалуйста."),
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



class FullImageWidget extends StatefulWidget {
  const FullImageWidget({Key? key, required this.selected}) : super(key: key);
  final String selected;

  @override
  State<FullImageWidget> createState() => _FullImageWidgetState();
}

class _FullImageWidgetState extends State<FullImageWidget> {
  // String background = "assets/main.jpg";
  // final String cat = "assets/images/cat.jpg";
  // final String dog = "assets/images/dog.jpg";
  // final String pig = "assets/images/pig.jpg";

  String _selected = "";

  @override
  void initState() {
    super.initState();
    _selected = widget.selected;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(_selected,
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
      ),
    );
  }
}