
class LoadData {
  JSONObject loadJSON;

  LoadData() {
    loadJSON = new JSONObject();
    loadJSON = loadJSONObject("data/saveData.json");
  }

  void loadInt(String name) {
    loadJSON = loadJSONObject("data/saveData.json");
    if (loadJSON.isNull(name)) {
      println("int not stored in JSON file");
    } else {
      loadJSON.getInt(name);
      println("int found");
    }
  }

  void loadString(String name) {
    loadJSON = loadJSONObject("data/saveData.json");
    if (loadJSON.isNull(name)) {
      println("String not stored in JSON file");
    } else {
      loadJSON.getString(name);
      println("String found");
    }
  }

  void loadBoolean(String name) {
    loadJSON = loadJSONObject("data/saveData.json");
    if (loadJSON.isNull(name)) {
      println("boolean not stored in JSON file");
    } else {
      loadJSON.getBoolean(name);
      println("boolean found");
    }
  }
}
