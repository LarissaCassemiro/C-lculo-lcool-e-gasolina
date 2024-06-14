import 'package:flutter/material.dart';

main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner:false,
      title: 'Alcool ou Gasolina',
      home: Calc(),
    );
  }
}

class Calc extends StatefulWidget {
  @override
  _CalcState createState() => _CalcState();
}

class _CalcState extends State<Calc> {
  TextEditingController _controlAlcool = TextEditingController();
  TextEditingController _controlGasolina = TextEditingController();
  String _resultado = '';

  void _calcular() {
    var alcool = double.tryParse(_controlAlcool.text);
    var gasolina = double.tryParse(_controlGasolina.text);
	
	/*
	AQUI IMPLEMENTAREMOS TODA A LÓGICA 
	
	1 - VERIFICAR SE OS VALORES NÃO SÃO NULOS
	2 - A fórmula é dividir o preço do etanol pelo da gasolina,
	Se o resultado dessa divisão for maior que 0,7, é mais vantajoso abastecer com gasolina.
	*/
    if(alcool ==null || gasolina ==null) {
      _resultado = 'Digite algo para ser calculado';
    }
    
     else if(alcool/gasolina > 0.7){
    _resultado =  'É mais vantajoso abastacer com gasolina';
    }
    else if (alcool/gasolina < 0.7){
      _resultado='É mais vantajoso abastecer com álcool';
    }
    
    setState(() {
      _resultado;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Álcool ou Gasolina'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
          padding: EdgeInsets.all(15),
          child: ListView(
            children: <Widget>[
              Image.network(
                 'https://play-lh.googleusercontent.com/N14whk_Ez-j6rSbkFUF8THC11vzTH2HdSWqQO8CiT8p3RrAfodUASk43lKrSGqujRbI',
               width: 200,
               height: 200,
              ),
              Text(
                'Saiba qual é a melhor opção para abastecimento do seu carro',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.blue,
                  //backgroundColor: Colors.black12,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Preço do Àlcool:',
                  labelStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.black12,
                  ),
                ),
                controller: _controlAlcool,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Preço da Gasolina:',
                  labelStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.black12,
                  ),
                ),
                controller: _controlGasolina,
              ),
              TextButton(
                child: Text(
                  'CALCULAR',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                onPressed: _calcular,
                style: TextButton.styleFrom(
                  foregroundColor: Colors.red,
                  elevation: 2,
                  backgroundColor: Colors.blue),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  _resultado,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}


