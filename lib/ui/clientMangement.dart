import 'package:app/component/search.dart';
import 'package:app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/clientbloc/bloc.dart';
import '../bloc/clientbloc/events.dart';
import '../bloc/clientbloc/states.dart';
import '../component/ListviewClients.dart';
import '../component/addClient.dart';
import '../component/notification.dart';
import '../component/signupfield.dart';

class clientsSidebar extends StatefulWidget {

   clientsSidebar({super.key });
  @override
  State<clientsSidebar> createState() => _clientsSidebarState();
}

final search = TextEditingController();
clientselect select = clientselect(clientselectedEvent(
    "https://cdn-icons-png.flaticon.com/512/6009/6009864.png", "aa", "",""));

class _clientsSidebarState extends State<clientsSidebar> {
  void initState() {
    clientbloc bloc = clientbloc(clientbuttonNotifcationsPressed());
    bloc = BlocProvider.of<clientbloc>(context);
    select = BlocProvider.of<clientselect>(context);
    super.initState();
  }
  final PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    Future openDialog() => showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              child: Container(
            height: 400,
            width: 200,
            decoration: BoxDecoration(color: Colors.grey[100]),
            child: PageView(
              controller : controller , 
              children: [
              ListViewClient(controller: controller,),
              addClient(controller: controller)
            ]),
          ));
        });

    return BlocBuilder<clientselect, clientState>(
      builder: (context, state) {
        if (state is clientselectedState) {
          String name=state.firstName; 
          String lastname=state.LastName; 
          return GestureDetector(
            onTap: () => {
              bloc.add(clientbuttonNotifcationsPressed()),
              openDialog()
            },
            child: Container(
              width: 200,
              decoration: BoxDecoration(
                color: Color.fromRGBO(0, 85, 255, 1),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12)
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Icon(Icons.person_add_alt, size: 20,color: Color.fromRGBO(255, 255, 255, 1),),
                 SizedBox(width: 10,),
                      Text("$name  ",style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1),fontSize: 15,fontWeight : FontWeight.w300,),
                      
                      ),
                     
                ],
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
