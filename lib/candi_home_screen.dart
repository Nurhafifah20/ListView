import 'package:flutter/material.dart';

class CandiHomeScreen extends StatefulWidget {
  @override
  _CandiHomeScreenState createState() => _CandiHomeScreenState();
}

class _CandiHomeScreenState extends State<CandiHomeScreen> {
  List<String> buildList = [
    'Candi Prambanan',
    'Candi Borobudur',
    'Candi Muara Takus',
    'Candi Mendut',
    'Candi Gedong Songo',
    'Candi Kalasan',
    'Candi Dieng',
    'Candi Arca Gupolo',
    'Candi Brahu',
    'Candi Muaro Jambi',
    'Candi Sewu',
    'Candi Plaosan',
    'Candi Jago',
    'Candi Penataran',
    'Candi Pawon',
    'Candi Kidal',
    'Candi Cangkuang',
  ];

  List<String>? buildListSearch;
  final FocusNode _textFocusNode = FocusNode();
  TextEditingController? _textEditingController = TextEditingController();
  @override
  void dispose() {
    _textFocusNode.dispose();
    _textEditingController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 212, 165, 8),
            title: Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 245, 205, 75),
                  borderRadius: BorderRadius.circular(20)),
              child: TextField(
                controller: _textEditingController,
                focusNode: _textFocusNode,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: 'Search here',
                    contentPadding: EdgeInsets.all(8)),
                onChanged: (value) {
                  setState(() {
                    buildListSearch = buildList
                        .where(
                            (element) => element.contains(value.toLowerCase()))
                        .toList();
                    if (_textEditingController!.text.isNotEmpty &&
                        buildListSearch!.length == 0) {
                      print(
                          'buildListSearch length ${buildListSearch!.length}');
                    }
                  });
                },
              ),
            )),
        body: _textEditingController!.text.isNotEmpty &&
                buildListSearch!.length == 0
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.search_off,
                          size: 160,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Data tidak ditemukan, \nSilahkan cari dengan keyword lain',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : ListView.builder(
                itemCount: _textEditingController!.text.isNotEmpty
                    ? buildListSearch!.length
                    : buildList.length,
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          child: Icon(Icons.food_bank),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(_textEditingController!.text.isNotEmpty
                            ? buildListSearch![index]
                            : buildList[index]),
                      ],
                    ),
                  );
                }));
  }
}
