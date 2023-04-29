import 'package:app/bloc/CommercantBloc/commercantState.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../bloc/CommercantBloc/commercantbloc.dart';
import '../model/modelTest.dart';
import '../resources/Apicommercant.dart';

class statics extends StatefulWidget {
  const statics({super.key});

  @override
  State<statics> createState() => _staticsState();
}
CommercantApi api = CommercantApi() ; 

List<Data> _data = [];
class _staticsState extends State<statics> {
  @override
  Widget build(BuildContext context) {
    return  BlocListener<ProfileData,commercantState>(
listener: (context, state) {
  if (state is HistoriqueDisplayed){
    _data.clear();
for(int i=0 ; i<state.historique.length ; i++){
  _data.add(Data(state.historique[i].montant!, state.historique[i].id!));
}
print(_data);
  }
},
      child: Container(
        height: 350,
        child: SfCartesianChart(
          
          // Add chart data and customize chart appearance here
          series: <LineSeries>[
            LineSeries<Data, num>(
              dataSource:_data ,
              xValueMapper: (Data data, _) => data.y,
              yValueMapper: (Data data, _) => data.x,
            ),
          ],
          title: ChartTitle(text: 'historique payement'),
          legend: Legend(isVisible: true),
          tooltipBehavior: TooltipBehavior(enable: true),
          primaryXAxis: NumericAxis(),
          primaryYAxis: NumericAxis(),
        ),
      ),
    );
  }
}


class Data {
  Data(this.x, this.y);
  final int x;
  final int y;
}