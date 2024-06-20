import 'package:final_one/Home/Services/Electrical/Electrical.dart';
import 'package:final_one/Home/Services/Nitrogen/nitrogen.dart';
import 'package:flutter/material.dart';
import '../../../Api_Manager.dart';
import '../category_widget.dart';


class ElectricalService extends StatefulWidget {
  static const String RouteName = 'Electrical';

  @override
  State<ElectricalService> createState() => _ElectricalServiceState();
}

class _ElectricalServiceState extends State<ElectricalService> {
  final ApiManager apiManager = ApiManager();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Electrical Service'),
      ),
      body: FutureBuilder<Electrical>(
        future: apiManager.ElectricalService(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final technicians = snapshot.data?.service?.technicians ?? [];
            final serviceId = snapshot.data?.service?.id ?? '';
            return ListView.builder(
              itemCount: technicians.length,
              itemBuilder: (context, index) {
                final technician = technicians[index];
                return CategoryServiceWidget(
                  name: technician.name ?? 'No Name',
                  phone: technician.phone ?? 'No Phone', serviceId: serviceId,

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
