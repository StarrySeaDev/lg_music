import 'package:flutter/material.dart';
import 'package:lg_music/models/global_data.dart';
import 'package:lg_music/pages/home/home.dart';
import 'package:lg_music/pages/home/user_center.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => GlobalData()),
    ], 
    child: MaterialApp(
      home: const MainPage(),
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
    )
  );
    
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with AutomaticKeepAliveClientMixin {
  // 页面缓存
  @override
  bool get wantKeepAlive => true;

  // 底部导航栏
  final List<BottomNavigationBarItem> bottomNavigationBarItems = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
    const BottomNavigationBarItem(icon: Icon(Icons.music_note), label: '乐馆'),
    const BottomNavigationBarItem(icon: Icon(Icons.person), label: '个人中心')
  ];

  // 页面切换
  final PageController pageController = PageController();

  int currentIndex = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: ElevatedButton(
          onPressed: () => null,
          style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.grey[200]!),
              shape: WidgetStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)))),
          child: const Text('搜索'),
        ),
      ),
      body: PageView(
        controller: pageController,
        children: const [HomePage(), UserCenter()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavigationBarItems,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
          pageController.jumpToPage(index);
        },
      ),
    );
  }
}
