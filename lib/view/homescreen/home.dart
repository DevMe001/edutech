
import 'package:elerningapp/controller/object-detector.dart';
import 'package:elerningapp/view/components/custom_card.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edutech',style: TextStyle(color: Color(0xFFFFFFFF))),
        centerTitle: true,
        elevation: 0,
        backgroundColor:  const Color(0xFFFF5757),
      ),
      body: const SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  ExpansionTile(
                    title: Text('Detector'),
                    children: [
                      CustomCard('Object Detection', ObjectDetectorView('abc','alphabet.tflite')),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}