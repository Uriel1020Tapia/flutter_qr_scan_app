import 'package:flutter/material.dart';
import 'package:flutter_app_read_qr/widgets/scan_tiles.dart';

class MapsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScanTiles(tipo: 'geo');
  }
}
