import 'package:flutter/material.dart';

class SlidingAnimation extends StatefulWidget {
  @override
  _SlidingAnimationState createState() => _SlidingAnimationState();
}

class _SlidingAnimationState extends State<SlidingAnimation> with SingleTickerProviderStateMixin{

  late AnimationController _controller;
  late Animation<Offset> _myAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _myAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(1.5, 0.0),

    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticIn,
    ));
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

      body: Center(
        child:
        SlideTransition(
          position: _myAnimation,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: FlutterLogo(size: 150.0),
          ),
        ),
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
