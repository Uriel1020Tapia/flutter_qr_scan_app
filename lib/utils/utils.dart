import 'package:flutter/material.dart';
import 'package:flutter_app_read_qr/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

launchURL(BuildContext context, ScanModel scan) async {
  final _url = scan.valor;
  if (scan.tipo == 'http') {
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
  } else {
    Navigator.pushNamed(context, 'map', arguments: scan);
  }
}
