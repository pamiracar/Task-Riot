import 'package:flutter/material.dart';
import 'package:task_riot/pages/add_page.dart';
import 'package:task_riot/pages/settings_page.dart';
import 'package:task_riot/services/shared_prefences_service.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<MapEntry<String, String>> todosList = [];

  @override
  void initState() {
    super.initState();
    loadTodos();
  }

  Future<void> loadTodos() async {
    final service = SharedPrefencesService();
    await service.init();

    Map<String, String> todosMap = await service.getAllData();
    setState(() {
      todosList = todosMap.entries.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text("Task Riot"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: add,
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: todosList.isEmpty
            ? Center(child: Text("Please add tasks"))
            : ListView.builder(
                itemCount: todosList.length,
                itemBuilder: (BuildContext context, int index) {
                  final todo = todosList[index];
                  return Column(
                    children: [
                      SizedBox(height: 10),
                      Dismissible(
                        key: UniqueKey(),
                        onDismissed: (direction) => onDismissed(todo.key),
                        background: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Theme.of(context).colorScheme.errorContainer,
                          ),
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 20),
                          child: Icon(Icons.delete_forever_outlined),
                        ),
                        confirmDismiss: (direction) async {
                          return await showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text("Delete Task"),
                                content: const Text(
                                  "Are you sure you want to delete?",
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(false);
                                    },
                                    child: Text("Cancel"),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(true);
                                    },
                                    child: Text(
                                      "Delete",
                                      style: TextStyle(
                                        color: Theme.of(context).colorScheme.error,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        direction: DismissDirection.endToStart,
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Theme.of(context).cardColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      todo.key,
                                      style: Theme.of(
                                        context,
                                      ).textTheme.headlineSmall,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      softWrap: false,
                                    ),
                                    Text(
                                      todo.value,
                                      style: Theme.of(context).textTheme.labelMedium,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      softWrap: false,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
      ),
    );
  }

  void add() async{
    await Navigator.push(context, MaterialPageRoute(builder: (context) => AddPage()));
    await loadTodos();
  }

  void onDismissed(String title) async{
      await SharedPrefencesService().deleteData(title);

  }
}
