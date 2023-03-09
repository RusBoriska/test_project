import 'package:flutter/material.dart';

import './my classes.dart';
import './screens/bounce_animation.dart';
import './screens/fade_animation.dart';
import './screens/flip_animation.dart';
import './screens/hinge_animation.dart';
import './screens/pulse_animation.dart';
import './screens/sliding_animation.dart';


// Работа с анимацией
class AnimationWidget extends StatelessWidget {
  const AnimationWidget({Key? key}) : super(key: key);

  final String background = "assets/main.jpg";

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
                CustomText('Давайте посмотрим на разные виды анимации.'),
                GradientButton(label: "Прыгающий мяч", onTap: ()
                {
                  {Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BounceAnimation()),
                  );
                  };
                }
                ),
                GradientButton(label: "Появляющийся призрак", onTap: ()
                {
                  {Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FadeAnimation()),
                  );
                  };
                }
                ),
                GradientButton(label: "Переворачивающаяся карточка", onTap: ()
                {
                  {Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FlipAnimation()),
                  );
                  };
                }
                ),
                GradientButton(label: "Падающий текст", onTap: ()
                {
                  {Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HingeAnimation()),
                  );
                  };
                }
                ),
                GradientButton(label: "Пульсирующее сердце", onTap: ()
                {
                  {Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PulseAnimation()),
                  );
                  };
                }
                ),
                GradientButton(label: "Скользящий логотип", onTap: ()
                {
                  {Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SlidingAnimation()),
                  );
                  };
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