# docker-stats-gnuplot
Hack for displaying CPU and MEM stats from docker services in gnuplot window (requires [gnuplot](http://www.gnuplot.info)).
The scripts run
<pre>
docker stats
</pre>
every 10s and persist the result to disk under a subfolder: logs

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

5. Start tailing docker stats for all containers (except the one explicitly skipped in the script (system containers for Docker for AWS))
<pre>
./tailAll.sh
OR
./tailContainer.sh <container name>
</pre>
The tailAll script create one log file per container found in the first call and continue to output the results to the respective log file (each log file is named after the corresponding container name). The tailContainer requiers a container name. Either look it up explicitly through a _docker stats_ call yourself or use the tailAll script for a few seconds and look through the generated _containerNames.txt_

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
You will need to wait a few seconds between starting tailAll.sh and plot.sh so that the log files have some content, see typical error when there's little or too little data collected:<br>
_Warning: empty x range [1.48845e+09:1.48845e+09], adjusting to [1.47356e+09:1.50333e+09]<br>
Warning: empty y range [0.69:0.69], adjusting to [0.6831:0.6969]_
