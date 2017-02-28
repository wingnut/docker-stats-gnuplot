# docker-stats-gnuplot
Hack for displaying CPU and MEM stats from docker services in gnuplot window (requires [gnuplot](http://www.gnuplot.info)).
The scripts run
<pre>
docker stats
</pre>
every 10s and persists the result to disk under a subfolder: logs

<h1>How to get started from a macOS terminal...</h1>
1. Install gnuplot
<pre>
brew install gnuplot --with-aquaterm --with-qt
</pre>

2. Clone this repo
<pre>
git clone https://github.com/mimr001/docker-stats-gnuplot.git
</pre>

3. Navigate into project root folder
<pre>
cd docker-stats-gnuplot
</pre>

4. Create logs folder
<pre>
mkdir logs
</pre>

5. Start tailing docker stats
<pre>
./tailAll.sh
</pre>
The script will spawn one _docker stats_ loop subprocess per container found in an call and continue to output the results to the respective log file (each log file is named after the corresponding container name).

6. Open a new terminal window/tab and start plotting __either__ CPU or Memory
<pre>
./plot.sh CPU
./plot.sh MEM
</pre>

<h1>Shutting down</h1>
1. In the tab(s) for plot.sh (NOTE: gnuplot steals focus on each run so you'll have to time it right):
<pre>
Ctrl-c
</pre>
1. In the tab for tailAll.sh:
<pre>
Ctrl-c
</pre>
This will tear down all subprocesses startet by tailAll.sh through a _trap_.
<h1>Misc</h1>
The _logs_ folder is your responsibility to clean up after your own needs. tailAll.sh will simply append to existing files or create new log files for the containers that have no existing logs.<br>
You will need to wait a few seconds between starting tailAll.sh and plot.sh so that the log files have some content...
