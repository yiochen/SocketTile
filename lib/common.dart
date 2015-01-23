library common;
import 'dart:convert';
//store constants and information share by all libraries.
const int HIGHT=450;
const int WIDTH=800;
const int PORT=8000;

num tilesize;

const int t_GROUND=33;
const int t_BOARDER=92;
const int t_BOX=50;
const num STALL=-1;
const num UP=0;
const num DOWN=1;
const num LEFT=3;
const num RIGHT=2;
//these values are related to actual calculations, do not change.

//'M' represent message
String newConnM(String TAG)=>JSON.encode({'from':TAG,'message':'new'});
String clickM(String TAG)=>JSON.encode({'from':TAG,'message':'click'});