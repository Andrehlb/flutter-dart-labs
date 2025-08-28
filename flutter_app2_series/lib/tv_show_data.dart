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
        title: Text(
          tvShow.title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  Text('Streaming: ${tvShow.stream}'),
                  Text('Rating: ${tvShow.rating}'),
                  Text(tvShow.summary),
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
  ),
  TvShow(
    title: 'Stranger Things',
    stream: 'Netflix',
    rating: 9,
    summary: 'Um grupo de crianças enfrenta forças sobrenaturais e experimentos secretos em uma pequena cidade dos anos 80.',
  ),
  TvShow(
    title: 'Game of Thrones',
    stream: 'HBO Max',
    rating: 9,
    summary: 'Famílias nobres lutam pelo controle do Trono de Ferro em um mundo medieval repleto de intrigas e dragões.',
  ),
  TvShow(
    title: 'The Last of Us',
    stream: 'HBO Max',
    rating: 10,
    summary: 'Após um surto apocalíptico, um homem e uma jovem cruzam os EUA em busca de sobrevivência e esperança.',
  ),
  TvShow(
    title: 'The Crown',
    stream: 'Netflix',
    rating: 8,
    summary: 'A história do reinado da Rainha Elizabeth II e os desafios enfrentados pela família real britânica.',
  ),
  TvShow(
    title: 'The Witcher',
    stream: 'Netflix',
    rating: 7,
    summary: 'Um caçador de monstros solitário luta para encontrar seu lugar em um mundo onde humanos podem ser mais cruéis que bestas.',
  ),
  TvShow(
    title: 'The Boys',
    stream: 'Amazon Prime',
    rating: 8,
    summary: 'Um grupo tenta expor a verdade sobre super-heróis corruptos que abusam de seus poderes.',
  ),
  TvShow(
    title: 'Dark',
    stream: 'Netflix',
    rating: 9,
    summary: 'Mistérios de viagens no tempo afetam quatro famílias em uma pequena cidade alemã.',
  ),
  TvShow(
    title: 'Lupin',
    stream: 'Netflix',
    rating: 7,
    summary: 'Um mestre do disfarce se inspira em Arsène Lupin para vingar seu pai e enfrentar a elite francesa.',
  ),
  TvShow(
    title: 'Peaky Blinders',
    stream: 'Netflix',
    rating: 9,
    summary: 'Uma família de gângsteres lidera o submundo do crime em Birmingham após a Primeira Guerra Mundial.',
  ),
];