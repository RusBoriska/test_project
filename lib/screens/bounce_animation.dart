import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BounceAnimation extends StatefulWidget {
  @override
  _BounceAnimationState createState() => _BounceAnimationState();

}

class _BounceAnimationState extends State<BounceAnimation> with SingleTickerProviderStateMixin{

  late AnimationController _controller;
  late Animation<double> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    _slideAnimation = Tween(begin: 200.0, end: 120.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 1.0, curve: Curves.elasticIn),
      ),
    )..addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _controller.repeat(reverse: true);
      }
    });

  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Animations"),
      ),

      body:
      AnimatedBuilder(animation: _slideAnimation,
          builder: (ctx, ch) =>  Container(
            width: 100,
            height: 100,
            margin: EdgeInsets.only(
                top: _slideAnimation.value,
                left: 150
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/bounce-ball.png',
                    )
                )
            ),
          )
      ),



      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerFloat,

      floatingActionButton:
      FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: (){
          _controller.forward();
        },
      ),
    );
  }
}
