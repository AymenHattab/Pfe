import 'package:app/bloc/clientbloc/bloc.dart';
import 'package:app/bloc/clientbloc/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/clientbloc/events.dart';

class notification extends StatefulWidget {
  const notification({super.key});

  @override
  State<notification> createState() => _notificationState();
}

clientbloc bloc = clientbloc(clientbuttonNotifcationsPressed());

class _notificationState extends State<notification> {
  void initState() {
    bloc = BlocProvider.of<clientbloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future openDialog() => showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Container(
                  height: 50,
                  color: Colors.blue,
                  child: Text(
                    "Notifcation",
                    style: TextStyle(fontFamily: "Lexend"),
                  ),
                ),
                content: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.9,
                  child: BlocBuilder<clientbloc, clientState>(
                    builder: (context, state) {
                      if (state is clientNotifcationloaded) {
                        return Container(
                          height: 100,
                          child: ListView.builder(
                              itemCount: state.notifcations.data!.length,
                              itemBuilder: ((context, index) {
                                return Container(
                                    child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(state
                                          .notifcations.data![index].avatar!),
                                    ),
                                    Text(
                                        state.notifcations.data![index].email!),
                                  ],
                                ));
                              })),
                        );
                      }
                      return Container();
                    },
                  ),
                ));
          },
        );
    return IconButton(
        onPressed: () =>
            {bloc.add(clientbuttonNotifcationsPressed()), openDialog()},
        icon: Icon(
          Icons.notifications,
          size: 20,
          color: Colors.white,
        ));
  }
}
