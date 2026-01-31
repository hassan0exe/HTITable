// ignore: deprecated_member_use, avoid_web_libraries_in_flutter
import 'dart:html' as html; // Web-only import

void editBrowserUrl(String json) {
  // This only works for Flutter Web
  try {
    final String test = html.window.location.href.split('?courses=')[0];
    html.window.location.href =
        "$test?courses=\"$json\"";
  } catch (e) {
    print(e);
  }
}

String getBrowserUrl() {
  return Uri.decodeFull(html.window.location.href);
}

String getBrowserJson(){
  try{
    String json = getBrowserUrl().split('?courses="')[1];
    return json.substring(0,json.length-1);
  }catch(e){
    return "[]";
  }
}
