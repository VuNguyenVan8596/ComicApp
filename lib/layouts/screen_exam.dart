import 'package:CoraEnglish/datas/data_fake.dart';
import 'package:flutter/material.dart';

class ExamScreen extends StatelessWidget {
  final String title;
  ExamScreen({Key key, this.title}) : super(key: key);
  final List<DataQuestion> dataQuestion = fakeDataQuestion;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.assignment_turned_in),
            onPressed: () {
              _showResult(context);
            },
          )
        ],
      ),
      body: QuestionAnswer(arrayCauHoiDapAn: this.dataQuestion),
    );
  }

  void _showResult([BuildContext context, bool isDone = false]) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              backgroundColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
              ),
              contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 0),
              titlePadding: EdgeInsets.all(0),
              title: Container(
                child: Center(
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Answer Sheet",
                          style: TextStyle(color: Colors.white),
                        ))),
                decoration: BoxDecoration(
                    color: Colors.grey[600],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
              ),
              content: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                child: GridView.count(
                  childAspectRatio: 10,
                  crossAxisCount: 1,
                  children: List.generate(dataQuestion.length, (index) {
                    return Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Câu ${index + 1}: ',
                          style: TextStyle(color: Colors.orangeAccent),
                        ),
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipOval(
                              child: Material(
                                color: dataQuestion[index].dapAnDaChon == 1
                                    ? Colors.orange[800]
                                    : Colors.grey[850], // Button color
                                child: Container(
                                  child: SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: Center(
                                          child: Text('A',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              )))),
                                ),
                              ),
                            ),
                            ClipOval(
                              child: Material(
                                color: dataQuestion[index].dapAnDaChon == 2
                                    ? Colors.orange[800]
                                    : Colors.grey[850], // Button color
                                child: Container(
                                  child: SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: Center(
                                          child: Text(
                                        'B',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ))),
                                ),
                              ),
                            ),
                            ClipOval(
                              child: Material(
                                color: dataQuestion[index].dapAnDaChon == 3
                                    ? Colors.orange[800]
                                    : Colors.grey[850], // Button color
                                child: Container(
                                  child: SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: Center(
                                          child: Text(
                                        'C',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ))),
                                ),
                              ),
                            ),
                            ClipOval(
                              child: Material(
                                color: dataQuestion[index].dapAnDaChon == 4
                                    ? Colors.orange[800]
                                    : Colors.grey[850], // Button color
                                child: Container(
                                  child: SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: Center(
                                          child: Text(
                                        'D',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ))),
                                ),
                              ),
                            )
                          ],
                        ))
                      ],
                    )
                        // decoration: BoxDecoration(
                        //     color: index % 2 == 0
                        //         ? Colors.amber
                        //         : Colors.blue),
                        );
                  }),
                ),
              ),
            ));
  }
}

class QuestionAnswer extends StatefulWidget {
  final List<DataQuestion> arrayCauHoiDapAn;
  QuestionAnswer({@required this.arrayCauHoiDapAn});
  @override
  QuestionAnswerState createState() =>
      new QuestionAnswerState(arrayCauHoi: arrayCauHoiDapAn);
}

class QuestionAnswerState extends State<QuestionAnswer> {
  List<DataQuestion> arrayCauHoi;
  int pageCurrent;
  bool _isVisible;

  QuestionAnswerState({@required this.arrayCauHoi});

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    pageCurrent = 1;
    _isVisible = false;
    super.initState();
  }

  void _changeCurrentPage(int index) {
    setState(() {
      this.pageCurrent = index + 1;
      if (index == arrayCauHoi.length - 1) {
        this._isVisible = true;
      } else {
        this._isVisible = false;
      }
    });
  }

  void _showResult([BuildContext context, bool isDone = false]) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              backgroundColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
              ),
              contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 0),
              titlePadding: EdgeInsets.all(0),
              title: Container(
                child: Center(
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Answer Sheet",
                          style: TextStyle(color: Colors.white),
                        ))),
                decoration: BoxDecoration(
                    color: Colors.grey[600],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
              ),
              content: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                child: GridView.count(
                  childAspectRatio: 10,
                  crossAxisCount: 1,
                  children: List.generate(arrayCauHoi.length, (index) {
                    return Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Câu ${index + 1}: ',
                          style: TextStyle(color: Colors.orangeAccent),
                        ),
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipOval(
                              child: Material(
                                color: arrayCauHoi[index].dapAnDung == 1
                                    ? Colors.green
                                    : (arrayCauHoi[index].dapAnDaChon == 1
                                        ? Colors.orange[800]
                                        : Colors.grey[850]), // Button color
                                child: Container(
                                  child: SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: Center(
                                          child: Text('A',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              )))),
                                ),
                              ),
                            ),
                            ClipOval(
                              child: Material(
                                color: arrayCauHoi[index].dapAnDung == 2
                                    ? Colors.green
                                    : (arrayCauHoi[index].dapAnDaChon == 2
                                        ? Colors.orange[800]
                                        : Colors.grey[850]), // Button color
                                child: Container(
                                  child: SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: Center(
                                          child: Text(
                                        'B',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ))),
                                ),
                              ),
                            ),
                            ClipOval(
                              child: Material(
                                color: arrayCauHoi[index].dapAnDung == 3
                                    ? Colors.green
                                    : (arrayCauHoi[index].dapAnDaChon == 3
                                        ? Colors.orange[800]
                                        : Colors.grey[850]), // Button color
                                child: Container(
                                  child: SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: Center(
                                          child: Text(
                                        'C',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ))),
                                ),
                              ),
                            ),
                            ClipOval(
                              child: Material(
                                color: arrayCauHoi[index].dapAnDung == 4
                                    ? Colors.green
                                    : (arrayCauHoi[index].dapAnDaChon == 4
                                        ? Colors.orange[800]
                                        : Colors.grey[850]), // Button color
                                child: Container(
                                  child: SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: Center(
                                          child: Text(
                                        'D',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ))),
                                ),
                              ),
                            )
                          ],
                        ))
                      ],
                    ));
                  }),
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Expanded(
            child: new PageView.custom(
          onPageChanged: (value) => _changeCurrentPage(value),
          childrenDelegate: new SliverChildBuilderDelegate(
            (context, index) {
              return new Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            child: RichText(
                              text: TextSpan(
                                text: 'Question ${arrayCauHoi[index].id}: ',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                                children: [
                                  TextSpan(
                                      text: arrayCauHoi[index].cauHoi,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal)),
                                ],
                              ),
                            ),
                            padding: EdgeInsets.all(10),
                          ),
                        )),
                    Expanded(
                        child: Container(
                      child: ListView(
                        children: arrayCauHoi[index]
                            .dapAn
                            .map((data) => RadioListTile(
                                  title: Text(String.fromCharCode(
                                          64 + data.keys.first) +
                                      '. ' +
                                      data.values.first),
                                  groupValue: arrayCauHoi[index].dapAnDaChon,
                                  value: data.keys.first,
                                  onChanged: (val) {
                                    setState(() {
                                      arrayCauHoi[index].dapAnDaChon = val;
                                    });
                                  },
                                ))
                            .toList(),
                      ),
                    )),
                    Visibility(
                      visible: _isVisible,
                      child: Container(
                          margin: EdgeInsets.all(2),
                          child: Center(
                            child: FlatButton(
                              child: Text(
                                'Done',
                                style: TextStyle(fontSize: 20.0),
                              ),
                              color: Colors.blueAccent,
                              textColor: Colors.white,
                              onPressed: () {
                                _showResult(context);
                              },
                            ),
                          )),
                    )
                  ],
                ),
              );
            },
            childCount: arrayCauHoi.length,
          ),
        )),
        Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Q: ' + this.pageCurrent.toString(),
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                    children: [
                      TextSpan(
                        text: "/" + arrayCauHoi.length.toString(),
                      )
                    ],
                  ),
                ),
              ],
            ))
      ],
    ));
  }
}
