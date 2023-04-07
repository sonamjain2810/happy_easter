import 'package:flutter/material.dart';
import '../utils/SizeConfig.dart';

class MessageWidget1 extends StatelessWidget {
  const MessageWidget1({
    Key? key,
    required this.headLine,
    required this.subTitle,
    required this.imagePath,
    required this.color,
  }) : super(key: key);

  final String headLine;
  final String subTitle;
  final String imagePath;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: SizeConfig.width(10.0)),
      child: Container(
        width: SizeConfig.width(250),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(SizeConfig.width(5))),
          boxShadow: [
            BoxShadow(
              offset: Offset(4, 4),
              blurRadius: 3,
              color: Colors.grey.withOpacity(0.50),
            )
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(SizeConfig.width(10.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Item1 with two Text
              Container(
                width: SizeConfig.width(180),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      headLine,
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      subTitle,
                      style: Theme.of(context).textTheme.subtitle2,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              // Item2
              Container(
                height: SizeConfig.height(50),
                width: SizeConfig.width(50),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      imagePath,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
