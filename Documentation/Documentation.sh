#!/bin/bash

cd ..
pathRoot=$(pwd)

cd ${pathRoot}/Resources
components=$(ls -d */ | grep -v Documentation/)


for component in ${components[*]};
do
    echo \n---------------------------------------
    echo \n ${component} DOCUMENTATION
    echo \n---------------------------------------

    cd ${pathRoot}/Resources/${component}
    applications=$(ls -d */)
    for app in ${applications[*]};
    do
        echo \n .....
        echo \n Aplication to create docs: ${app}

        cd ${pathRoot}/Resources/${component}/${app}
        versions=$(ls -d */ | grep -v Library)

        for version in ${versions[*]}
        do
            pathResource=${pathRoot}/Resources/${component}/${app}/${version}
            pathDocumentation=${pathRoot}/Documentation/Resources/${component}/${app}/${version}

            cd ${pathResource}
            ls -l *.robot
            mkdir -p ${pathDocumentation}
            [ -f docs/index.html ] && > docs/index.html
            ver=${version%/}
            echo \nVersion ${ver}
            for file in $(ls *.robot);
                do
                    python -m robot.libdoc --version ${ver} $file ${pathDocumentation}/${file%.txt}'_doc.html'
            done
        done
    done
done

cd ${pathRoot}/Tests
components=$(ls -d */ | grep -v Documentation/)


for component in ${components[*]};
do
    echo \n---------------------------------------
    echo \n ${component} DOCUMENTATION
    echo \n---------------------------------------

    cd ${pathRoot}/Tests/${component}
    applications=$(ls -d */)
    for app in ${applications[*]};
    do
         pathTest=${pathRoot}/Tests/${component}/${app}
            pathDocumentation=${pathRoot}/Documentation/Tests/${component}/${app}

            cd ${pathTest}
            ls -l *.robot
            mkdir -p ${pathDocumentation}
            [ -f docs/index.html ] && > docs/index.html
            ver=${app%/}
            echo \napp ${ver}
            for file in $(ls *.robot);
                do
                    python -m robot.testdoc $file ${pathDocumentation}/${file%.txt}'_doc.html'
            done
        done
    done
