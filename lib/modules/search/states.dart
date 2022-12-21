abstract class SearchStates{}
class SearchInitialStats extends SearchStates{}
//
// class SearchLoadingStates extends SearchStates{}
// class SearchSccussStates extends SearchStates{}
// class SearcherrorStates extends SearchStates{
//   final String error;
//
//   SearcherrorStates(this.error);
// }




class SearchLoadingStates extends SearchStates{}
class SearchSccussStates extends SearchStates{

}
class SearcherrorStates extends SearchStates{
  final String error;

  SearcherrorStates(this.error);
}