import 'dart:io';

//função principal, chamando todas as outras funções
void main() {
  bemvindo();
  double workedHours = horas();
  double salarioBruto = calcSalarioBruto(workedHours);
  double inss = calcInss(salarioBruto);
  double iprf = calcIprf(salarioBruto - inss);
  double salarioLiquido = salarioBruto - (inss + iprf);
  folhaPagamento ( salarioBruto,  inss,  iprf,  salarioLiquido);
  }

//função de boas-vindas
void bemvindo() {
  print("Bem-vindo ao sistema de notas");
}

//função para obter a quantidade de horas trabalhadas
double horas() {
  print("Digite a quantidade de horas trabalhadas: ");
  String? input = stdin.readLineSync();
  double? hours = double.tryParse(input ?? '');
  return hours ?? 0;
}

//multiplica a quantidade de horas trabalhadas pelo valor da hora
double calcSalarioBruto(double horas) {
  const double valorHora = 40;
  return horas * valorHora;
}

//calcula o desconto do INSS
double calcInss(double salario) {
  if (salario <= 1518.00) return salario * 0.075;
  if (salario >= 1518.01 && salario <= 2783.88) return salario * 0.09;
  if (salario >= 2783.89 && salario <= 4190.83) return salario * 0.12;
  return salario * 0.14;
}

//calcula o desconto do imposto de renda
double calcIprf(double salarioBase){
  if (salarioBase <= 2259.20) return salarioBase * 0;
  if (salarioBase > 2259.20 && salarioBase <= 2826.65) return salarioBase * 0.075;
  if (salarioBase > 2826.65 && salarioBase <= 3751.05) return salarioBase * 0.15;
  if (salarioBase > 3751.05 && salarioBase <= 4664.68) return salarioBase * 0.225;
  return salarioBase * 0.275;
}

//retorna a folha de pagamento com todas as informações
void folhaPagamento (double salarioBruto, double inss, double iprf, double salarioLiquido){
  print('Aqui está sua folha de pagamento:');
  print('--------------------------------');
  print('Salario Bruto: $salarioBruto');

  if (inss > 0) print('INSS: $inss');
  if (iprf > 0) print('IRPF: $iprf');

  print('Seu salário líquido é: R\$ $salarioLiquido ');


}