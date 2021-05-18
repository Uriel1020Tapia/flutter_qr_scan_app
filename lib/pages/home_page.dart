import 'package:flutter/material.dart';
import 'package:flutter_app_read_qr/providers/scan_list_provider.dart';
import 'package:provider/provider.dart';

import 'package:flutter_app_read_qr/pages/directions_page.dart';
import 'package:flutter_app_read_qr/pages/maps.page.dart';
import 'package:flutter_app_read_qr/providers/ui_provider.dart';

import 'package:flutter_app_read_qr/widgets/c_bottom_navigator.dart';
import 'package:flutter_app_read_qr/widgets/scan_btn_floating.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Historial'),
        actions: [
          IconButton(
            icon: Icon(Icons.clear_all),
            onPressed: () {
              Provider.of<ScanListProvider>(context, listen: false)
                  .borrarTodos();
            },
          )
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Obtener el selected menu opt del provider
    final uiProvider = Provider.of<UiProvider>(context);
    // Cambiar para mostrar la pagina respectiva
    final currentIndex = uiProvider.selectedMenuOpt;

    //Usar el ScanProvider
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    switch (currentIndex) {
      case 0:
        scanListProvider.cargarScansPorTipo('geo');
        return MapsPage();
        break;
      case 1:
        scanListProvider.cargarScansPorTipo('http');
        return DirectionsPage();
        break;
      default:
        return MapsPage();
    }
  }
}
