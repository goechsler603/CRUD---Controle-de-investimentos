import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CadastrarTransacaoScreen extends StatefulWidget {
  @override
  _CadastrarTransacaoScreenState createState() => _CadastrarTransacaoScreenState();
}

class _CadastrarTransacaoScreenState extends State<CadastrarTransacaoScreen> {
  String? selectedTransactionType;
  String? selectedBroker;
  String ativo = '';
  int quantidade = 0;
  double preco = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF60CDE2)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cadastrar transação',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24),
            _buildTextField(label: 'Ativo', hint: 'Digite um ativo...', onChanged: (value) {
              ativo = value;
            }),
            SizedBox(height: 16),
            Text('Transação'),
            Row(
              children: [
                _buildRadioButton(title: 'Compra', value: 'compra'),
                _buildRadioButton(title: 'Venda', value: 'venda'),
              ],
            ),
            SizedBox(height: 16),
            _buildDropdown(label: 'Corretora', hint: 'Selecione sua corretora'),
            SizedBox(height: 16),
            _buildTextField(
              label: 'Quantidade',
              hint: 'Ex: 100',
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onChanged: (value) {
                quantidade = int.tryParse(value) ?? 0; // Converte para inteiro
              },
            ),
            SizedBox(height: 16),
            _buildTextField(
              label: 'Preço',
              hint: 'R\$',
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
              ],
              onChanged: (value) {
                preco = double.tryParse(value) ?? 0.0; // Converte para double
              },
            ),
            SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: _saveTransaction,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF999fa9),
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text('Cadastrar', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _saveTransaction() async {
    if (ativo.isEmpty || selectedTransactionType == null || selectedBroker == null || quantidade <= 0 || preco <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Por favor, preencha todos os campos.'),
      ));
      return;
    }

    try {
      await FirebaseFirestore.instance.collection('transacoes').add({
        'ativo': ativo,
        'tipoTransacao': selectedTransactionType,
        'corretora': selectedBroker,
        'quantidade': quantidade,
        'preco': preco,
        'data': FieldValue.serverTimestamp(), // Use o timestamp do servidor
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Transação cadastrada com sucesso!'),
      ));
      Navigator.pop(context); // Retorna à tela anterior após o cadastro
    } catch (e) {
      print("Erro ao cadastrar transação: $e");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Erro ao cadastrar transação: ${e.toString()}'),
      ));
    }
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
    List<TextInputFormatter>? inputFormatters,
    required Function(String) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(height: 8),
        TextField(
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown({required String label, required String hint}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(height: 8),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          items: ['Corretora 1', 'Corretora 2', 'Corretora 3'] // Exemplo de opções
              .map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedBroker = value;
            });
          },
        ),
      ],
    );
  }

  Widget _buildRadioButton({required String title, required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Radio<String>(
          value: value,
          groupValue: selectedTransactionType,
          onChanged: (String? newValue) {
            setState(() {
              selectedTransactionType = newValue;
            });
          },
        ),
        Text(title),
      ],
    );
  }
}
