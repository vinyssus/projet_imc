import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
 TextEditingController weightController = TextEditingController();
 TextEditingController heightController = TextEditingController();
 GlobalKey<FormState> _formkey = GlobalKey<FormState>();

 String _infoText = 'Renseignez vos données';
 double _imc = 0.0;
 Color _textColor = Colors.white;

 bool _notZero = false;

  void _resetFields(){
    weightController.text = "";
    heightController.text = "";
    setState(() {
    _infoText = "";
    _formkey = GlobalKey<FormState>();
    _notZero = false;
    });
  }

  void _calculateIMC(){
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text);
      _notZero = true;
      if(_imc < 18.5){
        _infoText = 'MINCE';
        _textColor = Colors.purple;
      }else if(_imc >= 18.5 && _imc < 25.9){
        _infoText = 'EN BONNE SANTE';
        _textColor = Colors.greenAccent;
      }else if(_imc >= 25.9 && _imc < 29.9){
        _infoText = 'EN SURPOIDS';
        _textColor = Colors.orangeAccent;
      }else if(_imc >= 29.9){
        _infoText = 'OBESITE';
        _textColor = Colors.pink;
      }
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
          key: _formkey,
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
                          controller: weightController,
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Entrer votre poids!';
                            }
                          },
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
                        controller: heightController,
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Entrer votre poids!';
                          }
                        },
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          contentPadding:
                          const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          hintText: "0.00",
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
                    if(_formkey.currentState!.validate()){
                      _calculateIMC();
                    }
                  },
                  child: const Padding(padding: EdgeInsets.all(10.0),
                    child: Text("Calculer",style: TextStyle(fontSize: 20),),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.greenAccent,),
                ),
              ),
              Column(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("VOUS ETES", style: TextStyle(color:Colors.black26,fontSize: 18,),),),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(_infoText,style: TextStyle(color:_textColor,fontSize: 26),),
                      ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
