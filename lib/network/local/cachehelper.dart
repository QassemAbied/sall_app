import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper
{
 static SharedPreferences? sharedPreferences;
 static init()async
 {
   sharedPreferences = await SharedPreferences.getInstance();
 }

 static Future<bool> Savedata({
 required String? key,
   required dynamic value,
 })async
 {
   if(value is bool) return await sharedPreferences!.setBool(key!, value);
   if(value is int) return await sharedPreferences!.setInt(key!, value);
   if(value is double) return await sharedPreferences!.setDouble(key!, value);
   return await sharedPreferences!.setString(key!, value);
 }

 static bool? getbool({
  required String? key,
 })
 {
  return  sharedPreferences!.getBool(key!);
 }

 static String? getString({
  required String? key,
 })
 {
  return  sharedPreferences!.getString(key!);
 }

 static dynamic getdata({
  required String? key,

 })
 {
  return  sharedPreferences!.get(key!);
 }

 static Future<bool> removedata({
  required String? key,
 })async
 {
  return await sharedPreferences!.remove(key!);
 }
}