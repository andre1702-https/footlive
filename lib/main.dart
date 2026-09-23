import 'dart:async'; // Importa o Timer, usado para aguardar antes da navegação.
import 'package:flutter/material.dart'; // Importa os componentes visuais do Flutter.

void main() { // Define o ponto de entrada do aplicativo.
  runApp(const FootliveApp()); // Inicializa o aplicativo com o widget FootliveApp.
} // Encerra a função main.

class FootliveApp extends StatelessWidget { // Cria o widget principal, que não guarda estado mutável.
  const FootliveApp({super.key}); // Define o construtor do widget e recebe uma chave opcional.

  @override // Indica que este método implementa um método da classe base.
  Widget build(BuildContext context) { // Descreve a interface principal do aplicativo.
    return const MaterialApp( // Cria o contêiner principal do aplicativo.
      debugShowCheckedModeBanner: false, // Remove a faixa de modo de depuração.
      home: SplashScreen(), // Define a splash como primeira tela do aplicativo.
    ); // Encerra a configuração do MaterialApp.
  } // Encerra o método build.
} // Encerra a classe FootliveApp.

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _ballPosition;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _ballPosition = Tween<Offset>(
      begin: const Offset(-2, 2), // Começa deslocada para cima e para a esquerda.
      end: Offset.zero, // Termina na posição central.
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    _playAnimation();
  }

  Future<void> _playAnimation() async {
    await _controller.forward();

    if (!mounted) return;

    await Future<void>.delayed(const Duration(milliseconds: 300));

    if (!mounted) return;

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => const HomeScreen(),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF061947),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              'assets/Frame 1.png',
              width: 250,
              fit: BoxFit.contain,
            ),
            SlideTransition(
              position: _ballPosition,
              child: const Icon(
                Icons.sports_soccer,
                size: 130,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget { // Cria um exemplo de tela inicial sem estado mutável.
  const HomeScreen({super.key}); // Define o construtor da tela inicial.

  @override // Indica que este método implementa o método de construção da interface.
  Widget build(BuildContext context) { // Descreve os elementos da tela inicial.
    return Scaffold( // Cria a estrutura básica da tela inicial.
      appBar: AppBar( // Adiciona uma barra superior.
        title: const Text('Footlive'), // Exibe o nome do aplicativo na barra.
      ), // Encerra a configuração da barra superior.
      body: const Center( // Centraliza o conteúdo da tela inicial.
        child: Text('Tela inicial'), // Mostra um texto de exemplo.
      ), // Encerra o conteúdo centralizado.
    ); // Encerra a estrutura da tela inicial.
  } // Encerra o método build.
} // Encerra a classe HomeScreen.