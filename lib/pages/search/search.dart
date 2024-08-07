import 'package:flutter/material.dart';
import 'package:lg_music/provider/search/search_suggest.dart';
import 'package:lg_music/pages/search/search_result.dart';
import 'package:provider/provider.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController();

    return Scaffold(
        appBar: AppBar(
            title: Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              // 搜索框
              child: TextField(
                controller: textEditingController,
                decoration: const InputDecoration(
                  hintText: '搜索',
                  border: InputBorder.none,
                ),
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  // 判断搜索框是否为空
                  // 搜索框不为空则跳转到搜索结果页面，搜索框为空则不跳转
                  if (textEditingController.text.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchResultPage(
                              searchKeyword: textEditingController.text)),
                    );
                  }
                },
              ),
            ]),
        body: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ListView(
            children: [
              // TODO: 搜索历史
              Consumer(builder: (BuildContext context,SearchSuggestProvider provider,Widget? child) {
                return Offstage(
                  offstage: provider.showSuggest,
                  child: ListView.builder(itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(provider.searchSuggest[index],),
                      onTap: () => Navigator.push(context, 
                      MaterialPageRoute(builder: (context) => SearchResultPage(searchKeyword: provider.searchSuggest[index]))),
                      );
                  }, 
                  itemCount: provider.searchSuggest.length, 
                  shrinkWrap: true, 
                  ),
                );
              },)

              // TODO: 搜索结果
            ],
          ),
        ));
  }
}
