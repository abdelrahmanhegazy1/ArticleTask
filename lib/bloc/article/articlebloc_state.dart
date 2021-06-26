part of 'articlebloc_bloc.dart';

abstract class ArticleblocState extends Equatable {
  const ArticleblocState();

  @override
  List<Object> get props => [];
}

class ArticleblocInitial extends ArticleblocState {
  const ArticleblocInitial();
  @override
  List<Object> get props => [];
}

class ArticleblocLoading extends ArticleblocState {
  const ArticleblocLoading();
  @override
  List<Object> get props => [];
}

class ArticleblocSuccess extends ArticleblocState {
  final List<Article> articleList;
  const ArticleblocSuccess(this.articleList);
  @override
  List<Object> get props => [articleList];
}

class ArticleblocFailed extends ArticleblocState {
  final String errorMessage;
  const ArticleblocFailed(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
