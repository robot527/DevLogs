#! /bin/bash
# Add some more command aliases

cat ~/.bashrc |grep "#Command aliases added by" > /dev/null 2>&1
if test $? == 1;then
	echo -e "\n#Command aliases added by $0" >> ~/.bashrc
fi

cat ~/.bashrc |grep 'alias l=' > /dev/null 2>&1
if test $? != 0;then
	echo "alias l='ls -Alh'" >> ~/.bashrc
fi

cat ~/.bashrc |grep 'alias lt=' > /dev/null 2>&1
if test $? != 0;then
	echo "alias lt='ls -Alht'" >> ~/.bashrc
fi

cat ~/.bashrc |grep 'alias grepn=' > /dev/null 2>&1
if test $? != 0;then
	echo "alias grepn='grep -rn'" >> ~/.bashrc
fi

cat ~/.bashrc |grep 'alias grepi=' > /dev/null 2>&1
if test $? != 0;then
	echo "alias grepi='grep -rni'" >> ~/.bashrc
fi

apt-get --version > /dev/null 2>&1
if test $? == 0;then
	cat ~/.bashrc |grep 'alias install=' > /dev/null 2>&1
	if test $? != 0;then
		echo "alias install='sudo apt-get install'" >> ~/.bashrc
	fi

	cat ~/.bashrc |grep 'alias distupgrade=' > /dev/null 2>&1
	if test $? != 0;then
		echo "alias distupgrade='sudo apt-get dist-upgrade'" >> ~/.bashrc
	fi

	cat ~/.bashrc |grep 'alias autoremove=' > /dev/null 2>&1
	if test $? != 0;then
		echo "alias autoremove='sudo apt-get autoremove'" >> ~/.bashrc
	fi

	cat ~/.bashrc |grep 'alias autoclean=' > /dev/null 2>&1
	if test $? != 0;then
		echo "alias autoclean='sudo apt-get autoclean'" >> ~/.bashrc
	fi
fi
