#!/usr/bin/with-contenv bashio

# Init Functions

echo ""
echo "----- Home Assistant Vigipool Installer -----"
echo ""

# Language manager

while true; do
    echo ""
    echo "--- Select your language / Sélectionner votre langage ---"
    echo ""
    echo "1 - EN - English"
    echo "2 - FR - Français"
    echo "Enter your answer 1 or 2 : "
    read menu_choice
    if [ "$menu_choice" != "${menu_choice#[1eEnN]}" ] ;then 
        echo "You have selected '1 - EN - English'"
        text_lang="en"
        text_step_1="Step 1 - Installing the necessary packages"
        text_install="Installation successful"
        text_step_2="Step 2 - Search for the VigiPool product in your network"
        text_do="Do you want us to launch an automatic scan of the IPs on your network or do you want to enter the IP manually?"
        text_automatic="Automatic"
        text_manual="Manual"
        text_please="Please write your answer (1 or 2) then press the "enter" key"
        text_you="You have selected"
        text_we="We start scanning IP addresses"
        text_ip="IP addresses found"
        text_found="An IP address with an MQTT server was found, what do you want to do?"
        text_what="What do you want to do ?"
        text_what_1="Use the IP address displayed above"
        text_what_2="Continue scanning to find another IP address"
        text_what_3="Enter the IP manually"
        text_what_4="View IP address MQTT data"
        text_please_3="Please write your answer (1 or 2) then press the "enter" key"
        text_please_manu="Please enter the IP address in the format of the following example"
        text_choice_error="The choice was not understood, please try again"
        text_step_3="Step 3 - Managing configuration.yaml file"
        text_want="Do you want to configure the configuration.yaml file automatically or manually ?"
        text_want_auto="Select automatic mode if you have never modified your configuration.yaml file or if the MQTT plugin configuration is in the file"
        text_want_manu="Select manual mode if your MQTT configuration is not the configuration.yaml file"
        text_backup="In the event of a problem, a backup of your configuration has been made under the following name"
        text_check_mqtt="Checking if the configuration has already been done or not"
        text_manu_mqtt="Please add the following line to your configuration"
        text_example="example"
        text_step_4="Step 4 – creating and managing the vigipool.yaml file"
        text_creation="Creation of the VigiPool folder"
        text_cleaning="Cleaning and downloading models"
        text_retrieving="Retrieving MQTT data"
        text_mqtt="MQTT data analysis"
        text_displaying="Displaying results"
        text_integration="integration of information into the configuration"
        text_step_5="Step 5 - checking the changes and restarting"
        text_modif="The modification of your configuration went well"
        text_end="The rebuild is completed, you can go to your dashboard, VigiPool products are integrated"
        text_prob_1="There was a problem during the installation, here is the error"
        text_prob_2="if you want to undo changes, you can use the backup named"
        text_nothing="The configuration is already there, no changes will be made"
        text_error_no_device="No Vigipool compatible device was found, the installation is canceled, please check if the devices are connected to your Wi-Fi and if the Home Assistant MQTT is correctly configured."
        text_reboot="A reboot is required to see the changes in the dashboard, do you want to do it now or do you want to do it yourself later?"
        text_reboot_now="Restart now"
        text_reboot_later="Manually restart later"
        text_already_ready="The configuration.yaml file is already ready"
        text_device_found="Device detected"
        text_device_missing="Device missing"
        break
    elif [ "$menu_choice" != "${menu_choice#[2mM]}" ] ;then 
        echo "Vous avez sélectionné '2 - FR - Français'"
        text_lang="fr"
        text_step_1="Étape 1 - Installation des packages nécessaires"
        text_install="Installation réussie"
        text_step_2="Étape 2 - Recherche du produit VigiPool dans votre réseau"
        text_do="Souhaitez-vous que nous lançons un scan automatique des IP sur votre réseau ou souhaitez-vous saisir l\’IP manuellement ?"
        text_automatic="Automatique"
        text_manual="Manuel"
        text_please="Veuillez écrire votre réponse (1 ou 2) puis appuyer sur la touche "entrée""
        text_you="Vous avez sélectionné"
        text_we="Nous commençons à scanner les adresses IP"
        text_ip="adresses IP trouvés"
        text_found="Une adresse IP avec un serveur MQTT a été trouvé"
        text_what="Que voulez-vous faire ?"
        text_what_1="Utiliser l'adresse IP qui s'affiche au-dessus"
        text_what_2="Continuer de scanner pour trouver une autre adresse IP"
        text_what_3="Entrer l'IP a la main"
        text_what_4="Voir les données MQTT de l'adresse IP"
        text_please_3="Please write your answer (1 2 or 3) then press the "enter" key"
        text_please_manu="Veuillez entrer l'adresse IP dans le format de l'exemple suivant"
        text_choice_error="Le choix n\'a pas été compris, veuillez réessayer"
        text_step_3="Étape 3 - Gestion du fichier configuration.yaml"
        text_want="Voulez-vous configurer le fichier configuration.yaml automatiquement ou manuellement ?"
        text_want_auto="Sélectionner le mode automatique si vous n'avez jamais modifié votre fichier configuration.yaml ou si la configuration du plugin MQTT est dans le fichier"
        text_want_manu="Sélectionner le mode manuel si la configuration de votre MQTT n'est pas le fichier configuration.yaml"
        text_backup="En cas de problème, une sauvegarde de votre configuration a été faite sous le nom suivant"
        text_check_mqtt="Vérification si la configuration a déjà été faite ou pas"
        text_manu_mqtt="Veuillez ajouter la ligne suivante dans votre configuration"
        text_example="exemple"
        text_step_4="Étape 4 - Création et gestion du fichier vigipool.yaml"
        text_creation="Création du dossier VigiPool"
        text_cleaning="Nettoyage et téléchargements des modèles"
        text_retrieving="Récupération des données MQTT"
        text_mqtt="Analyse des données MQTT"
        text_displaying="Affichage des résultats"
        text_integration="intégration des informations dans la configuration"
        text_step_5="Étape 5 - vérification des modifications et redémarrage"
        text_modif="La modification de votre configuration s'est bien déroulée"
        text_end="La reconstruction est terminée, vous pouvez accéder à votre tableau de bord, les produits VigiPool sont intégrés"
        text_prob_1="Il y a eu un problème lors de l'installation, voici l'erreur"
        text_prob_2="Si vous souhaitez annuler les modifications, vous pouvez utiliser la sauvegarde nommée"
        text_nothing="La configuration est déjà là, aucune modification ne sera faite"
        text_error_no_device="Aucun périphérique compatible Vigipool a été trouvé, l'installation est annulée, veuillez vérifier si les périphériques sont bien connectés à votre Wi-Fi et si le MQTT de Home Assistant est bien configuré."
        text_reboot="Un redémarrage est nécessaire pour voir les changements dans le tableau de bord, voulez-vous le faire maintenant ou voulez-vous le faire vous-même plus tard ?"
        text_reboot_now="Redémarrer maintenant"
        text_reboot_later="Redémarrer manuellement plus tard"
        text_already_ready="Le fichier configuration.yaml est déjà prêt"
        text_device_found="Périphérique détecté"
        text_device_missing="Périphérique absent"
        break
    else
        echo The choice was not understood, please try again \/ Le choix n\'a pas été compris, veuillez réessayer
    fi
done




# Configuration Variables 
link_to_scripts="https://raw.githubusercontent.com/developer-ccei-pool/home-assistant-vigipool-installer/main/"
ip_address_mqtt_debug="192.168.2.2"
debug=false
templates=anteam anteaox anteavs daisyox daisyph lynx phileox tild vigipool vigiwatt x312 ziphox

if [[ $debug == true ]]; then
    echo "Debug mode has been activated"
fi

if [[ $debug == false ]]; then
    echo "--- $text_step_1 ---"
    echo "";
    apk add --no-cache mosquitto mosquitto-clients nmap
    echo "$text_install"
    echo ""
fi

# Downloading and launching and removing the installer
# wget -q https://raw.githubusercontent.com/developer-ccei-pool/home-assistant-vigipool-installer/main/vigipool_installer.sh && chmod +x vigipool_installer.sh && bash vigipool_installer.sh
if [[ $debug == false ]]; then
    rm vigipool_installer.sh
fi

# IP address management
## recovery of the machine's IP address and processing of information
ip_address_inet=$(ip address | grep -Eo " (\b25[0-5]|\b2[0-4][0-9]|\b[01]?[0-9][0-9]?)(\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)){3}/[0-9].")
if [[ $debug == true ]]; then
    echo ""
    echo ""
    echo "ip_address_inet = $ip_address_inet"
    echo ""
    echo ""
fi
ip_address_inet=(${ip_address_inet//;/ })
if [[ $debug == true ]]; then
    echo ""
    echo ""
    echo "ip_address_inet = "
    for i in "${ip_address_inet[@]}"; do
        echo "$i"
    done
    echo ""
    echo ""
fi

## Remove local IP
ip_address_inet=( "${ip_address_inet[@]/$127*/}" )

## recovery of machine IP address ranges and processing of information
ip_address_to_test=()
for i in "${ip_address_inet[@]}"; do
    if [[ "$i" == "127.0.0.1/8" ]]; then
        nothing="to do"
    else
        ip_address_to_test+=$(nmap -sL -n $i | grep 'Nmap scan report for' | cut -f 5 -d ' ')
        ip_address_to_test+=";"
    fi
done
ip_address_to_test=(${ip_address_to_test//;/ })
if [[ $debug == true ]]; then
    echo ""
    echo ""
    echo "ip_address_to_test = "
    for i in "${ip_address_to_test[@]}"; do
        echo -n "- $i"
    done
    echo ""
    echo ""
fi

## testing IP addresses to find the MQTT server
ip_address=""
# ip_address_to_test=($ip_address_mqtt_debug $link_to_scripts)
echo "--- $text_step_2 ---"
echo "";

while [[ "$ip_address" == "" ]]; do
    echo "$text_do";
    echo "1 - $text_automatic";
    echo "2 - $text_manual";
    echo "$text_please : "
    read menu_choice
    if [ "$menu_choice" != "${menu_choice#[1aA]}" ] ;then 
        # 1 - Automatic
        echo "$text_you '$text_automatic'"
        number_ip_address_to_test=${#ip_address_to_test[@]}
        echo "$text_we ($number_ip_address_to_test $text_ip)"
        echo ''
        for i in ${!ip_address_to_test[@]}; do 
            
            echo -e '\e[1A\e[K Scan : '$i'/'$number_ip_address_to_test '('${ip_address_to_test[i]}')'
            
            nmap_mqtt_data=$(nmap --min-rtt-timeout 0.3 --max-rtt-timeout 0.3 --initial-rtt-timeout 0.3 -Pn --host-timeout 0.3 --script-timeout 0.3 -q -p 1883 ${ip_address_to_test[i]})
            cat_grep=$(echo $nmap_mqtt_data | grep -q "1883/tcp open mqtt" ; echo $?)

            if [[ $debug == true ]]; then
                result=$ip_address_mqtt_debug
            fi
            if [[ "$cat_grep" == "0" ]]; then
                echo "";
                echo "";
                # Ask the user what they want to do with this IP address
                echo "$text_found : "${ip_address_to_test[i]}
                while true; do
                    echo "$text_what";
                    echo "1 - $text_what_1";
                    echo "2 - $text_what_2";
                    echo "3 - $text_what_3";
                    echo "4 - $text_what_4";
                    echo "$text_please_3 : "
                    read menu_choice
                    if [ "$menu_choice" != "${menu_choice#[1]}" ] ;then 
                        # 1 - Use this IP address
                        echo "$text_you '$text_what_1'"
                        ip_address=${ip_address_to_test[i]}
                        break
                    elif [ "$menu_choice" != "${menu_choice#[2]}" ] ;then 
                        # 2 - Continue scanning
                        echo "$text_you '$text_what_2'"
                        break
                    elif [ "$menu_choice" != "${menu_choice#[3]}" ] ;then 
                        # 3 - Enter the IP address manually
                        echo "$text_you '$text_what_3'"
                        echo "$text_please_manu : $ip_address_mqtt_debug"
                        read ip_address
                        break
                    elif [ "$menu_choice" != "${menu_choice#[4]}" ] ;then 
                        # 4 - View IP address MQTT data
                        echo "$text_you '$text_what_4'"
                        mosquitto_sub_raw=$(timeout 1 mosquitto_sub -h ${ip_address_to_test[i]} --pretty --verbose --topic "#")
                        echo "mosquitto_sub_raw = $mosquitto_sub_raw"
                    else
                        echo "$text_choice_error"
                    fi
                done        
                echo "";
                echo "";
            else
                echo -n ". ($cat_grep)"
            fi
            if [ "$ip_address" != "" ]; then
                break;
            fi
        done
        if [[ $debug == true ]]; then
            ip_address=$ip_address_mqtt_debug
        fi
    elif [ "$menu_choice" != "${menu_choice#[2mM]}" ] ;then 
        # 2 - Manual
        echo "$text_you '$text_manual'"
        echo "$text_please_manu : $ip_address_mqtt_debug"
        read ip_address
        echo "";
        echo "";
    elif [ "$menu_choice" != "${menu_choice#[3dD]}" ] ;then 
        # 3 - Debug
        echo "$text_you 'Debug'"
        echo "The IP address will be $ip_address_mqtt_debug"
        ip_address=$ip_address_mqtt_debug
        echo "";
        echo "";
    else
        echo The choice was not understood, please try again
    fi

    echo "";
    echo "";
    echo "";

done   

# Managing configuration.yaml file

echo "--- $text_step_3 ---"
echo "";

# changing directory to homeassitant folder
cd /root/homeassistant

while true; do
    echo "$text_want"
    echo "$text_want_auto"
    echo "$text_want_manu"
    echo "1 - $text_automatic";
    echo "2 - $text_manual";
    echo "$text_please : "
    read menu_choice
    if [ "$menu_choice" != "${menu_choice#[1aA]}" ] ;then 
        # 1 - Automatic
        echo "$text_you '$text_automatic'"

        timestamp=$(date +%s)

        echo "$text_backup : configuration_$timestamp.backup"
        cp -n configuration.yaml configuration_$timestamp.backup

        echo "$text_check_mqtt"
        File="configuration.yaml"
        if grep -q mqtt "$File"; then
            if grep -q vigipool.yaml "$File"; then
                echo "$text_already_ready"
            else
                sed -i '/mqtt:/a \ \ !include vigipool_templates/vigipool.yaml' configuration.yaml
                break
            fi
        else
            echo "" >> $File
            echo "# Vigipool" >> $File
            echo "mqtt:" >> $File
            echo "  !include vigipool_templates/vigipool.yaml" >> $File
        fi

        break
    elif [ "$menu_choice" != "${menu_choice#[2mM]}" ] ;then 
        # 2 - Manual
        echo "$text_manu_mqtt"
        echo "$text_example :"
        echo "# Vigipool"
        echo "mqtt:"
        echo "    !include vigipool_templates/vigipool.yaml"
        break
    else
        echo The choice was not understood, please try again
    fi
done

echo "";
echo "";
echo "--- $text_step_4 ---"
echo "";

# Managing vigipool.yaml file

echo "$text_creation"
mkdir -p vigipool_templates
cd vigipool_templates

echo "$text_cleaning"
clean_and_download_template() {

    # echo "$text_cleaning ($1)"

    if test -f "$1.yaml"; then
        rm $1.yaml
    fi
    wget -q $link_to_scripts/vigipool_templates/$1.yaml
}

clean_and_download_template "anteam" $anteam
clean_and_download_template "anteaox" $anteaox
clean_and_download_template "anteavs" $anteavs
clean_and_download_template "daisyox" $daisyox
clean_and_download_template "daisyph" $daisyph
clean_and_download_template "lynx" $lynx
clean_and_download_template "phileox" $phileox
clean_and_download_template "tild" $tild
clean_and_download_template "vigipool" $vigipool
clean_and_download_template "vigiwatt" $vigiwatt
clean_and_download_template "x312" $x312
clean_and_download_template "ziphox" $ziphox

# Retrieving MQTT data
echo "$text_retrieving"
mosquitto_sub_raw=$(timeout 1 mosquitto_sub -h $ip_address --pretty --verbose --topic "#")
if [[ $debug == true ]]; then
    echo "";
    echo "";
    echo "mosquitto_sub_raw = $mosquitto_sub_raw"
    echo "";
    echo "";
fi

# Retrieving device names
echo "$text_mqtt"

function retrieving_device_names() {
    # echo "retrieving_device_names $1";

    echo $mosquitto_sub_raw | grep -Eo "$1\_............" > temp.txt

    device_name=$(head -n 1 temp.txt)
    # echo "device_name = $device_name";

    # if [[ $debug == true ]]; then
        # echo "";
        # echo "";
        # echo "$1 = $$1"
        # echo "";
        # echo "";
    # fi

    echo $device_name
}

anteam=$(retrieving_device_names 'anteam')
anteaox=$(retrieving_device_names 'anteaox')
anteavs=$(retrieving_device_names 'anteavs')
daisyox=$(retrieving_device_names 'daisyox')
daisyph=$(retrieving_device_names 'daisyph')
lynx=$(retrieving_device_names 'lynx')
phileox=$(retrieving_device_names 'phileox')
tild=$(retrieving_device_names 'tild')
vigipool=$(retrieving_device_names 'vigipool')
vigiwatt=$(retrieving_device_names 'vigiwatt')
x312=$(retrieving_device_names 'x312')
ziphox=$(retrieving_device_names 'ziphox')

# String
if [[ -z "$anteam$anteaox$anteavs$daisyox$daisyph$lynx$phileox$tild$vigipool$vigiwatt$x312$ziphox" ]]; then
    echo $text_error_no_device
    exit 1
elif [[ -n "$anteam$anteaox$anteavs$daisyox$daisyph$lynx$phileox$tild$vigipool$vigiwatt$x312$ziphox" ]]; then
    echo "Ok"
else
    echo "This never happens"
fi

# echo "$text_displaying"

# show_results() {
#     echo $1 = $2
# }

# show_results "anteam" $anteam
# show_results "anteaox" $anteaox
# show_results "anteavs" $anteavs
# show_results "daisyox" $daisyox
# show_results "daisyph" $daisyph
# show_results "lynx" $lynx
# show_results "phileox" $phileox
# show_results "tild" $tild
# show_results "vigipool" $vigipool
# show_results "vigiwatt" $vigiwatt
# show_results "x312" $x312
# show_results "ziphox" $ziphox

echo "$text_integration"

replace_template_name() {
    if test -f "$1.yaml"; then
        sed -i "s/${1}_XXXXXXXXXXXX/$2/" $1.yaml
    fi
}

replace_template_name "anteam" $anteam
replace_template_name "anteaox" $anteaox
replace_template_name "anteavs" $anteavs
replace_template_name "daisyox" $daisyox
replace_template_name "daisyph" $daisyph
replace_template_name "lynx" $lynx
replace_template_name "phileox" $phileox
replace_template_name "tild" $tild
replace_template_name "vigipool" $vigipool
replace_template_name "vigiwatt" $vigiwatt
replace_template_name "x312" $x312
replace_template_name "ziphox" $ziphox

found_and_integrate() {
    if [[ -z "$2" ]]; then
        echo "$text_device_missing : $1"
    elif [[ -n "$2" ]]; then
        if test -f "$1.yaml"; then
            echo "$text_device_found : $1"
            cat $1.yaml >> vigipool.yaml
        fi
    fi
}

echo "" > vigipool.yaml
echo cleaning vigipool.yaml

found_and_integrate "anteam" $anteam
found_and_integrate "anteaox" $anteaox
found_and_integrate "anteavs" $anteavs
found_and_integrate "daisyox" $daisyox
found_and_integrate "daisyph" $daisyph
found_and_integrate "lynx" $lynx
found_and_integrate "phileox" $phileox
found_and_integrate "tild" $tild
found_and_integrate "vigipool" $vigipool
found_and_integrate "vigiwatt" $vigiwatt
found_and_integrate "x312" $x312
found_and_integrate "ziphox" $ziphox


replace_name() {
    sed -i "s/name: $1/name: $2/" vigipool.yaml
}

if [[ $text_lang == "fr" ]]; then
    echo "-> fr"
    replace_name "Injecting Product" "Produit Injecté"
    replace_name "Total volume injected" "Volume total injecté"
    replace_name "Serial Number" "Numéro de série"
    replace_name "Discharge Temperature" "Température Refoulement"
    replace_name "pH Setpoint" "Consigne pH"
    replace_name "Max volume injected in 24 hours" "Volume max injecté en 24 heures"
    replace_name "Container volume" "Volume du conteneur"
    replace_name "Firmware Version" "Version du firmware"
    replace_name "pH Value" "Valeur du pH"
    replace_name "Hardware Version" "Version du matériel"
    replace_name "Light" "Éclairage"
    replace_name "Filtration" "Filtration"
    replace_name "Auxiliary" "Auxiliary"
    replace_name "AnteaM" "AnteaM"
    replace_name "Light Mode" "Mode d'éclairage"
    replace_name "Filtration Mode" "Mode de filtration"
    replace_name "Auxiliary 1 Mode" "Mode de l'auxiliaire 1"
    replace_name "Auxiliary 2 Mode" "Mode de l'auxiliaire 2"
    replace_name "ORP Value" "Valeur de l'ORP"
    replace_name "ORP Setpoint" "Consigne ORP"
    replace_name "pH mode" "Mode du pH"
    replace_name "pH Setpoint" "Consigne pH"
    replace_name "pH Setpoint" "pH Setpoint"
    replace_name "Speed" "Vitesse"
    replace_name "Timer" "Minuterie"
    replace_name "Time Selecter" "Sélecteur de temps"
    replace_name "Time Remaining" "Temps restant"
    replace_name "pH Mode" "Mode du pH"
    replace_name "pH Value" "Valeur du pH"
fi

echo "";
echo "";
echo "--- $text_step_5 ---"
echo "";

ha_core_check=$(ha core check)
ha_core_save=$ha_core_check
echo $ha_core_check | grep -Eo "Error" > temp.txt
ha_core_check=$(head -n 1 temp.txt)
echo $ha_core_check
if [[ -z "$ha_core_check" ]]; then
    echo "$text_modif"
    while true; do
        echo "$text_reboot"
        echo "1 - $text_reboot_now";
        echo "2 - $text_reboot_later";
        echo "$text_please : "
        read menu_choice
        if [ "$menu_choice" != "${menu_choice#[1aA]}" ] ;then 
            # 1 - Automatic
            echo "$text_you '$text_reboot_now'"
            ha core rebuild
            echo "$text_end"
            break
        elif [ "$menu_choice" != "${menu_choice#[2mM]}" ] ;then 
            # 2 - Manual
            echo "$text_you '$text_reboot_later'"
            break
        else
            echo The choice was not understood, please try again
        fi
    done
elif [[ -n "$ha_core_check" ]]; then
    echo "";
    echo "$text_prob_1 : "
    echo "";
    echo $ha_core_save 
    echo "";
    echo "$text_prob_2 : configuration_$timestamp.backup"
    echo "";
fi
