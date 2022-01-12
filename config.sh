echo "Cadmium configuration script"
sleep 2

function getdevice {
	clear
	echo "What device do you have? One of: bob, coachz, krane, kevin, minnie, speedy, lazor, 8101b"
	read scriptdevice
	echo "You picked $scriptdevice Are you sure this is what you want? Answer Y or N"
	read redogetdevice
	redogetdevicecheck

}

function redogetdevicecheck {

	if [ "$redogetdevice" = "Y" ] || [ "$redogetdevice" = "y" ]; then
		return 1
	elif [ "$redogetdevice" = "N" ] || [ "$redogetdevice" = "n" ]; then
		getdevice
	else
		echo "You entered something other than Y or N, lowercase and uppercase are both accepted. Please try again."
		getdevice
        fi

}

function getdistro {
        clear
        echo "What distro do you want? One of: debian, void, void-musl, ubuntu"
        read scriptdistro
        echo "You picked $scriptdistro Are you sure this is what you want? Answer Y or N"
        read redogetdistro
        redogetdistrocheck

}

function redogetdistrocheck {

        if [ "$redogetdistro" = "Y" ] || [ "$redogetdistro" = "y" ]; then
                return 1
        elif [ "$redogetdevice" = "N" ] || [ "$redogetdevice" = "n" ]; then
                getdistro
        else
                echo "You entered something other than Y or N, lowercase and uppercase are allowed."
                getdistro
        fi
}

function getfs {
        clear
        echo "What filesystem do you want? One of: f2fs, ext4"     
        read scriptfs
        echo "You picked $scriptfs Are you sure this is what you want? Answer Y or N"
        read redogetfs
        redogetfscheck
}

function redogetfscheck {

        if [ "$redogetfs" = "Y" ] || [ "$redogetfs" = "y" ]; then
                return 1
        elif [ "$redogetfs" = "N" ] || [ "$redogetfs" = "n" ]; then
                getfs
        else
                echo "You entered something other than Y or N, lowercase and uppercase are allowed."
                getfs
        fi
}

function getsuite {
        clear
        echo "What suite do you want?" 
        echo "For Debian: sid, testing, stable" 
        echo "For Ubuntu: impish, hirsute, focal"     
        read scriptsuite
        echo "You picked $scriptsuite Are you sure this is what you want? Answer Y or N."
        read redogetsuite
        redogetsuitecheck
}

function redogetsuitecheck {

        if [ "$redogetsuite" = "Y" ] || [ "$redogetsuite" = "y" ]; then
                return 1
        elif [ "$redogetsuite" = "N" ] || [ "$redogetsuite" = "n" ]; then
                getsuite
        else
                echo "You entered something other than Y or N, lowercase and uppercase are allowed."
                getsuite
        fi
}

function getkernel {
        clear
        echo "What kernel do you want?"  
        echo "kernelorg: from kernel.org, libre: from linux-libre.fsfla.org"  
        read scriptkernel
        echo "You picked $scriptkernel Are you sure this is what you want? Answer Y or N."
        read redogetkernel
        redogetkernelcheck

}

function redogetkernelcheck {

        if [ "$redogetkernel" = "Y" ] || [ "$redogetkernel" = "y" ]; then
                return 1
        elif [ "$redogetkernel" = "N" ] || [ "$redogetkernel" = "n" ]; then
                getkernel
        else
                echo "You entered something other than Y or N, lowercase and uppercase are allowed."
                getkernel
        fi
}

function getscriptinram {
        clear
        echo "Do you want to build Cadmium in tmpfs? Answer true or false. Lowercase only."
        read scriptinram

        if [ "$scriptinram" = "true" ]; then
                $scriptinram = "true"
        elif [ "$scriptinram" = "false" ]; then
                $scriptinram = "false"
        else
                echo "You entered something other than true or false, lowercase and uppercase are allowed."
                getscriptinram
        fi

}

function main {
        getdevice
        getdistro
        getfs
        getsuite
        getkernel
        getscriptinram

        sed "s/scriptdevice/"$scriptdevice"/g" config > config.tmp
        mv config.tmp config
        sed "s/scriptdistro/"$scriptdistro"/g" config > config.tmp
        mv config.tmp config
        sed "s/scriptfs/"$scriptfs"/g" config > config.tmp
        mv config.tmp config
        sed "s/scriptsuite/"$scriptsuite"/g" config > config.tmp
        mv config.tmp config
        sed "s/scriptkernel/"$scriptkernel"/g" config > config.tmp
        mv config.tmp config
        sed "s/scriptinram/"$scriptinram"/g" config > config.tmp
        mv config.tmp config

        echo "$scriptdevice,$scriptdistro,$scriptfs,$scriptsuite,$scriptkernel,$scriptinram"
        echo "Done!"
}


main
	
	
