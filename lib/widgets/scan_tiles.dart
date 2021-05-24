import 'package:flutter/material.dart';
import 'package:flutter_app_read_qr/providers/scan_list_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_read_qr/utils/utils.dart';

class ScanTiles extends StatelessWidget {
  final String tipo;

  const ScanTiles({@required this.tipo});

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;
    return ListView.builder(
        itemCount: scanListProvider.scans.length,
        itemBuilder: (_, i) => Dismissible(
              key: UniqueKey(),
              background: Container(
                color: Colors.red,
                child: Align(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                      Text(
                        " Delete",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.right,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  alignment: Alignment.centerRight,
                ),
              ),
              confirmDismiss: (direction) async {
                return await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Text(
                            "Are you sure you want to delete: ${scans[i].valor}?"),
                        actions: [
                          TextButton(
                            child: Text(
                              "Cancel",
                              style: TextStyle(color: Colors.black),
                            ),
                            onPressed: () {
                              print("cancelar");
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: Text('Ok'),
                            onPressed: () {
                              print("ok");
                              final scanListProvider =
                                  Provider.of<ScanListProvider>(context,
                                      listen: false);

                              scanListProvider.borrarScanPorId(scans[i].id);
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      );
                    });
              },
              onDismissed: (direction) {
                // Provider.of<ScanListProvider>(context, listen: false)
                //     .borrarScanPorId(scans[i].id);
                if (direction == DismissDirection.startToEnd) {
                  print("Add to favorite");
                } else {
                  print('Remove item');
                }
              },
              child: ListTile(
                leading: Icon(this.tipo == 'http' ? Icons.https : Icons.map,
                    color: Theme.of(context).primaryColor),
                title: Text(scans[i].valor),
                subtitle: Text(scans[i].id.toString()),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey,
                ),
                onTap: () => launchURL(context, scans[i]),
              ),
            ));
  }
}
