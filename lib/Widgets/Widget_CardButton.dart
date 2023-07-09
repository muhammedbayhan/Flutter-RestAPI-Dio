import 'package:flutter/material.dart';

class Widget_CardButton extends StatelessWidget {
  Widget_CardButton(
      {super.key,
      required this.text,
      required this.icon,
      required this.color,
      required this.widget});
  String text;
  IconData icon;
  Color color;
  Widget widget;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: Container(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white),
              ),
              Icon(
                icon,
                color: Colors.white,
                size: 30,
              )
            ],
          )), //
          width: MediaQuery.of(context).size.width * 0.4,
          height: MediaQuery.of(context).size.width * 0.4,
        ),
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => widget, fullscreenDialog: true));
      },
    );
  }
}
