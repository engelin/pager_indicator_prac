import 'package:flutter/material.dart';

class DailyMusclesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        SizedBox(
          height: 800,
          width: 400,
        ),
        Positioned(
          left: 70,
          top: 149,
          child: DropdownButton<String>(
            icon: Icon(
              Icons.arrow_drop_down_rounded,
              color: Colors.blueAccent,
            ),
            iconSize: 35.0,
            style: TextStyle(fontSize: 20, color: Colors.black45,),
            elevation: 0,
            hint: Text('3월 29일'),
            underline: Container(),
            // this is the magic
            items: <String>['1일', '2일', '3일', '4일']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String value) {},
          ),
        ),
        Positioned(left: 25, top: 168, child: Text('1', style: TextStyle(fontSize: 50),)),
        Positioned(left: 55, top: 195, child: Text('회 운동했다.', style: TextStyle(fontSize: 20),)),
        // Positioned(
        //   left: 10,
        //   top: 100,
        //   child: CMBDropDownBtn(
        //     workoutNum: <String>['Test1', 'Test2', 'Test3'],
        //   ),
        // ),
        // Positioned(
        //   left: 0,
        //   top: 100,
        //   child: Card(
        //     child: Text(
        //       '3월00일\n개\n완료했다.',
        //       style: TextStyle(fontSize: 50),
        //       textAlign: TextAlign.right,
        //     ),
        //   ),
        // ),
        // Positioned(
        //   right: 0,
        //   child: SizedBox(
        //     height: 400,
        //     child: Image(
        //       image: AssetImage('assets/images/asdf.png'),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
