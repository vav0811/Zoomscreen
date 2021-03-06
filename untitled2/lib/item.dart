import 'package:flutter/material.dart';

class itemPage extends StatefulWidget {
  @override
  _itemPageState createState() => _itemPageState();
}

List<String> image = ['assets/images/bag1.jpeg', 'assets/images/bag2.jpeg', 'assets/images/bag3.jpeg', 'assets/images/bag4.jpeg'];

class _itemPageState extends State<itemPage> {
  String _currentImage = image[0];
  final TransformationController _controller = TransformationController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'MCEC',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Bag',
                style: TextStyle(fontSize: 18),
              ),
              Expanded(
                child: InteractiveViewer(
                  transformationController: _controller,
                  maxScale: 5.0,
                  child: Image.asset(_currentImage),
                ),
              ),
              Container(
                height: 80,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: image.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            _currentImage = image[index];
                            _controller.value = Matrix4.identity();
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          padding: const EdgeInsets.all(2),
                          color: Colors.red,
                          child: Image.asset(image[index]),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
