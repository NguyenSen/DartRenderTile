import 'dart:io';
import 'dart:math';

import 'dart:core';
 abstract class ICavas 
{
   bool ClipOverflow=false;
   void StartDrawing(double sizeX, double sizeY);
   void DrawBackground(Brush style);
   void DrawLineString(List<Point> geometry, Brush style);
   void DrawPolygon(List<Point> geometry, Brush style);
   void DrawPoint(Point geometry, Brush style);
   void DrawText(Point geometry, Brush style);
   void DrawTextOnPath(List<Point> geometry, Brush style);
   void DrawImage(Stream imageStream, Brush style);
   void DrawUnknown(List<List<Point>> geometry, Brush style);
   BitmapSource FinishDrawing();
}
class Brush{}
class Stream{}
class BitmapSource{}