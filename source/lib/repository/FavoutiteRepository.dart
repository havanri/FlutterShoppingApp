
import 'package:sheinshop/entity/Favourite.dart';

abstract class FavouriteRepository{
  //add
  Future<String> addFavourite(int userId,int productId);
  //get all
  Future<List<Favourite>> getAllFavourites();
  //find by Id
  Future<Favourite> findFavouriteById(int favouriteId);
  //update
  Future<String> updateFavourite(Favourite favourite);
  //delete
  Future<String> deleteFavourite(int favouriteId);
  //
  //check isFavourite
  Future<bool> isFavourite(int userId,int cartId);
}