import 'dart:convert';
import 'dart:io';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

void main(List<String> arguments) {
final channel = IOWebSocketChannel.connect(
'wss://ws.binaryws.com/websockets/v3?app_id=1089');

// channel.stream.listen((message) {
// final decodeMessage = jsonDecode(message);
// final serverTimeAsEpoch = decodeMessage['time'];
// final serverTime =
// DateTime.fromMillisecondsSinceEpoch(serverTimeAsEpoch * 1000);
// print(serverTime);
// channel.sink.close();
// });
channel.stream.listen((message) {
final decodeMessage = jsonDecode(message);
    final tick_name = decodeMessage['tick']['symbol'];
    final tick_price = decodeMessage['tick']['quote'];
    final serverTimeAsEpoch = decodeMessage['tick']['epoch'];
final serverTime =
DateTime.fromMillisecondsSinceEpoch(serverTimeAsEpoch * 1000);
    print('Name: $tick_name, Price: $tick_price, Date: $serverTime');

// print(serverTimeAsEpoch);
// channel.sink.close();
});
  print('Please Enter Symbol Name : ');
  final userInput = stdin.readLineSync();
  channel.sink.add('{"ticks":"$userInput"}');
// channel.sink.add('{"ticks":"R_100"}');
}
