import 'package:elerningapp/controller/object-detector.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class FlexibleLayout extends StatelessWidget {
  const FlexibleLayout({super.key});

  void _shareContent() {
    Share.share(
        'Check out this cool app! https://www.terabox.com/sharing/link?surl=ooJ9fLJjW14F-RpALa8y_A');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Center(
                child: Text(
              'Edu Tech',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            foregroundColor: Colors.white,
            backgroundColor: Colors.red,
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(10),
                              color: const Color.fromARGB(127, 255, 87, 87),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ObjectDetectorView(
                                                'Alphabet', 'abc.tflite')),
                                  );
                                },
                                child: Image.asset(
                                  'assets/images/boxes/1.png',
                                  fit: BoxFit
                                      .cover, // Ensures the image fits within the container
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                            height: 10,
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(10),
                              color: const Color.fromARGB(115, 86, 162, 243),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ObjectDetectorView(
                                                  'Numbers', 'num.tflite')));
                                },
                                child: Image.asset(
                                  'assets/images/boxes/2.png',
                                  fit: BoxFit
                                      .cover, // Ensures the image fits within the container
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 100,
                      height: 10,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(10),
                              color: const Color.fromARGB(113, 70, 201, 94),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ObjectDetectorView(
                                                  'Colors', 'colors.tflite')));
                                },
                                child: Image.asset(
                                  'assets/images/boxes/3.png',
                                  fit: BoxFit
                                      .cover, // Ensures the image fits within the container
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                            height: 10,
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(10),
                              color: const Color.fromARGB(116, 252, 208, 62),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ObjectDetectorView('Shapes',
                                                  'shapenew.tflite')));
                                },
                                child: Image.asset(
                                  'assets/images/boxes/4.png',
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                      height: 50,
                    ),
                    Center(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          _shareContent();
                        },
                        icon: const Icon(Icons.share, color: Colors.red),
                        label: const Text('Share'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            color: Colors.blue, // Change the color to fit your app's design
            child: Container(
              alignment: Alignment.center,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Published © 2024',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.white)),
                ],
              ),
            ),
          ),
        ));
  }
}
