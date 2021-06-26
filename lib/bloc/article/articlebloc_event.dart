part of 'articlebloc_bloc.dart';

abstract class ArticleblocEvent extends Equatable {
  const ArticleblocEvent();

  @override
  List<Object> get props => [];
}

class GettingArticles extends ArticleblocEvent {
  const GettingArticles();
  @override
  List<Object> get props => [];
}
