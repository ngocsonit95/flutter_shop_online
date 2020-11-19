import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:typicons_flutter/typicons_flutter.dart';

import 'crypto_data.dart';

var cryptoData = CryptoData.getData;

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  child: ListView.builder(
                itemCount: cryptoData.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                    height: 220,
                    width: double.maxFinite,
                    child: Card(
                      elevation: 5.0,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                  width: 2.0,
                                  color: cryptoData[index]['iconColor']),
                            ),
                            color: Colors.white),
                        child: Padding(
                          padding: EdgeInsets.all(7.0),
                          child: Stack(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerRight,
                                child: Stack(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, top: 5.0),
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              cryptoIcon(cryptoData[index]),
                                              SizedBox(
                                                height: 10.0,
                                              ),
                                              cryptoNameSymbol(
                                                  cryptoData[index]),
                                              Spacer(),
                                              cryptoChange(cryptoData[index]),
                                              SizedBox(
                                                width: 10.0,
                                              ),
                                              changeIcon(cryptoData[index]),
                                              SizedBox(
                                                width: 20,
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              cryptoAmount(cryptoData[index])
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }

  Widget cryptoIcon(data) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Icon(
          CryptoFontIcons.BTC,
          color: Colors.amber,
          size: 40,
        ),
      ),
    );
  }

  Widget cryptoNameSymbol(data) {
    return Align(
      alignment: Alignment.centerLeft,
      child: RichText(
        text: TextSpan(
            text: '\n${data['name']}',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontSize: 20.0),
            children: <TextSpan>[
              TextSpan(
                  text: '\n${data['changeValue']}',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.bold))
            ]),
      ),
    );
  }

  Widget cryptoChange(data) {
    return Align(
      alignment: Alignment.topRight,
      child: RichText(
        text: TextSpan(
            text: '\n${data['changeValue']}',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green,
                fontSize: 20.0),
            children: <TextSpan>[
              TextSpan(
                  text: '\n${data['changeValue']}',
                  style: TextStyle(
                      color: data['changeColor'],
                      fontSize: 15,
                      fontWeight: FontWeight.bold))
            ]),
      ),
    );
  }

  Widget changeIcon(data) {
    return Align(
        alignment: Alignment.topRight,
        child: data['change'].contains('-')
            ? Icon(
                Typicons.arrow_sorted_up,
                color: Colors.green,
                size: 30,
              )
            : Icon(
                Typicons.arrow_sorted_up,
                color: data['changeColor'],
                size: 30,
              ));
  }

  Widget cryptoAmount(data) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Row(
          children: <Widget>[
            RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                  text: 'n${data['value']}',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
