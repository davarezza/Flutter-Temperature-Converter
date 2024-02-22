import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(SuhuConverterApp());
}

class SuhuConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Konverter Suhu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SuhuConverter(),
    );
  }
}

class SuhuConverter extends StatefulWidget {
  @override
  _SuhuConverterState createState() => _SuhuConverterState();
}

class _SuhuConverterState extends State<SuhuConverter> {
  double inputSuhu = 0;
  double fahrenheit = 0;
  double reamur = 0;
  double kelvin = 0;

  void konversiSuhu(double suhu) {
    setState(() {
      inputSuhu = suhu;
      fahrenheit = (suhu * 9 / 5) + 32;
      reamur = suhu * 4 / 5;
      kelvin = suhu + 273.15;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: 
          Text('Konverter Suhu')),
          backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Masukkan Suhu (Celsius)',
                border: OutlineInputBorder(),
                hintText: 'Contoh: 25',
                suffixText: '°C',
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))],
              onChanged: (String value) {
                double temp = double.tryParse(value) ?? 0.0;
                konversiSuhu(temp);
              },
            ),
            SizedBox(height: 20),
            Text('Hasil Konversi', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Fahrenheit', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 5),
                      Text('${fahrenheit.toStringAsFixed(2)} °F', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Reamur', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 5),
                      Text('${reamur.toStringAsFixed(2)} °R', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Kelvin', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 5),
                      Text('${kelvin.toStringAsFixed(2)} K', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
