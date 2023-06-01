// returns today's date as yyyymmdd e.g.

String todaysDDMMYYYY() {
  //today
  var dateTimeObject = DateTime.now();

  // year in the format yyyy
  String year = dateTimeObject.year.toString();

  // month in the format mm
  String month = dateTimeObject.month.toString();
  if(month.length == 1) {
    month = "0$month";
  }

  //day in the format dd
  String day = dateTimeObject.day.toString();
  if(day.length == 1) {
    day = "0$day";
  }

  //final format
  String ddmmyyyy  = year + month + day;
  return ddmmyyyy;


}



// convert string yyyymmdd to DateTime object
DateTime createDateTimeObject(String ddmmyyyy){
  int yyyy = int.parse(ddmmyyyy.substring(0,4));
  int mm = int.parse(ddmmyyyy.substring(4,6));
  int dd = int.parse(ddmmyyyy.substring(6,8));

  DateTime dateTimeObject = DateTime(yyyy,mm,dd);
  return dateTimeObject;
}

// convert DateTime object to string yyyymmdd
String convertDateTimeToDDMMYYYY(DateTime dateTime) {
  // year in the format yyyy
  String year = dateTime.year.toString();

  // month in the format mm
  String month = dateTime.month.toString();
  if (month.length == 1) {
    month = "0$month";
  }

  //day in the format dd
  String day = dateTime.day.toString();
  if (day.length == 1) {
    day = "0$day";
  }

  //final format
  String ddmmyyyy  = year + month + day;
  return ddmmyyyy;

}



