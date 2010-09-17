$(function() {
  $("select, input, textarea, input:checkbox, input:radio, input:file").uniform(); 
  $('.date_picker').datepicker({
    showOn: 'both',
    buttonImage: '/images/calendar_3.png',
    buttonImageOnly: true,
    dateFormat: "yy-mm-dd"
  });
  $('.flash').delay(2500).slideUp('fast').live('click', function() {$(this).slideUp('fast')});
});

function init_add_form() {
  $('.add a').live('click', function() {
    var _this = $(this);
    var to = $(_this.attr('to'));
    var targetOffset = (to.offset().top + _this.offset().top) - 200 + 'px';
    to.slideDown('fast').find('a').click(function() {
      to.slideUp('fast');
      _this.parent().show();
      return false;
    });
    _this.parent().hide();
    $('html,body').animate({scrollTop: targetOffset}, 1000);
    return false;
  });
};

function refreshChart(d,project_name) {
  var data = new google.visualization.DataTable();
  data.addColumn('string', 'Time');
  data.addColumn('number', 'Hours');
  data.addRows(3);
  data.setValue(0, 0, 'Profit');
  data.setValue(0, 1, d[0]);
  data.setValue(1, 0, 'Developers');
  data.setValue(1, 1, d[1]);
  data.setValue(2, 0, 'Expenses');
  data.setValue(2, 1, d[2]);
  document.getElementById('chart_div').innerHTML = '';
  var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
  chart.draw(data, {width: 500, height: 370, title: project_name});
}