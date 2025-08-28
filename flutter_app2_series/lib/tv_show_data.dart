import 'package:flutter/material.dart';
import 'package:flutter_app2_series/rating_widget.dart';
import 'package:flutter_app2_series/tv_show_model.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TvShowCard extends StatelessWidget {
  const TvShowCard({
    super.key,
    required this.tvShow,
    required this.index,
    // required this.removeTvShow,
  });

  final TvShow tvShow;
  final int index;
  // final Function(TvShow) removeTvShow;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: colorScheme.primary,
          child: Text(
            (index + 1).toString(),
            style: GoogleFonts.lobster(
              color: colorScheme.onPrimary,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(
                tvShow.title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(width: 8),
            // Miniatura simples usando imagem local para Peaky Blinders
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Colors.grey, width: 1),
              ),
              child: tvShow.title == 'Peaky Blinders'
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.asset(
                        'assets/images/posterPeakBlinders-App2Series-Flutter.webp',
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: Colors.grey[300],
                          child: Icon(Icons.image, size: 20),
                        ),
                      ),
                    )
                  : Container(
                      color: Colors.grey[300],
                      child: Icon(Icons.image, size: 20),
                    ),
            ),
          ],
        ),
        subtitle: Text(
          tvShow.stream,
          style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
        ),
        trailing: ratingWidget(number: tvShow.rating),
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(tvShow.title),
                  IconButton.outlined(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(Icons.close, size: 32),
                  ),
                ],
              ),
              content: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Imagem maior na popup - retângulo com imagem local
                  Container(
                    width: 120,
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey, width: 1),
                    ),
                    child: tvShow.title == 'Peaky Blinders'
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/images/posterPeakBlinders-App2Series-Flutter.webp',
                              width: 120,
                              height: 180,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => Container(
                                color: Colors.grey[300],
                                child: Icon(Icons.image, size: 50),
                              ),
                            ),
                          )
                        : Container(
                            color: Colors.grey[300],
                            child: Icon(Icons.image, size: 50),
                          ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Streaming: ${tvShow.stream}'),
                        Text('Rating: ${tvShow.rating}'),
                        SizedBox(height: 8),
                        Text(tvShow.summary),
                      ],
                    ),
                  ),
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    context.read<TvShowModel>().removeTvShow(tvShow, context);
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    foregroundColor: colorScheme.onPrimary,
                  ),
                  child: Text(
                    'REMOVER',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    final index = context.read<TvShowModel>().tvShows.indexOf(
                      tvShow,
                    );
                    Navigator.of(context).pop();
                    context.go('/edit/$index');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    foregroundColor: colorScheme.onPrimary,
                  ),
                  child: Text(
                    'EDITAR',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Lista de séries favoritas
List<TvShow> favTvShowList = [
  TvShow(
    title: 'Breaking Bad',
    stream: 'Netflix',
    rating: 10,
    summary: 'Um professor de química do ensino médio começa a fabricar metanfetamina para garantir o futuro de sua família.',
    imageUrl: 'https://image.tmdb.org/t/p/w500/ggFHVNu6YYI5L9pCfOacjizRGt.jpg',
  ),
  TvShow(
    title: 'Stranger Things',
    stream: 'Netflix',
    rating: 9,
    summary: 'Um grupo de crianças enfrenta forças sobrenaturais e experimentos secretos em uma pequena cidade dos anos 80.',
    imageUrl: 'https://image.tmdb.org/t/p/w500/49WJfeN0moxb9IPfGn8AIqMGskD.jpg',
  ),
  TvShow(
    title: 'Game of Thrones',
    stream: 'HBO Max',
    rating: 9,
    summary: 'Famílias nobres lutam pelo controle do Trono de Ferro em um mundo medieval repleto de intrigas e dragões.',
    imageUrl: 'https://image.tmdb.org/t/p/w500/7WUHnWGx5OO145IRxPDUkQSh4C7.jpg',
  ),
  TvShow(
    title: 'The Last of Us',
    stream: 'HBO Max',
    rating: 10,
    summary: 'Após um surto apocalíptico, um homem e uma jovem cruzam os EUA em busca de sobrevivência e esperança.',
    imageUrl: 'https://image.tmdb.org/t/p/w500/uKvVjHNqB5VmOrdxqAt2F7J78ED.jpg',
  ),
  TvShow(
    title: 'The Crown',
    stream: 'Netflix',
    rating: 8,
    summary: 'A história do reinado da Rainha Elizabeth II e os desafios enfrentados pela família real britânica.',
    imageUrl: 'https://image.tmdb.org/t/p/w500/4sixcvt93g9SZZPH5qQWDG9GhsH.jpg',
  ),
  TvShow(
    title: 'The Witcher',
    stream: 'Netflix',
    rating: 7,
    summary: 'Um caçador de monstros solitário luta para encontrar seu lugar em um mundo onde humanos podem ser mais cruéis que bestas.',
    imageUrl: 'https://image.tmdb.org/t/p/w500/cZ0d3rtvXPVvuiX22sP79K3Hmjz.jpg',
  ),
  TvShow(
    title: 'The Boys',
    stream: 'Amazon Prime',
    rating: 8,
    summary: 'Um grupo tenta expor a verdade sobre super-heróis corruptos que abusam de seus poderes.',
    imageUrl: 'https://image.tmdb.org/t/p/w500/mY7SeH4HFFxW1hiI6cWuwCRKptN.jpg',
  ),
  TvShow(
    title: 'Dark',
    stream: 'Netflix',
    rating: 9,
    summary: 'Mistérios de viagens no tempo afetam quatro famílias em uma pequena cidade alemã.',
    imageUrl: 'https://image.tmdb.org/t/p/w500/5csl9cLXTMN2BjoQkYYHgUkfHbs.jpg',
  ),
  TvShow(
    title: 'Lupin',
    stream: 'Netflix',
    rating: 7,
    summary: 'Um mestre do disfarce se inspira em Arsène Lupin para vingar seu pai e enfrentar a elite francesa.',
    imageUrl: 'https://image.tmdb.org/t/p/w500/sgxawbFB5Vi5OkPWQLNfl3dvkNJ.jpg',
  ),
  TvShow(
    title: 'Peaky Blinders',
    stream: 'Netflix',
    rating: 9,
    summary: 'Uma família de gângsteres lidera o submundo do crime em Birmingham após a Primeira Guerra Mundial.',
    imageUrl: 'https://image.tmdb.org/t/p/w500/vUUqzWa2LnHIVqkaKVlVGkVcZIW.jpg',
  ),
];