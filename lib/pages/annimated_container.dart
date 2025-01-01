import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'detail_page.dart';

class AnnimatedContainer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Annimation"),
      ),

      body: Container(
        child: InkWell(
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPage(),
                ),
            );
          },
          child: Hero(
              tag: 'background',
              child: Image.asset('assets/images/house_photo.jpg',
                height: 100,
                width: 100,)
          ),
        ),
      )
    );
  }

}