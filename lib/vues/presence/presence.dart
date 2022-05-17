import 'package:data_table_2/paginated_data_table_2.dart';
import 'package:flutter/material.dart';

class Presence extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: DataTable2(
          columnSpacing: 12,
          horizontalMargin: 12,
          minWidth: 600,
          columns: [
            DataColumn2(
              label: Text(
                'Nom & Post-nom',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              size: ColumnSize.L,
            ),
            DataColumn(
              label: Text(
                'Matricule',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'Affectation',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn2(
              label: Text(
                'Heure arrivée',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              size: ColumnSize.S,
            ),
            DataColumn2(
              label: Text(
                'Heure départ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              size: ColumnSize.S,
              numeric: true,
            ),
          ],
          rows: List<DataRow>.generate(
              10,
              (index) => DataRow(cells: [
                    DataCell(Text('A' * (10 - index % 10))),
                    DataCell(Text('B' * (10 - (index + 5) % 10))),
                    DataCell(Text('C' * (15 - (index + 5) % 10))),
                    DataCell(Text('D' * (15 - (index + 10) % 10))),
                    DataCell(Text(((index + 0.1) * 25.4).toString()))
                  ]))),
    );
  }
}
