import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'carousel_index_provider.g.dart';

@riverpod
class CurrentCarouselIndex extends _$CurrentCarouselIndex {
  @override
  int build() => 0;

  void setIndex(int index) {
    state = index;
  }
}
