import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';

class MenuTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: ClayContainer(
            width: 60,
            height: 60,
            borderRadius: 8,
            child: ShaderMask( //色のグラデーションを付ける場合。
              shaderCallback: (Rect bounds) {
                return LinearGradient(begin: Alignment.topCenter,end: Alignment.bottomCenter, colors: [
                  Colors.blueAccent,
                  Color.fromRGBO(16, 255, 0, 100),
                ]).createShader(bounds);
              },
              blendMode: BlendMode.srcATop, //iconの上に上塗り。
              child: Icon(
                Icons.local_pizza,
                color: Colors.white,
                size: 50,
              ),
            ),
          ),
          title: Text('テキスト',style: TextStyle(fontWeight: FontWeight.w700),),
          subtitle: Text('2021/01/05'),
          trailing: Text('¥1000'),
        ),
        ListTile(),
      ],
    );
  }
}
