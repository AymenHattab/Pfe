import 'package:app/component/signupfield.dart';
import 'package:app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/clientbloc/bloc.dart';
import '../bloc/clientbloc/events.dart';
import '../bloc/clientbloc/states.dart';
import '../ui/clientMangement.dart';

class ListViewClient extends StatefulWidget {
  const ListViewClient({super.key});

  @override
  State<ListViewClient> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ListViewClient> {
  void initState() {
    clientbloc bloc = clientbloc(clientbuttonNotifcationsPressed());
    bloc = BlocProvider.of<clientbloc>(context);
    select = BlocProvider.of<clientselect>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        SizedBox(height: 10),
        Container(
          width: 200,
          height: 30,
          child: signuptextfield(
            controlle: search,
            hint: 'Recherche un client',
            icon: Icon(
              Icons.search,
              color: Color.fromRGBO(0, 85, 211, 1),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        BlocBuilder<clientbloc, clientState>(
          builder: (context, state) {
            if (state is clientNotifcationloaded) {
              return Container(
                height: 300,
                width: 250,
                child: Expanded(
                  child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 10.0),
                      itemCount: state.client.length,
                      itemBuilder: ((context, index) {
                        return Stack(children: [
                          Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 3),
                                    )
                                  ]),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    child: Container(
                                      height: 70.0,
                                      width: 70.0,
                                      color: Color.fromARGB(255, 14, 38, 255),
                                      child: Icon(Icons.person_2_sharp,
                                          color: Colors.white, size: 50.0),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        state.client[index].nom.toString(),
                                        style: TextStyle(
                                            fontSize: 20,
                                            color:
                                                Color.fromRGBO(0, 85, 211, 1),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        state.client[index].prenom.toString(),
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.phone,size: 14,),
                                          Text(
                                            state.client[index].phone.toString(),
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Align(
                              alignment: Alignment(1, 1),
                              child: IconButton(
                                  onPressed: null,
                                  icon: Icon(
                                      color: Colors.red,
                                      Icons.delete_forever_rounded)))
                        ]);
                      })),
                ),
              );
            }
            return Container();
          },
        )
      ],
    ));
  }
}
