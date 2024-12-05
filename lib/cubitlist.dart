import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qubit_list/dbhelper.dart';
import 'package:qubit_list/liststate.dart';

class ListCubit extends Cubit<ListState>{
  ListCubit():super(ListState(mList: []));
  DBHelper dbHelper=DBHelper.getInstance;
  
  addNote({required String title,required String desc})async{
    bool check=await dbHelper.addNote(title: title, desc: desc);
    if(check){
      List<Map<String,dynamic>> mNotes=await dbHelper.fetchNotes();
      emit(ListState(mList: mNotes));
    }

  }

  updateNote({required String title,required String desc, required int id})async{
    bool check=await dbHelper.updateNotes(title: title, desc: desc, id: id);
    if(check){
      List<Map<String,dynamic>> mNotes=await dbHelper.fetchNotes();
      emit(ListState(mList: mNotes));
    }
  }

  deleteNote(int id)async{
    bool check=await dbHelper.deleteNotes(id: id);
    if(check){
      List<Map<String,dynamic>> mNotes=await dbHelper.fetchNotes();
      emit(ListState(mList: mNotes));
    }
  }
   getNote()async{
    emit(ListState(mList: await dbHelper.fetchNotes()));
  }
  
}