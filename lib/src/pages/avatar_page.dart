import 'package:flutter/material.dart';


class AvatarPage extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        centerTitle: false,
        actions: [

          Container(
            margin: EdgeInsets.only(right: 5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://thispersondoesnotexist.com/image'),
            ),
          ),


          Container(
            margin:EdgeInsets.only(right: 10),
            child: CircleAvatar(
              child: Text('GV'),
              backgroundColor: Colors.blue[100],
            ),
          )

        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage('https://birchtree.nyc3.digitaloceanspaces.com/images/wwdc18/dev-iphone-black.png'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),

        ),),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: (){
          Navigator.pop(context);
        },)
    );
  }
}