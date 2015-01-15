part of game;

String server='ws://localhost:$PORT';
WebSocket handleSocket(WebSocket ws){
  ws..onOpen.listen(
      (Event e){
        print('connected to server');
      }
  )
  ..onMessage.listen(
      (MessageEvent e){
        print('receive the message ${e.data}');
      }
  )
  ..onClose.listen(
      (Event e){
        print('connection to server lost'); 
      }
  );
  return ws;
}

