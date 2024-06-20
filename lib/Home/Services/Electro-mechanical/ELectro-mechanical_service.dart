import 'package:final_one/Home/Services/Electro-mechanical/electromechanical.dart';
import 'package:flutter/material.dart';
import 'package:final_one/Home/Services/category_widget.dart';
import '../../../Api_Manager.dart';



class ElectroMechanicalService extends StatefulWidget {
  static const String RouteName = 'electromechanical';

  @override
  State<ElectroMechanicalService> createState() => _ElectroMechanicalServiceState();
}

class _ElectroMechanicalServiceState extends State<ElectroMechanicalService> {
  final ApiManager apiManager = ApiManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Electro-Mechanical Service'),
      ),
      body: FutureBuilder<Electromechanical>(
        future: apiManager.ElectroMechanicalService(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final technicians = snapshot.data?.service?.technicians ?? [];
            return ListView.builder(
              itemCount: technicians.length,
              itemBuilder: (context, index) {
                final technician = technicians[index];
                return CategoryServiceWidget(
                  name: technician.name ?? 'No Name',
                  phone: technician.phone ?? 'No Phone',
                );
              },
            );
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}

