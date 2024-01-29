import 'package:apm/components/footer.dart';
import 'package:flutter/material.dart';

class kosong extends StatefulWidget {
  kosong({super.key});

  final routeNames = '';
  @override
  State<kosong> createState() => _profilState();
}

class _profilState extends State<kosong> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00923F),
        title: Text(
          'blank',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: kosong(),
  ));
}
