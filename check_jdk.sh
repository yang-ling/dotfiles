#!/usr/bin/bash
type -p java > /dev/null 2>&1
if [ $? -eq 0 ]; then
    #echo "found java executable in PATH"
    _java=java
elif [[ -n "$JAVA_HOME" ]] && [[ -x "$JAVA_HOME/bin/java" ]];  then
    #echo "found java executable in JAVA_HOME"
    _java="$JAVA_HOME/bin/java"
else
    #echo "no java"
    return 0
fi

_jdk_path="/usr/lib/jvm/jdk/"
_java_path="jre/bin/java"
_javac_path="bin/javac"
_javadoc_path="bin/javadoc"
_javah_path="bin/javah"
_javap_path="bin/javap"
_orig_java_path=$(which java)

if [[ "$_java" ]]; then
    version=$("$_java" -version 2>&1 | awk -F '"' '/version/ {print $2}')
    #echo version "$version"
    if ! ( [[ "$version" > "1.6" ]] && [[ "$version" < "1.7" ]] ); then
        echo "version is not 1.6"
        echo "Try to link JDK 1.6..."
        [[ ! -e "${_jdk_path}${_java_path}" ]] && { echo "${_jdk_path}${_java_path} doesn't exsit!"; return 1; }
        [[ ! -e "${_jdk_path}${_javac_path}" ]] && { echo "${_jdk_path}${_javac_path} doesn't exsit!"; return 1; }
        [[ ! -e "${_jdk_path}${_javadoc_path}" ]] && { echo "${_jdk_path}${_javadoc_path} doesn't exsit!"; return 1; }
        [[ ! -e "${_jdk_path}${_javah_path}" ]] && { echo "${_jdk_path}${_javah_path} doesn't exsit!"; return 1; }
        [[ ! -e "${_jdk_path}${_javap_path}" ]] && { echo "${_jdk_path}${_javap_path} doesn't exsit!"; return 1; }
        sudo rm -f "${_orig_java_path}"
        sudo ln -s "${_jdk_path}${_java_path}" "${_orig_java_path}"
        sudo rm -f "${_orig_java_path}c"
        sudo ln -s "${_jdk_path}${_javac_path}" "${_orig_java_path}c"
        sudo rm -f "${_orig_java_path}doc"
        sudo ln -s "${_jdk_path}${_javadoc_path}" "${_orig_java_path}doc"
        sudo rm -f "${_orig_java_path}h"
        sudo ln -s "${_jdk_path}${_javah_path}" "${_orig_java_path}h"
        sudo rm -f "${_orig_java_path}p"
        sudo ln -s "${_jdk_path}${_javap_path}" "${_orig_java_path}p"
        echo "Finished!"
    fi
fi
