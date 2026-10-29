
import 'package:flutter/material.dart';

const Color azulFundo = Color(0xFF001749);
const Color azulCartao = Color(0xFF002065);
const Color branco = Colors.white;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int itemSelecionado = 1;

  final List<Map<String, String>> placares = [
    {
      'casa': 'FLA',
      'fora': 'CAM',
      'placar': '0 - 2',
    },
    {
      'casa': 'SAO',
      'fora': 'PAL',
      'placar': '1 - 0',
    },
    {
      'casa': 'SAN',
      'fora': 'COR',
      'placar': '2 - 1',
    },
    {
      'casa': 'GRE',
      'fora': 'INT',
      'placar': '1 - 1',
    },
  ];

  final List<Map<String, String>> noticias = [
    {
      'categoria': 'Brasileirão',
      'titulo': 'Disputa pelo topo da tabela fica cada vez mais acirrada',
      'resumo':
          'As equipes seguem na briga pelas primeiras posições. '
          'Cada rodada pode mudar a classificação do campeonato.',
      'tempo': 'Há 20 minutos',
    },
    {
      'categoria': 'Mercado da bola',
      'titulo': 'Clubes começam a planejar os próximos reforços',
      'resumo':
          'As diretorias avaliam o elenco e buscam alternativas '
          'para fortalecer os times na sequência da temporada.',
      'tempo': 'Há 1 hora',
    },
    {
      'categoria': 'Destaque da rodada',
      'titulo': 'Torcida aguarda confrontos importantes do fim de semana',
      'resumo':
          'Os próximos jogos prometem movimentar a tabela e '
          'podem ser decisivos para os objetivos dos clubes.',
      'tempo': 'Há 3 horas',
    },
  ];

  final List<Map<String, String>> jogos = [
    {
      'casa': 'São Paulo',
      'fora': 'Grêmio',
      'data': '12/09',
      'horario': '16:00',
      'estadio': 'Morumbi',
    },
    {
      'casa': 'Santos',
      'fora': 'Flamengo',
      'data': '12/09',
      'horario': '19:00',
      'estadio': 'Vila Belmiro',
    },
    {
      'casa': 'Corinthians',
      'fora': 'Palmeiras',
      'data': '12/09',
      'horario': '20:00',
      'estadio': 'Neo Química Arena',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: azulFundo,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            _cabecalho(),
            const SizedBox(height: 12),
            _listaPlacares(),
            const SizedBox(height: 12),
            _atalhos(),
            const SizedBox(height: 12),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                children: [
                  _tituloSecao(
                    'Notícias',
                    acao: 'Ver todas',
                    onTap: _abrirTodasNoticias,
                  ),

                  const SizedBox(height: 12),

                  ...noticias.map(
                    (noticia) => _cartaoNoticia(noticia),
                  ),

                  const SizedBox(height: 8),

                  _tituloSecao('Próximos jogos'),

                  const SizedBox(height: 12),

                  ...jogos.map(
                    (jogo) => _cartaoJogo(jogo),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _barraInferior(),
    );
  }

  // Cabeçalho sem imagens.
  Widget _cabecalho() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      child: Row(
        children: [
          Container(
            width: 58,
            height: 58,
            decoration: const BoxDecoration(
              color: azulCartao,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.person,
              color: branco,
              size: 34,
            ),
          ),

          const SizedBox(width: 12),

          const Expanded(
            child: Text(
              'Início',
              style: TextStyle(
                color: branco,
                fontSize: 30,
              ),
            ),
          ),

          IconButton(
            tooltip: 'Pesquisar',
            onPressed: () {
              _mostrarMensagem('Pesquisa em desenvolvimento.');
            },
            icon: const Icon(
              Icons.search,
              color: branco,
              size: 32,
            ),
          ),

          const Icon(
            Icons.shield_outlined,
            color: branco,
            size: 38,
          ),
        ],
      ),
    );
  }

  // Placares horizontais sem escudos.
  Widget _listaPlacares() {
    return SizedBox(
      height: 88,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: placares.length,
        separatorBuilder: (_, __) =>
            const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final jogo = placares[index];

          return Container(
            width: 108,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: azulCartao,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      jogo['casa']!,
                      style: const TextStyle(
                        color: branco,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    const Text(
                      ' x ',
                      style: TextStyle(color: branco),
                    ),
                    Text(
                      jogo['fora']!,
                      style: const TextStyle(
                        color: branco,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Text(
                  jogo['placar']!,
                  style: const TextStyle(
                    color: branco,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Atalhos de navegação.
  Widget _atalhos() {
    final opcoes = [
      'Próximos Jogos',
      'Notícias',
      'Estatísticas',
      'Tabela',
    ];

    return SizedBox(
      height: 42,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: opcoes.length,
        separatorBuilder: (_, __) =>
            const SizedBox(width: 8),
        itemBuilder: (context, index) {
          return ActionChip(
            backgroundColor: azulCartao,
            side: BorderSide.none,
            label: Text(
              opcoes[index],
              style: const TextStyle(
                color: branco,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              if (index == 0) {
                _mostrarMensagem('Próximos jogos selecionados.');
              } else if (index == 1) {
                _mostrarMensagem('Você está na seção de notícias.');
              } else if (index == 2) {
                _mostrarMensagem('Estatísticas em desenvolvimento.');
              } else {
                _mostrarMensagem('Tabela em desenvolvimento.');
              }
            },
          );
        },
      ),
    );
  }

  // Título das seções.
  Widget _tituloSecao(
    String titulo, {
    String? acao,
    VoidCallback? onTap,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          titulo,
          style: const TextStyle(
            color: branco,
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (acao != null)
          TextButton(
            onPressed: onTap,
            child: Text(
              acao,
              style: const TextStyle(color: Colors.white70),
            ),
          ),
      ],
    );
  }

  // Cartão de notícia sem imagem.
  Widget _cartaoNoticia(Map<String, String> noticia) {
    return Card(
      color: azulCartao,
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () => _abrirNoticia(noticia),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.article_outlined,
                    color: Colors.lightBlueAccent,
                    size: 19,
                  ),
                  const SizedBox(width: 7),
                  Expanded(
                    child: Text(
                      noticia['categoria']!,
                      style: const TextStyle(
                        color: Colors.lightBlueAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Text(
                    noticia['tempo']!,
                    style: const TextStyle(
                      color: Colors.white60,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              Text(
                noticia['titulo']!,
                style: const TextStyle(
                  color: branco,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  height: 1.3,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                noticia['resumo']!,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 10),

              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Ler notícia',
                    style: TextStyle(
                      color: branco,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 5),
                  Icon(
                    Icons.arrow_forward,
                    color: branco,
                    size: 17,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Abre a notícia completa.
  void _abrirNoticia(Map<String, String> noticia) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => NoticiaDetalheScreen(noticia: noticia),
      ),
    );
  }

  // Tela com todas as notícias.
  void _abrirTodasNoticias() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => TodasNoticiasScreen(noticias: noticias),
      ),
    );
  }

  // Cartão de jogo sem escudos.
  Widget _cartaoJogo(Map<String, String> jogo) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: azulCartao,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              jogo['casa']!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: branco,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Expanded(
            child: Column(
              children: [
                Text(
                  jogo['data']!,
                  style: const TextStyle(
                    color: branco,
                    fontSize: 12,
                  ),
                ),
                Text(
                  jogo['horario']!,
                  style: const TextStyle(
                    color: branco,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  jogo['estadio']!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: Text(
              jogo['fora']!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: branco,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Barra inferior.
  Widget _barraInferior() {
    return SafeArea(
      top: false,
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 4, 16, 12),
        height: 68,
        decoration: BoxDecoration(
          color: azulCartao,
          borderRadius: BorderRadius.circular(36),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              tooltip: 'Menu',
              onPressed: () {
                setState(() => itemSelecionado = 0);
                _mostrarMensagem('Menu em desenvolvimento.');
              },
              icon: Icon(
                Icons.format_list_bulleted,
                color: itemSelecionado == 0
                    ? branco
                    : Colors.white70,
                size: 32,
              ),
            ),

            GestureDetector(
              onTap: () {
                setState(() => itemSelecionado = 1);
              },
              child: Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: itemSelecionado == 1
                      ? branco
                      : azulCartao,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.home_rounded,
                  color: itemSelecionado == 1
                      ? azulFundo
                      : branco,
                  size: 38,
                ),
              ),
            ),

            IconButton(
              tooltip: 'Favoritos',
              onPressed: () {
                setState(() => itemSelecionado = 2);
                _mostrarMensagem('Favoritos em desenvolvimento.');
              },
              icon: Icon(
                Icons.favorite,
                color: itemSelecionado == 2
                    ? branco
                    : Colors.white70,
                size: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _mostrarMensagem(String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensagem),
        backgroundColor: azulCartao,
      ),
    );
  }
}

// Tela de leitura completa de uma notícia.
class NoticiaDetalheScreen extends StatelessWidget {
  final Map<String, String> noticia;

  const NoticiaDetalheScreen({
    super.key,
    required this.noticia,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: azulFundo,
      appBar: AppBar(
        backgroundColor: azulFundo,
        foregroundColor: branco,
        title: const Text('Notícia'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              noticia['categoria']!,
              style: const TextStyle(
                color: Colors.lightBlueAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              noticia['titulo']!,
              style: const TextStyle(
                color: branco,
                fontSize: 26,
                fontWeight: FontWeight.bold,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              noticia['tempo']!,
              style: const TextStyle(color: Colors.white60),
            ),
            const Divider(
              color: Colors.white24,
              height: 32,
            ),
            Text(
              noticia['resumo']!,
              style: const TextStyle(
                color: branco,
                fontSize: 17,
                height: 1.7,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Conteúdo demonstrativo do Footlive. '
              'As notícias exibidas neste protótipo são fictícias '
              'e deverão ser substituídas por conteúdo real '
              'quando a integração com uma fonte de notícias for feita.',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 15,
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Lista completa das notícias cadastradas.
class TodasNoticiasScreen extends StatelessWidget {
  final List<Map<String, String>> noticias;

  const TodasNoticiasScreen({
    super.key,
    required this.noticias,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: azulFundo,
      appBar: AppBar(
        backgroundColor: azulFundo,
        foregroundColor: branco,
        title: const Text('Todas as notícias'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: noticias.length,
        itemBuilder: (context, index) {
          final noticia = noticias[index];

          return Card(
            color: azulCartao,
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              title: Text(
                noticia['titulo']!,
                style: const TextStyle(
                  color: branco,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  '${noticia['categoria']} • ${noticia['tempo']}',
                  style: const TextStyle(color: Colors.white70),
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: branco,
                size: 18,
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => NoticiaDetalheScreen(
                      noticia: noticia,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
