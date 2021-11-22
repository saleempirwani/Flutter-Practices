import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My First App'),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Center(
          child: ElevatedButton.icon(
        onPressed: () {},
        onLongPress: () {
          print('you long pressed it');
        },
        icon: Icon(Icons.mail),
        label: Text('Mail me'),
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.amberAccent),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.black)),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}


// Icons
// body: Center(
//           child: Icon(
//         Icons.car_rental,
//         color: Colors.blue,
//         size: 30,
//       )),


// Image
//  body: Center(
//         child: Image.asset('assets/images/image.jpg') 
        
//         Image(
//             image: NetworkImage(
//                 'https://images.unsplash.com/photo-1637090560884-d383467a645e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=669&q=80')),
//         child: Text('Hello World',
//             style: TextStyle(
//                 fontFamily: 'IndieFlower',
//                 fontSize: 25,
//                 color: Colors.grey)),
//       ),
