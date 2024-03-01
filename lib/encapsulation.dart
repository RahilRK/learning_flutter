/*todo simple getter setter/encapsulation example*/
class StudentPercentage {
  var _percentage = 0.0;

  set calculatePercentage(int marks) => _percentage = (marks / 500) * 100;

  get percentage => _percentage;
}
