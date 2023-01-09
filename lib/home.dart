import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _resetFields(){
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculateur d'IMC"),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
        actions: <Widget>[
          IconButton(onPressed: _resetFields, icon:Icon( Icons.refresh))
        ],
      ),
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16.0, 8.0, 8.0, 8.0),
        child: Form(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text("Poids", style: TextStyle(
                      color: Colors.greenAccent,
                      fontSize: 24,
                    ),
                  ),
                  Expanded(
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(30, 30, 10, 10),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 0.2,
                              blurRadius: 1,
                              offset: const Offset(1, 3),
                            ),
                          ],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(50.0),
                          )
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            contentPadding:
                              const EdgeInsets.fromLTRB(20, 10, 20, 10),
                            hintText: "00.0",
                            hintStyle: const TextStyle(fontSize: 20.0, color: Colors.black26),
                            suffixIcon: const Text(
                              'KG',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.greenAccent,
                            ),
                          ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              borderSide: const BorderSide(width: 0, style: BorderStyle.none,
                              ),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                        ),
                      ),
                  ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text("Taille", style: TextStyle(
                    color: Colors.greenAccent,
                    fontSize: 24,
                  ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(30, 30, 10, 10),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 0.2,
                              blurRadius: 1,
                              offset: const Offset(1, 3),
                            ),
                          ],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(50.0),
                          )
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          contentPadding:
                          const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          hintText: "0.0",
                          hintStyle: const TextStyle(fontSize: 20.0, color: Colors.black26),
                          suffixIcon: const Text(
                            'M',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.greenAccent,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide: const BorderSide(width: 0, style: BorderStyle.none,
                            ),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 30, 0, 20),
                child: ElevatedButton(
                  onPressed: (){
                  },
                  child: const Padding(padding: EdgeInsets.all(10.0),
                    child: Text("Calculer",style: TextStyle(fontSize: 20),),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.greenAccent,),
                ),
              )
              Column(
                children: <Widget>[],
              )
            ],
          ),
        ),
      ),
    );
  }
}
