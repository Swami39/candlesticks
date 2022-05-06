// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
import 'package:candlesticks/candlesticks.dart';
import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:http/http.dart' as http;

class CandlestickWidget extends StatefulWidget {
  const CandlestickWidget(
      {Key key, this.width, this.height, this.symbol, this.interval})
      : super(key: key);

  final double width;
  final double height;
  final String symbol;
  final String interval;

  @override
  _CandlestickWidgetState createState() => _CandlestickWidgetState();
}

class _CandlestickWidgetState extends State<CandlestickWidget> {
  List<Candle> candles = [];
  WebSocketChannel _channel;

  String interval;
  String symbol;

  Future<List<Candle>> fetchCandles({String symbol, String interval}) async {
    final uri = Uri.parse(
        "https://api.binance.com/api/v3/klines?symbol=$symbol&interval=$interval&limit=1000");
    final res = await http.get(uri);
    return (jsonDecode(res.body) as List<dynamic>)
        .map((e) => Candle.fromJson(e))
        .toList()
        .reversed
        .toList();
  }

  void binanceFetch(String symbol, String interval) {
    fetchCandles(symbol: symbol, interval: interval).then(
      (value) => setState(
        () {
          this.symbol = symbol;
          this.interval = interval;
          candles = value;
        },
      ),
    );
    if (_channel != null) _channel?.sink?.close();
    _channel = WebSocketChannel.connect(
      Uri.parse('wss://stream.binance.com:9443/ws'),
    );
    _channel?.sink?.add(
      jsonEncode(
        {
          "method": "SUBSCRIBE",
          "params": [symbol.toLowerCase() + "@kline_" + interval],
          "id": 1
        },
      ),
    );
  }

  void updateCandlesFromSnapshot(AsyncSnapshot<Object> snapshot) {
    if (snapshot.data != null) {
      final data = jsonDecode(snapshot.data as String) as Map<String, dynamic>;
      if (data.containsKey("k") == true &&
          candles[0].date.millisecondsSinceEpoch == data["k"]["t"]) {
        candles[0] = Candle(
            date: candles[0].date,
            high: double.parse(data["k"]["h"]),
            low: double.parse(data["k"]["l"]),
            open: double.parse(data["k"]["o"]),
            close: double.parse(data["k"]["c"]),
            volume: double.parse(data["k"]["v"]));
      } else if (data.containsKey("k") == true &&
          data["k"]["t"] - candles[0].date.millisecondsSinceEpoch ==
              candles[0].date.millisecondsSinceEpoch -
                  candles[1].date.millisecondsSinceEpoch) {
        candles.insert(
            0,
            Candle(
                date: DateTime.fromMillisecondsSinceEpoch(data["k"]["t"]),
                high: double.parse(data["k"]["h"]),
                low: double.parse(data["k"]["l"]),
                open: double.parse(data["k"]["o"]),
                close: double.parse(data["k"]["c"]),
                volume: double.parse(data["k"]["v"])));
      }
    }
  }

  @override
  void initState() {
    binanceFetch(widget.symbol, widget.interval);
    super.initState();
  }

  @override
  void dispose() {
    if (_channel != null) _channel?.sink?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AspectRatio(
        aspectRatio: 1.3,
        child: StreamBuilder(
          stream: _channel?.stream,
          builder: (context, snapshot) {
            updateCandlesFromSnapshot(snapshot);
            return Candlesticks(
              onIntervalChange: (String value) async {
                binanceFetch(symbol, value);
              },
              candles: candles,
              interval: interval,
            );
          },
        ),
      ),
    );
  }
}
