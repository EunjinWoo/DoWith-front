import 'package:flutter/material.dart';

class DynamicTaskView extends StatefulWidget {
  final List<Map<String, dynamic>> tasks;
  final VoidCallback onUpdate;

  DynamicTaskView({required this.tasks, required this.onUpdate});

  @override
  _DynamicTaskViewState createState() => _DynamicTaskViewState();
}

class _DynamicTaskViewState extends State<DynamicTaskView> {
  late List<bool> taskCompletionStatus;

  @override
  void initState() {
    super.initState();
    taskCompletionStatus = List<bool>.from(widget.tasks.map((task) => task['completed'] as bool));
  }

  void toggleTaskStatus(int index) {
    setState(() {
      taskCompletionStatus[index] = !taskCompletionStatus[index];
      widget.tasks[index]['completed'] = taskCompletionStatus[index];
      widget.onUpdate();
    });
  }

  @override
  Widget build(BuildContext context) {
    final int itemsPerPage = 5;
    final int numberOfPages = (widget.tasks.length / itemsPerPage).ceil();

    return PageView.builder(
      controller: PageController(viewportFraction: 1, keepPage: true),
      itemCount: numberOfPages,
      itemBuilder: (context, pageIndex) {
        final int startIndex = pageIndex * itemsPerPage;
        final int endIndex = (startIndex + itemsPerPage > widget.tasks.length)
            ? widget.tasks.length
            : startIndex + itemsPerPage;
        final List<Map<String, dynamic>> pageTasks = widget.tasks.sublist(startIndex, endIndex);

        return Column(
          children: List.generate(endIndex - startIndex, (localIndex) {
            final int taskIndex = startIndex + localIndex;
            return Container(
              padding: EdgeInsets.only(left: 10, top: 3),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        pageTasks[localIndex]['title'],
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Arimo-Regular',
                          fontWeight: FontWeight.normal,
                          fontSize: 19,
                        ),
                      ),
                      IconButton(
                        icon: taskCompletionStatus[taskIndex]
                            ? Icon(Icons.circle, color: Colors.black)
                            : Icon(Icons.circle_outlined, color: Colors.black),
                        onPressed: () {
                          toggleTaskStatus(taskIndex);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
        );
      },
    );
  }
}
