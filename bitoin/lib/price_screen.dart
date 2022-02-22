import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'dart:io' show Platform;
import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey = 'D1F2549D-1ACA-4354-A1FE-20956DFFC1DC';

// ignore_for_file: prefer_const_constructors

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String? dropDownValue = 'USD';
  String btcRate = '?';
  String ethRate = '?';
  String ltcRate = '?';

  Future getData(String? base, String? quote) async {
    String? baseId = base;
    String? qouteId = quote;

    String url =
        'https://rest.coinapi.io/v1/exchangerate/$baseId/$qouteId?apikey=$apiKey';
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }

  Future<void> updateUI(String? newValue) async {
    var btcData = await getData('BTC', newValue);
    var ethData = await getData('ETH', newValue);
    var ltcData = await getData('LTC', newValue);
    int tmpBtc = btcData['rate'].round();
    int tmpEth = ethData['rate'].round();
    int tmpLtc = ltcData['rate'].round();
    setState(() {
      dropDownValue = newValue;
      btcRate = tmpBtc.toString();
      ethRate = tmpEth.toString();
      ltcRate = tmpLtc.toString();
    });
  }

  DropdownButton<String> dropDownMenu() {
    List<DropdownMenuItem<String>> dropDownItems() {
      return currenciesList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList();
    }

    return DropdownButton(
      value: dropDownValue,
      onChanged: (String? newValue) {
        updateUI(newValue);
      },
      items: dropDownItems(),
    );
  }

  CupertinoPicker iosPicker() {
    List<Widget> dropPickerItems() {
      List<Text> items = [];
      for (String currency in currenciesList) {
        items.add(Text(currency));
      }
      return items;
    }

    return CupertinoPicker(
      itemExtent: 32,
      children: dropPickerItems(),
      onSelectedItemChanged: (newValue) {
        updateUI(currenciesList[newValue]);
      },
    );
  }

  Widget? getPicker() {
    if (Platform.isIOS) {
      return iosPicker();
    } else if (Platform.isAndroid) {
      return dropDownMenu();
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: RateCard(base: 'BTC', quote: dropDownValue, rate: btcRate),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: RateCard(base: 'ETH', quote: dropDownValue, rate: ethRate),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: RateCard(base: 'LTC', quote: dropDownValue, rate: ltcRate),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: getPicker(),
          ),
        ],
      ),
    );
  }
}

class RateCard extends StatelessWidget {
  final String base;
  final String? quote;
  final String rate;

  RateCard({required this.base, required this.quote, required this.rate});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlueAccent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
        child: Text(
          '1 $base = $rate $quote',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
