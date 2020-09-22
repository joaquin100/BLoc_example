import 'package:bloc_example/BlocImage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final _blocimage = BlocProvider.of<BlocImage>(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.network(
            "https://raw.githubusercontent.com/felangel/bloc/master/docs/assets/flutter_bloc_logo_full.png",
            width: 250,
            height: 200,
          ),
          Text(
            "Flutter Bloc Example",
            style: TextStyle(fontStyle: FontStyle.italic, fontSize: 30),
          ),
          BlocBuilder<BlocImage, String>(
            builder: (BuildContext context, String urlstate) {
              return Image.network(
                urlstate,
                width: 200,
                height: 200,
              );
            },
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text("Get  Image"),
                color: Colors.blue[700],
                onPressed: () {
                  _blocimage.add(ImageEvent.getImage);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
