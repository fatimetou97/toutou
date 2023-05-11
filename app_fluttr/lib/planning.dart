import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'service/auth_services.dart';

class PlanningScreen extends StatefulWidget {
  // final String agent_id;

  PlanningScreen();

  @override
  _PlanningScreenState createState() => _PlanningScreenState();
}

class _PlanningScreenState extends State<PlanningScreen> {
  List<dynamic> plannings = [];
  String id = "";

  @override
  void initState() {
    super.initState();
    GetUserId();
    fetchPlannings();
  }

  GetUserId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      id = sharedPreferences.getString("id")!;
    });
    print("id: $id");
  }

  Future<void> fetchPlannings() async {
    try {
      final data = await AuthServices.getPlanningsByAgent(id);
      setState(() {
        plannings = data;
      });
    } catch (e) {
      // Gérez l'erreur
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plannings'),
      ),
      body: DataTable(
        columns: [
          DataColumn(label: Text('Heures')),
          DataColumn(label: Text('Jours')),
          // Ajoutez d'autres colonnes au besoin
        ],
        rows: plannings.map((planning) {
          return DataRow(cells: [
            DataCell(Text(planning['heurs'].toString())),
            DataCell(Text(planning['jours'].toString())),
            // Ajoutez d'autres cellules pour afficher les autres détails du planning
          ]);
        }).toList(),
      ),
    );
  }
}










//  Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Plannings'),
//       ),
//       body: ListView.builder(
//         itemCount: plannings.length,
//         itemBuilder: (context, index) {
//           final planning = plannings[index];
//           return ListTile(
//             title: Text(planning['heurs'].toString()),
//             subtitle: Text(planning['jours'].toString()),
//             // Affichez les autres détails du planning au besoin
//           );
//         },
//       ),
//     );
//   }     






