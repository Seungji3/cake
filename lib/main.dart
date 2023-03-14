import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Strawberry cake',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Dessert that is soft and sweet',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          CakeCount(),
        ],
      ),
    );


    Color color = Theme
        .of(context)
        .primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.restaurant_menu, 'Menu'),
        _buildButtonColumn(color, Icons.cake, 'cake'),
        _buildButtonColumn(color, Icons.wallet, 'money'),
      ],
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        'There are two main types of strawberry cake: one made by adding '
            'strawberry powder to the cake batter, which gives the cake a pinkish color, '
            'and another made by adding fresh strawberry pieces directly into the cake'
            'batter, which intensifies the strawberry flavor. '
            'Various ingredients can be used to make strawberry cake, including flour,'
            'baking powder, salt, butter, sugar, eggs, milk, vanilla extract, and fresh strawberries.',
        softWrap: true,
      ),
    );


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
                'Cake showing'
            ),
          ),
        ),
          body: Column(
            children: [
              Image(
                  image: AssetImage('images/cake.jpg'),
                  width: 600,
                  height: 240,
                  fit: BoxFit.cover,
              ),
              titleSection,
              buttonSection,
              textSection
            ],
          ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class CakeCount extends StatefulWidget {
  const CakeCount({Key? key}) : super(key: key);

  @override
  State<CakeCount> createState() => _CakeCountState();
}

class _CakeCountState extends State<CakeCount> {
  bool _isCakeGood = true;
  int cakeGoodCount = 50;

  void onPressed(){
    setState(() {
      if(_isCakeGood){
        cakeGoodCount -= 1;
        _isCakeGood = false;
      }else{
        cakeGoodCount += 1;
        _isCakeGood = true;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: onPressed,
            icon: (_isCakeGood ? Icon(Icons.star) : Icon(Icons.star_border)),
          color: Colors.red,
        ),
        SizedBox(
          width: 18,
          child: SizedBox(
            child: Text('$cakeGoodCount'),
          ),
        ),
      ],
    );
  }
}
