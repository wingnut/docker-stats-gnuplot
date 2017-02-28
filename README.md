# docker-stats-gnuplot
Hack for displaying CPU and MEM stats from docker services in gnuplot window (requires [gnuplot](http://www.gnuplot.info)).
The scripts run
<pre>
docker stats
</pre>
every 10s and persists the result to disk under a subfolder: logs so __make sure that folder exists!__

<h1>How to get started on macOS...</h1>
1. Install gnuplot
<pre>
brew install gnuplot --with-aquaterm --with-qt
</pre>
2. Clone this repo
<pre>
git clone https://github.com/mimr001/docker-stats-gnuplot.git
</pre>
3. cd docker-stats-gnuplot

