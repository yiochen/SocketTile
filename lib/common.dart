library common;
import 'dart:convert';
//store constants and information share by all libraries.
const int HIGHT=450;
const int WIDTH=800;
const int PORT=8000;

//'M' represent message
String newConnM(String TAG)=>JSON.encode({'from':TAG,'message':'new'});
String clickM(String TAG)=>JSON.encode({'from':TAG,'message':'click'});