import 'package:flutter/material.dart';

class RankingScreen extends StatelessWidget {
  const RankingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorMain = const Color(0xFF2F5961);

    final List<Map<String, dynamic>> rankings = [
      {'nome': 'Alfredo', 'pontuacao': 1820},
      {'nome': 'Luana', 'pontuacao': 1820},
      {'nome': 'João', 'pontuacao': 1740},
      {'nome': 'Camila', 'pontuacao': 1675},
      {'nome': 'Mateus', 'pontuacao': 1620},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ranking'),
        backgroundColor: colorMain,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
        child: Column(
          children: [
            const Text(
              'Top Heróis',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF2F5961)),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemCount: rankings.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final user = rankings[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: colorMain.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: colorMain),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: colorMain,
                              child: Text(
                                '${index + 1}',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              user['nome'],
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Text(
                          '${user['pontuacao']} pts',
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
