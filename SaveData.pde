
class SaveData{
  JSONObject saveJSON;
  
  SaveData(){
    saveJSON = new JSONObject();
    
  }
  
  void saveInt(String name, int number){
    saveJSON.setInt(name, number);
    saveJSONObject(saveJSON, "data/saveData.json");
  }
  
  void saveString(String name, String string){
    saveJSON.setString(name, string);
    saveJSONObject(saveJSON, "data/saveData.json");
  }
  
  void saveBoolean(String name, boolean bool){
    saveJSON.setBoolean(name, bool);
    saveJSONObject(saveJSON, "data/saveData.json");
  }
}
