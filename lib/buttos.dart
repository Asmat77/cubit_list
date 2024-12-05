import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qubit_list/cubitlist.dart';


class AddPage extends StatelessWidget {
  TextEditingController titleController=TextEditingController();
  TextEditingController descController=TextEditingController();
  bool isupdate;
  String title;
  String desc;
  int? id=0;
  AddPage({this.id,this.isupdate=false,this.title="",this.desc=""});

  @override
  Widget build(BuildContext context) {
    titleController.text=title;
    descController.text=desc;

    return Scaffold(
      appBar: AppBar(
        title: Text(isupdate ? "Update Note":"Add Note"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(
                focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(11)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11))),
          ),
          SizedBox(height: 20,),
          TextField(
            controller: descController,
            decoration: InputDecoration(
                focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(11)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11))),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OutlinedButton(onPressed: (){
                if(isupdate){

                  context.read<ListCubit>().updateNote(title: titleController.text.toString(), desc: descController.text.toString(), id: id!);
                  Navigator.pop(context);
                }else {
                  context.read<ListCubit>().addNote(
                      title: titleController.text.toString(),
                      desc: descController.text.toString());
                  Navigator.pop(context);
                }
              }, child: Text(isupdate ? "Update":"Add")),
              SizedBox(width: 20,),
              OutlinedButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text("Cancel")),
            ],)
        ],
      ),
    );
  }
}
