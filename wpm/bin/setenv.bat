:setEnv

set WPM_CLIENT_HOME=%~dp0..

:setStartHeap
if not "%DCI_START_HEAP%" == "" goto setMaxHeap
set DCI_START_HEAP=10

:setMaxHeap
if not "%DCI_MAX_HEAP%" == "" goto setJavaOpts
set DCI_MAX_HEAP=512

:setJavaOpts
set JAVA_OPTS=%JAVA_OPTS% -Dlog.dir="%WPM_CLIENT_HOME%\logs"
set JAVA_OPTS=%JAVA_OPTS% -DtermOutOn=true
set JAVA_OPTS=%JAVA_OPTS% -DspoolOn=true

rem ==================To enable debug, change this property to 'DEBUG'==========
    set JAVA_OPTS=%JAVA_OPTS% -DlogLevel=TRACE
rem ============================================================================

set JAVA_OPTS=%JAVA_OPTS% -Xms%DCI_START_HEAP%m
set JAVA_OPTS=%JAVA_OPTS% -Xmx%DCI_MAX_HEAP%m
set JAVA_OPTS=%JAVA_OPTS% -Xss256k