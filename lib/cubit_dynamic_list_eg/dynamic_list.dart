import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_flutter/bloc/counter/counter_bloc.dart';
import 'package:learning_flutter/cubit_dynamic_list_eg/cubit/person_cubit.dart';
import 'package:learning_flutter/cubit_dynamic_list_eg/model/person.dart';

class DynamicList extends StatefulWidget {
  const DynamicList({super.key});

  @override
  State<DynamicList> createState() => _DynamicListState();
}

class _DynamicListState extends State<DynamicList> {
  @override
  void dispose() {
    // TODO: implement dispose
    context.read<PersonCubit>().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cubit Dynamic List App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: context.read<PersonCubit>().nameTextEditingController,
              decoration: InputDecoration(hintText: 'Name'),
            ),
            SizedBox(
              height: 8,
            ),
            TextField(
              controller:
                  context.read<PersonCubit>().addressTextEditingController,
              decoration: InputDecoration(hintText: 'Address'),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BlocBuilder<PersonCubit, PersonState>(
                  builder: (context, state) {
                    return ElevatedButton.icon(
                      label: const Text("Add"),
                      style: ElevatedButton.styleFrom(
                        disabledBackgroundColor: Colors.grey,
                      ),
                      onPressed: state.disableAddBtn ? null : add,
                    );
                  },
                ),
                BlocBuilder<PersonCubit, PersonState>(
                  builder: (context, state) {
                    return ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          disabledBackgroundColor: Colors.grey,
                        ),
                        onPressed: state.disableAddBtn ? edit : null,
                        label: const Text('Edit'));
                  },
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: BlocBuilder<PersonCubit, PersonState>(
                builder: (context, state) {
                  if (state is PersonInitialState) {
                    return buildEmptyList();
                  } else if (state is PersonUpdateState) {
                    return buildList(state.person);
                  }

                  return Text('aa');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void add() {
    var model = Person(
        context.read<PersonCubit>().nameTextEditingController.text,
        context.read<PersonCubit>().addressTextEditingController.text);

    context.read<PersonCubit>().addPerson(model);
  }

  void edit() {
    var model = Person(
        context
            .read<PersonCubit>()
            .nameTextEditingController
            .text,
        context
            .read<PersonCubit>()
            .addressTextEditingController
            .text);

    context.read<PersonCubit>().onEditClick(
        context.read<PersonCubit>().editIndex, model);
  }

  Widget buildList(List<Person> person) {
    return ListView.builder(
        itemCount: person.length,
        itemBuilder: (context, index) {
          var model = person[index];

          return ListTile(
            title: Text('Name: ${model.name}'),
            subtitle: Text('Address: ${model.address}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                    onTap: () {
                      context.read<PersonCubit>().onEditIconClick(index, model);
                    },
                    child: Icon(
                      Icons.edit,
                    )),
                SizedBox(
                  width: 8,
                ),
                InkWell(
                    onTap: () {
                      context.read<PersonCubit>().removePerson(index);
                    },
                    child: Icon(
                      Icons.delete,
                      color: Colors.redAccent,
                    )),
              ],
            ),
          );
        });
  }

  Widget buildEmptyList() {
    return Center(
      child: Text('No data found'),
    );
  }
}
