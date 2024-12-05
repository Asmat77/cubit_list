import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qubit_list/buttos.dart';
import 'package:qubit_list/cubitlist.dart';
import 'package:qubit_list/dbhelper.dart';

class HomePage extends StatelessWidget {
  List<Map<String, dynamic>> mData = [];

  @override
  Widget build(BuildContext context) {
    mData = context.watch<ListCubit>().state.mList;
    context.read<ListCubit>().getNote();
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: ListView.builder(
          itemCount: mData.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(mData[index][DBHelper.NOTE_COLUMN_TITLE]),
              subtitle: Text(mData[index][DBHelper.NOTE_COLUMN_DESC]),
              trailing: SizedBox(
                width: 100,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => AddPage(
                                        isupdate: true,
                                        id: mData[index]
                                            [DBHelper.NOTE_COLUMN_ID],
                                        title: mData[index]
                                            [DBHelper.NOTE_COLUMN_TITLE],
                                        desc: mData[index]
                                            [DBHelper.NOTE_COLUMN_DESC],
                                      )));
                        },
                        icon: Icon(Icons.edit)),
                    IconButton(
                        onPressed: () {
                          context.read<ListCubit>().deleteNote(
                              mData[index][DBHelper.NOTE_COLUMN_ID]);
                        },
                        icon: Icon(Icons.delete))
                  ],
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => AddPage()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
