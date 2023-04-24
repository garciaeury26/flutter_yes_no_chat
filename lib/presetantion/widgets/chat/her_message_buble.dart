import 'package:flutter/material.dart';
import 'package:yes_no_maiby/domain/entities/message.dart';

class HerMessageBuble extends StatelessWidget {
  final Message herResponse;
  const HerMessageBuble({super.key, required this.herResponse});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: colors.primary,
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Text(
                      herResponse.text,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                _ImageBuble(
                  imageUrl: herResponse.imageUrl,
                ),
              ],
            )),
        const SizedBox(height: 5)
        // todo imagen
      ],
    );
  }
}

class _ImageBuble extends StatelessWidget {
  final String? imageUrl;

  const _ImageBuble({this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          imageUrl!,
          width: size.width * 0.7,
          height: 150,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Container(
              width: size.width * 0.7,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const Text('Escribiendo...'),
            );
          },
        ));
  }
}
