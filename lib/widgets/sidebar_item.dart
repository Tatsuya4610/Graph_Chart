import 'package:flutter/material.dart';
import 'package:graph_chart_flutter/styleguide/text_styles.dart';

class SidebarItem extends StatelessWidget {
  final bool isSelected;
  final String text;
  final Function onTap;

  const SidebarItem({Key key, this.isSelected, this.text, this.onTap}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -1.58, //文字の向き。
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: <Widget>[
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              height: 6,
              width: 6,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? Colors.white : Colors.transparent,
              ),
            ),
            AnimatedDefaultTextStyle(
                child: Text(text),
                style: isSelected ? selectedTabStyle : defaultTabStyle,
                duration: Duration(milliseconds: 200),
            )
          ],
        ),
      ),
    );
  }
}

