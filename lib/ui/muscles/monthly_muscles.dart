import 'package:flutter/material.dart';

class MonthlyMusclesPage extends StatelessWidget {
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
            hint: Text('3월'),
            underline: Container(),
            // this is the magic
            items: <String>['1월', '2월', '3월', '4월']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String value) {},
          ),
        ),
        Positioned(left: 25, top: 168, child: Text('2', style: TextStyle(fontSize: 50),)),
        Positioned(left: 55, top: 195, child: Text('일 운동했다.', style: TextStyle(fontSize: 20),)),
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
