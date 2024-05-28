import 'package:dowith/screen/group_each/group_each.dart';
import 'package:dowith/screen/login_signup_option/login_signup_option.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: signinpage(),
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
          scale: isCenter ? 1.05 : 0.85,
          child: Card(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GroupDetailPage(
                      title: 'Goldclub${index + 1}',
                    ),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.center,
                decoration: isCenter
                    ? BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFFF3D00), // 시작 색상
                      Color(0xFFFF9F6F)  // 끝 색상
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(1),
                )
                    : BoxDecoration(
                  color: Color(0xFFF9F9F9), // 단색 적용
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row( // header
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text( // Group Title
                            'Goldclub${index+1}',
                            style: TextStyle(
                              color: isCenter ? Colors.black : Colors.grey,
                              fontSize: 35,
                              fontFamily: 'Arimo-Bold',
                            )
                        ), // Group Title
                        SizedBox(height: 10),
                        Text( // progress
                            '${isCenter ? "33%" : "-"}',
                            style: TextStyle(
                              color: isCenter ? Colors.black : Colors.grey,
                              fontSize: 25,
                              fontFamily: 'Arimo-Bold',
                            ) // progress
                        ),
                      ],
                    ), // header
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
    print('numberOfPages : $numberOfPages');
    return PageView.builder( // carousel_slider 구현하고픔..
      controller: PageController(viewportFraction: 1, keepPage: true),
      itemCount: numberOfPages,
      itemBuilder: (context, pageIndex) {
        int startIndex = pageIndex * itemsPerPage;
        int endIndex = (startIndex + itemsPerPage > tasks.length) ? tasks.length : startIndex + itemsPerPage;
        List<String> pageTasks = tasks.sublist(startIndex, endIndex);

        return Column(
          children: List.generate(endIndex - startIndex, (localIndex) {
            int taskIndex = startIndex + localIndex; // 전역 인덱스 계산
            return Container( // 각 task
              padding: EdgeInsets.only(left: 10, top: 3),
              child: Column(
                children: [
                  Row( // 각 task
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        tasks[taskIndex],
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
              ), // 각 task
            ); // 각 task
          }),
        );
      },
    );
  }
}

class mainpage extends StatelessWidget {
  const mainpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
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
    );
  }
}
