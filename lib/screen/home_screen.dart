import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:graph_chart_flutter/widgets/chart.dart';
import 'package:graph_chart_flutter/widgets/sidbar.dart';

final data = [55.0, 90.0, 50.0, 40.0, 35.0, 70.0, 100.0];

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 60,
                ),
                Text(
                  'Flutter',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'グラフチャート',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: ClayContainer(
                    //Dartパッケージ
                    height: 300,
                    width: width * 0.8,
                    depth: 12,
                    spread: 12,
                    borderRadius: 15,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                            right: 15,
                            top: 15,
                          ),
                          child: Text(
                            'チャート',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Text(
                            '1000',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Chart(data: data),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ClayContainer(
                      //Dartパッケージ
                      height: 180,
                      width: width * 0.35,
                      emboss: true, //奥行き。影。
                      borderRadius: 15,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 15,
                              right: 15,
                              top: 15,
                            ),
                            child: Text(
                              'チャート',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.black45,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Text(
                              '100',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24,
                                  color: Colors.black45),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ClayContainer(
                      //Dartパッケージ
                      height: 180,
                      width: width * 0.35,
                      emboss: true, //奥行き。影。
                      borderRadius: 15,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 15,
                              right: 15,
                              top: 15,
                            ),
                            child: Text(
                              'チャート',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.black45,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Text(
                              '100',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24,
                                  color: Colors.black45),
                            ),
                          ),
                          Spacer(),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              margin: EdgeInsets.only(bottom: 16, right: 16),
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.blueAccent,
                                    Color.fromRGBO(16, 255, 0, 100),
                                  ],
                                ),
                              ),
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '2020/01',
                        style: TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '¥1000',
                        style: TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
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
                )
              ],
            ),
          ),
        ),
      ),
      endDrawer: Sidebar(), //スワイプすると表示される。
    );
  }
}
