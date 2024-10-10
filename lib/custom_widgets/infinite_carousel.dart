import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/carousel_index_provider.dart';



class InfiniteCarousel extends ConsumerWidget {
  const InfiniteCarousel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final currentIndex = ref.watch(currentIndexProvider);

    return CarouselSlider.builder(
      itemCount: 10,
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.2,
        enlargeCenterPage: true,
        viewportFraction: 0.3,
        enableInfiniteScroll: true,
        onPageChanged: (index, reason) {
          ref.read(currentIndexProvider.notifier).setIndex(index);
        },
      ),
      itemBuilder: (context, index, realIdx) {
        return Container(
          margin: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: index == currentIndex ? Colors.amber : Colors.blue,
          ),
          child: Center(
            child: Text(
              "Item $index",
              style: const TextStyle(fontSize: 16.0),
            ),
          ),
        );
      },
    );
  }
}
