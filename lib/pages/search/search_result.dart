import 'package:flutter/material.dart';

class SearchResultPage extends StatelessWidget{
  String searchKeyword;
  SearchResultPage({super.key, required this.searchKeyword});

  bool show = false; // 是否显示搜索结果
  
  List<Widget> resultList = []; // 搜索结果列表
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('搜索结果'),
      ),
      body: Column(
        children: [
          Offstage(
            offstage: !show,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          Offstage(
            offstage: show,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(resultList[index].toString()),
                  onTap: () {
                    // 处理点击事件
                  },
                );
              },
              itemCount: resultList.length,
              ),
          )
        ],
      )
    );
  }
  
}