library common;
import 'dart:convert';
part 'src/util/messegeHandler.dart';
//store constants and information share by all libraries.
const int HIGHT=450;
const int WIDTH=800;
const int PORT=8000;

num tilesize;

const int t_GROUND=33;
const int t_BOARDER=92;
const int t_BOX=50;
const int t_SPAWN=113;
const num STALL=-1;
const num d_UP=0;
const num d_DOWN=1;
const num d_LEFT=3;
const num d_RIGHT=2;

const String m_newConn='new';
const String m_dir='dir';
const String m_click='click';
const String m_startmove='startmove';
const String m_endmove='endmove';
const String m_error='error';
const String m_bomb='bomb';
const String m_idAssign='idAssign';

const String controllerReq='/controller';
const String gameReq='/game';
//these values are related to actual calculations, do not change.

//'M' represent message
//in a message from and message are required
String idAssignM(String TAG,int id)=>JSON.encode({'from':TAG,'message':m_idAssign,'id':id});
String newConnM(String TAG,int id)=>JSON.encode({'from':TAG,'message':m_newConn,'id':id});
String newDirM(String TAG,num dir)=>JSON.encode({'from':TAG,'message':m_dir,'value':dir});
String startMoveM(String TAG)=>JSON.encode({'from':TAG,'message':m_startmove});
String endMoveM(String TAG)=>JSON.encode({'from':TAG,'message':m_endmove});
String clickM(String TAG)=>JSON.encode({'from':TAG,'message':m_click});
String errorM(String TAG,String errorMessage)=>JSON.encode({'from':TAG,'message':m_error,'value':errorMessage});
String bombM(String TAG,int id)=>JSON.encode({'from':TAG,'message':m_bomb,'id':id});
