import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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

class GroupList extends StatefulWidget {
  @override
  _GroupListState createState() => _GroupListState();
}

class _GroupListState extends State<GroupList> {
  final PageController _pageController = PageController(viewportFraction: 0.55);
  int _currentPageIndex = 0; // 현재 페이지 인덱스를 추적

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      scrollDirection: Axis.vertical,
      itemCount: 10,
      onPageChanged: (int index) {
        setState(() {
          _currentPageIndex = index; // 현재 페이지 인덱스 업데이트
        });
      },
      itemBuilder: (context, index) {
        bool isCenter = index == _currentPageIndex; // 현재 페이지가 중앙인지 확인
        return Transform.scale(
          scale: isCenter ? 0.95 : 0.9,
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            color: isCenter ? Color(0xFFFF5500) : Color(0xFFF9F9F9),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      title: 'Goldclub${index + 1}',
                    ),
                  ),
                );
              },
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
                            'Goldclub${index+1}',
                            style: TextStyle(
                              color: isCenter ? Colors.black : Colors.grey,
                              fontSize: 30,
                              fontFamily: 'Arimo-Bold',
                            )
                        ),
                        SizedBox(height: 10),
                        Text(
                            '${isCenter ? "33%" : "-"}',
                            style: TextStyle(
                              color: isCenter ? Colors.black : Colors.grey,
                              fontSize: 25,
                              fontFamily: 'Arimo-Bold',
                            )
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Expanded(child: DynamicTaskView(),),
                  ],
                ),
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

class DetailPage extends StatelessWidget {
  final String title;
  final Map<String, int> membersProgress = {
    'Jimin': 100,
    'Sun': 77,
    'Eun': 33,
  };
  DetailPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFFF5500),
      appBar: AppBar(
        // title: Text(title),
        backgroundColor: Color(0xFFFF5500),
        foregroundColor: Colors.white, // 글자색 흰색
        toolbarHeight: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFF5500), // 시작 색상
              Color(0xFFFF5602),
              Color(0xFFFD864B),
              Color(0xFFF9F9F9)  // 종료 색상
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 120, // 원하는 높이를 설정하세요
                        width: double.infinity, // 화면 가로 전체
                        alignment: Alignment.center, // 가로 기준 가운데 정렬
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Arimo-Bold',
                              color: Colors.black,
                              fontSize: 1000,
                            ),
                          ),
                        ),
                      ), // title
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("info", style: TextStyle(fontSize: 18, color: Colors.white, fontFamily: 'Arimo-Regular'),),
                            Text("video call", style: TextStyle(fontSize: 18, color: Colors.white, fontFamily: 'Arimo-Regular')),
                            Text("share", style: TextStyle(fontSize: 18, color: Colors.white, fontFamily: 'Arimo-Regular')),
                            Text("members", style: TextStyle(fontSize: 18, color: Colors.white, fontFamily: 'Arimo-Regular')),
                            Text("add goals", style: TextStyle(fontSize: 18, color: Colors.white, fontFamily: 'Arimo-Regular')),
                          ],
                        ),
                      ), // txt btns
                    ],
                  ), // title + txt btns
                  Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 15),
                    width: 300,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Studying Algorithms From Baekjoon",
                        style: TextStyle(fontSize: 28,fontFamily: 'Arimo-Regular', color: Colors.white),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ), // group intro
                ],
              ),
            ), // title + txt btns + group intro
            Flexible(
              fit: FlexFit.loose,
              child: Container(
                color: Colors.white,
                constraints: BoxConstraints(maxHeight: 300),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: membersProgress.length,
                  itemBuilder: (context, index) {
                    String key = membersProgress.keys.elementAt(index);
                    return ListTile(
                      title: Text(key, style: TextStyle(fontSize: 18)),
                      trailing: Text(
                          "${membersProgress[key]}%",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          )
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
