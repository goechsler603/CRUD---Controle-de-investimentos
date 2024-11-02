import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Certifique-se de que o caminho está correto
import 'cadastrar_transacao_screen.dart'; // Importe sua tela de cadastro
import 'visualizartransacoesscreen.dart'; // Importe sua tela de visualização

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  print("Firebase inicializado com sucesso!"); // Adicione este print
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            _welcomeMessage(),
            SizedBox(height: 24),
            Text(
              'Selecione a opção desejada',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Aqui você verá tudo que precisa:',
              style: TextStyle(color:  Color(0xFF999fa9)),
            ),
            SizedBox(height: 24),
            _optionCard(
              icon: Icons.savings,
              title: 'Patrimônio',
              subtitle: 'R\$ 143,00',
              iconColor: Color(0xFF25bddc),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VisualizarTransacoesScreen()),
                );
              },
            ),
            SizedBox(height: 16),
            _investButton(context),
          ],
        ),
      ),
    );
  }

  Widget _welcomeMessage() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color:  Color(0xFF60cde2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        'Bem vindo\nUsuário!',
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }

  Widget _optionCard({required IconData icon, required String title, String subtitle = '', required Color iconColor, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 120,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color(0xFF0c506f),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: iconColor),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            if (subtitle.isNotEmpty)
              Text(
                subtitle,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
          ],
        ),
      ),
    );
  }

  Widget _investButton(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CadastrarTransacaoScreen()),
        );
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 120,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color(0xFF0c506f),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.attach_money, size: 48, color: Color(0xFF60cde2)),
            SizedBox(height: 8),
            Text(
              'Investir',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
