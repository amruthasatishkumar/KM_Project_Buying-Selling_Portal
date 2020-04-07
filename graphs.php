<?php
// Create connection
$con = mysqli_connect("localhost", "root", "" , "khreedo_becho");
?>
<html>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Product Title','Initial Price','Final Price'],
          <?php 
          $query = "SELECT title,price_initial,price_final from advertisements";
          
          $exec = mysqli_query($con,$query);
          while($row = mysqli_fetch_array($exec)){
 
          echo "['".$row['title']."',".$row['price_initial'].",".$row['price_final']."],";
          }
          ?> 
        ]);

        var options = {
          chart: {
            title: 'Price Range Of Products',
            subtitle: 'Intial and Final Prices of Products',
          }
        };

        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
    </script>
  </head>
  <body>
    <div id="columnchart_material" style="width: 800px; height: 500px;"></div>
  </body>
</html>
