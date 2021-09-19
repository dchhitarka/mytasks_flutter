import 'package:flutter/material.dart';

class ConfirmAlert extends StatelessWidget {
  final onPressed;
  final icon;
  final title;
  final subTitle;
  final nb;
  final leftColor;
  final rightColor;
  ConfirmAlert({
    this.onPressed,
    this.title,
    this.icon,
    this.nb,
    this.subTitle,
    this.leftColor = Colors.black,
    this.rightColor = Colors.blue,
  });
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 2),
                  child: Row(
                    children: <Widget>[
                      icon,
                      SizedBox(width: 8),
                      Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    subTitle,
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                if (nb != null) SizedBox(height: 10),
                if (nb != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      nb,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(
                        height: 45,
                        child: FlatButton(
                          child: Text('No'),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15)),
                          ),
                          color: leftColor,
                          textColor: Colors.white,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 45,
                        child: FlatButton(
                          child: Text('Yes'),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(15)),
                          ),
                          color: rightColor,
                          textColor: Colors.white,
                          onPressed: () {
                            onPressed();
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
