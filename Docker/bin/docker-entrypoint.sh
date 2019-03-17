#!/bin/bash
cd /opt/robotframework/project/
echo "Robotdocker version $VERSION"
if [ -e "$robot_argumentfile" ]
then
    echo "Running tests from $robot_testpath using $robot_argumentfile for arguments"
    robot --argumentfile $robot_argumentfile --outputDir /opt/robotframework/reports $robot_testpath
else
    echo "Running tests from $robot_testpath -  no argumentfile given"
    robot --outputDir /opt/robotframework/reports $robot_testpath
fi

chmod 777 /opt/robotframework/reports
