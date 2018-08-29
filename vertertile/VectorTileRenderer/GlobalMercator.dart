import 'dart:math';

class GlobalMercator
{
  GlobalMercator(){
    this._tileSize=256;
    this._originShift=20037508.342789244;
    this._initialResolution = 40075016.685578488 / (this._tileSize as double);
  }
  double _initialResolution;
  double _originShift;
  int _tileSize;

 TileAddress googleTile(int tx, int ty, int zoom)
 {
  TileAddress retval =  TileAddress();
	TileAddress result;
	try
	{
		retval.x = tx;
		retval.y = ( pow(2.0, zoom.toDouble()) - 1.0 - ty.toDouble()).toInt();
		result = retval;
	}
	catch (ex)
	{
		throw ex;
	}
	return result;
 }
 CoordinatePair latLonToMeters(double lat, double lon)
 {
CoordinatePair retval =  CoordinatePair();
	CoordinatePair result;
	try
	{
		retval.x = lon * this._originShift / 180.0;
		retval.y = log(tan((90.0 + lat) * 3.1415926535897931 / 360.0)) / 0.017453292519943295;
		retval.y *= this._originShift / 180.0;
		result = retval;
	}
	catch ( ex)
	{
		throw ex;
	}
	return result;
 }
 double _resolution(int zoom)
		{
			return this._initialResolution / (1 << zoom).toDouble();
		}
 CoordinatePair metersToPixels(double mx, double my, int zoom)
 {
CoordinatePair retval = new CoordinatePair();
	CoordinatePair result;
	try
	{
		double res = this._resolution(zoom);
		retval.x = (mx + this._originShift) / res;
		retval.y = (my + this._originShift) / res;
		result = retval;
	}
	catch ( ex)
	{
		throw ex;
	}
	return result;
 }
 TileAddress PixelsToTile(double px, double py)
 {
   TileAddress retval = new TileAddress();
   TileAddress result;
   try
	{
		retval.x = (((px / this._tileSize.toDouble()).toDouble()) - 1.0).ceil();
		retval.y = (((py / this._tileSize.toDouble()).toDouble()) - 1.0);
		result = retval;
	}
	catch ( ex)
	{
		throw ex;
	}
	return result;
 }
 TileAddress metersToTile(double mx, double my, int zoom)
 {
   TileAddress retval = new TileAddress();
	TileAddress result;
	try
	{
		CoordinatePair p = this.metersToPixels(mx, my, zoom);
		retval = this.PixelsToTile(p.X, p.Y);
		result = retval;
	}
	catch (Exception ex)
	{
		throw ex;
	}
	return result;
 }
  String LatLonToQuadTree(double lat, double lon, int zoom)
  {
    string result;
	try
	{
		CoordinatePair i = this.latLonToMeters(lat, lon);
		TileAddress t = this.MetersToTile(i.x, i.y, zoom);
		String retval = this.QuadTree(Convert.ToInt32(t.X), Convert.ToInt32(t.Y), zoom);
		result = retval;
	}
	catch ( ex)
	{
		throw ex;
	}
	return result;
  }
}
class CoordinatePair
{
  double x;
  double y;
}
class GeoExtent
{
  double north; 
  double south;
  double east;
  double west;
}
class TileAddress
{
  int x;
  int y;
}