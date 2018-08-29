// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester utility that Flutter
// provides. For example, you can send tap and scroll gestures. You can also use WidgetTester to
// find child widgets in the widget tree, read text, and verify that the values of widget properties
// are correct.

import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:vertertile/main.dart';


Future<void> writeToFile(ByteData data, String path) {
  final buffer = data.buffer;
  return new File(path).writeAsBytes(
      buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
}
void main()  async{
  var a1=-124.5.ceil();
  var a2=124.7.ceil();
  var a3=124.1.ceil();
  PictureRecorder recorder=new PictureRecorder();
  Canvas canvas =new Canvas(recorder);
  canvas.drawColor(Colors.blue,BlendMode.src );
  
  canvas.save();
  var image=recorder.endRecording();
  var bitmap=image.toImage(1024, 1024);
  var aa=await bitmap.toByteData(format: ImageByteFormat.png);
  await writeToFile(aa,'image2.png');
  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(new MyApp());

  //   // Verify that our counter starts at 0.
  //   expect(find.text('0'), findsOneWidget);
  //   expect(find.text('1'), findsNothing);

  //   // Tap the '+' icon and trigger a frame.
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();

  //   // Verify that our counter has incremented.
  //   expect(find.text('0'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);
  //});
}
