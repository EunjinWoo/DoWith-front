import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   fontFamily: 'Arimo',
      // ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Image.asset(
                  'assets/img/logo.png',
                  fit: BoxFit.contain,
                  height: 22,
                ),
              ),
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/img/profile_pic.jpeg'),
              ),
            ],
          ),
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0.3),
            child: Divider(
              color: Colors.black,
              thickness: 0.3,
            ),
          ),
        ),
        body: GroupList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Action on button press
          },
          child: Icon(Icons.add, color: Colors.white),
          backgroundColor: Colors.black,
          shape: CircleBorder(),
        ),
      ),
    );
  }
}

class GroupList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: PageController(viewportFraction: 0.55, keepPage: true),
      scrollDirection: Axis.vertical,
      itemCount: 10,
      itemBuilder: (context, index) {
        bool isCenter = (index == 1); // assuming that the middle one is always centered
        return Transform.scale(
          scale: isCenter ? 0.95 : 0.9,
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            color: isCenter ? Color(0xFFFF5500) : Color(0xFFF9F9F9),
            child: Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          'Goldclub ${index+1}',
                          style: TextStyle(
                              color: isCenter ? Colors.black : Colors.grey,
                              fontSize: 30,
                              fontFamily: 'Arimo-Bold',
                          )
                      ),
                      SizedBox(height: 10),
                      Text(
                          '${isCenter ? "33%" : "-"}',
                          style:
                          TextStyle(
                              color: isCenter ? Colors.black : Colors.grey,
                              fontSize: 25,
                              fontFamily: 'Arimo-Bold',
                          )
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  if (isCenter) // isCenter
                    Expanded(
                      child: DynamicTaskView(),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class DynamicTaskView extends StatefulWidget {
  @override
  _DynamicTaskViewState createState() => _DynamicTaskViewState();
}

class _DynamicTaskViewState extends State<DynamicTaskView> {
  final int itemsPerPage = 5;
  List<String> tasks = List.generate(12, (index) => 'Task ${index + 1}');
  List<bool> taskCompletionStatus;

  _DynamicTaskViewState() : taskCompletionStatus = List.filled(12, false);

  void toggleTaskStatus(int index) {
    setState(() {
      // 해당 인덱스의 상태를 반전
      taskCompletionStatus[index] = !taskCompletionStatus[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    int numberOfPages = (tasks.length / itemsPerPage).ceil();
    return PageView.builder(
      controller: PageController(viewportFraction: 1, keepPage: true),
      itemCount: numberOfPages,
      itemBuilder: (context, pageIndex) {
        int startIndex = pageIndex * itemsPerPage;
        int endIndex = (startIndex + itemsPerPage > tasks.length) ? tasks.length : startIndex + itemsPerPage;
        List<String> pageTasks = tasks.sublist(startIndex, endIndex);

        return Column(
          children: List.generate(endIndex - startIndex, (localIndex) {
            int taskIndex = startIndex + localIndex; // 전역 인덱스 계산
            return ListTile(
              title: Text(
                tasks[taskIndex],
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Arimo-Regular',
                  fontWeight: FontWeight.normal,
                ),
              ),
              trailing: IconButton(
                icon: taskCompletionStatus[taskIndex]
                    ? Icon(Icons.check_circle, color: Colors.black)
                    : Icon(Icons.circle_outlined, color: Colors.black),
                onPressed: () {
                  toggleTaskStatus(taskIndex);
                },
              ),
            );
          }),
        );
      },
    );
  }
}