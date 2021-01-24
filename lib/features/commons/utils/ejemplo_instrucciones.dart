import 'package:flutter/material.dart';

main(List<String> args) {
  DemoInstruccionesControl().pruebaInstrucciones();
}

enum L { VALOR1 }
const M = [L.VALOR1];
const String P = "CONST";

class DemoInstruccionesControl {
  static final String r = "";
  static const String u = "";
  void definicionVariables() {
    String a = "hola";
    int b = 1;
    double c = 2.0;
    num d = 2.0;
    bool e = true;
    List<String> f = ["hola"];
    List u = ["hola"];
    Map<String, String> g = {"key": "valor"};
    final h = "";
    final String i = "";
    dynamic j = "";
    dynamic k = ["aaa"];

    Widget o = Container();
    DateTime p = DateTime.now(); //fecha y hora actual
    String Function(String nombre, String apellido) fun = saludo;
  }

  String saludo(String nombre, String apellido) {
    return "$nombre $apellido";
  }

  void pruebaInstrucciones() {
    int numero1 = 10, numero2 = 20;
    String usuario1 = "paco", usuario2 = "daniel";
    print("uso del if else");
    if (numero1 > numero2) {
      print("$numero1 es mayor $numero2");
    } else {
      print("$numero2 es mayor $numero1");
    }
    print("uso del if con condiciones OR y AND");
    if (numero1 > numero2 || (usuario1 == "paco" && usuario2 == "daniel")) {
      print("si");
    } else {
      print("no");
    }
    print("uso del for");
    int max = 10;
    for (int i = 0; i < max; i++) {
      print(i + 1);
    }
    print("uso del for en una lista de datos");
    List<int> valores = [1, 2, 3, 4, 5, 20];
    for (int val in valores) {
      print(val);
    }

    print("uso del for con programacion funcional");
    valores.forEach((element) {
      print(element);
    });

    print("uso del while");
    int contador = 0;
    bool bandera = true;
    while (bandera) {
      if (contador == 10) {
        bandera = false;
      }
      print(contador);
      contador++;
    }
    print("uso del switch");
    String valor = "frio";
    switch (valor) {
      case "comida":
        print("vamo a comer");
        break;
      case "frio":
        print("vamo a brigarno");
        break;
      case "enojo":
        print("vamo a peliarno");
        break;
      case P:
        print("otro!");
        break;
      default:
        print("ninguno");
    }
  }

  String funcionNormal(String campo) {
    return "HOLA";
  }

  Future<String> funcionValorFuturo(String campo) async {
    return "HOLA";
  }

  Stream<String> funcionValorStream(String campo) async* {
    yield "iniciando la carga";
    await Future.delayed(Duration(seconds: 2));
    yield "carga al 10%";
    await Future.delayed(Duration(seconds: 2));
    yield "carga al 50%";
    await Future.delayed(Duration(seconds: 2));
    yield "carga al 100%";
    await Future.delayed(Duration(seconds: 2));
    yield "Finalizado con exito!";
  }

  void funcionAnonimaSimple() {
    //declaracion de la funcion
    var funcion = () {
      return "HOLA";
    };
    print(funcion());
  }

  void funcionAnonimaConParametrosNombrados() {
    //declaracion de la funcion
    var funcion = ({String campo1, String campo2}) async {
      return "valores: $campo1, $campo2";
    };
    print(funcion(campo1: "hola", campo2: "mundo"));
  }

  void funcionAnonimaConParametrosYParametrosNombrados() {
    //declaracion de la funcion
    var funcion = (campo1, {String campo2, String campo3}) {
      return "valores: $campo1, $campo2, $campo3";
    };
    print(funcion("hola", campo2: "hola", campo3: "!!!!"));
  }

  void funcionAnonimaConParametrosNombradosRequeridos() {
    //declaracion de la funcion
    var funcion = (campo1, {String campo2, @required String campo3}) {
      return "valores: $campo1, $campo2, $campo3";
    };
    print(funcion("hola", campo3: "!!!!"));
  }

  void funcionAnonimaConParametrosNombradosYDefault() {
    //declaracion de la funcion
    var funcion = (campo1, {String campo2, String campo3 = "No viene"}) {
      return "valores: $campo1, $campo2, $campo3";
    };
    print(funcion("hola", campo2: "hola", campo3: "!!!!"));
  }
}

//Ejemplos con clases
class Vuela {
  void volar() {
    print("volando!");
  }
}

class Nada {
  void nadar() {
    print("nadando");
  }
}

class Camina {
  void caminar() {
    print("caminando");
  }
}

//herencia
class Gallina extends Camina {
  void hacerDeTodo() {
    caminar();
  }
}

//mixin's
class Pato with Vuela, Nada, Camina {
  void hacerDeTodo() {
    caminar();
    nadar();
    volar();
  }
}

//clase abstracta (equivalente a interfaces)
abstract class Crud<T> {
  T insert(T data);
  T update(T data);
  bool delete(T data);
  T findOne(dynamic data);
}

//implementación de clase abstracta en la definicion de un servicio
abstract class GallinasFromService implements Crud<Gallina> {
  bool delete(Gallina data);
  Gallina findOne(data);
  Gallina insert(Gallina data);
  Gallina update(Gallina data);
}

class GallinasFromServiceImpl implements GallinasFromService {}
