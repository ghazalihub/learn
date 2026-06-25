import 'recentclearallrow_item_model.dart';

/// This class defines the variables used in the [search_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class SearchModel {

 static List<RecentclearallrowItemModel> getSearchData(){
  return [
   RecentclearallrowItemModel("Maths"),
    RecentclearallrowItemModel("Finance"),
    RecentclearallrowItemModel("Science"),
    RecentclearallrowItemModel("Photography"),
    RecentclearallrowItemModel("Machine learning"),
  ];
 }



}
