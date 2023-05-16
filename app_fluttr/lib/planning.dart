import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  late int id;
  bool loading = false;

  @override
  void initState() {
    super.initState();

    fetchPlannings();
  }

  getUserId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      id = sharedPreferences.getInt("id")!;
    });
    print("useriddddddddddddd");
  }

  Future<void> fetchPlannings() async {
    await getUserId();
    try {
      print("idfffffffffffffff");
      setState(() {
        loading = true;
      });
      print(id);
      final data = await AuthServices.getPlanningsByAgent(id);
      print("data$data");
      setState(() {
        loading = false;
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
          title: const Text('Plannings'),
        ),
        body: loading
            ? const Center(child: CircularProgressIndicator())
            : ListView.separated(
                itemBuilder: (BuildContext ctxt, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: ListTile(
                        // leading: Text(
                        //   '${plannings[index]['agent']['nom'].toString()}',
                        //   // style: TextStyle(color: Colors.amber),
                        // ),
                        title: Text(
                          'Heures',
                          // style: TextStyle(color: Colors.amber),
                        ),
                        subtitle: Row(
                          children: [
                            Text(
                              '${plannings[index]['heurs'].toString()}',
                              // style: TextStyle(color: Colors.amber),
                            ),
                            SizedBox(
                              width: 5,
                              child: Text(" / "),
                            ),
                            Text(
                              '   ${plannings[index]['jours'].toString()}',
                              // style: TextStyle(color: Colors.amber),
                            ),
                          ],
                        ),
                        trailing: Text(
                          '${plannings[index]['agent']['nom'].toString()}',
                          // style: TextStyle(color: Colors.amber),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    SizedBox(),
                itemCount: plannings.length));
  }
}

// DataTable(
//               columns: [
//                 DataColumn(label: Text('Heures')),
//                 DataColumn(label: Text('Jours')),
//                 // Ajoutez d'autres colonnes au besoin
//               ],
//               rows: plannings.map((planning) {
//                 return DataRow(cells: [
//                   DataCell(Text(planning['heurs'].toString())),
//                   DataCell(Text(planning['jours'].toString())),
//                   // Ajoutez d'autres cellules pour afficher les autres détails du planning
//                 ]);
//               }).toList(),
//             ),








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






