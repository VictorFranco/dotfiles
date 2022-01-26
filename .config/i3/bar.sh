#!/bin/bash
ram_ () {
    used_ram=$(free -h|cut -d ' ' -f 19|tr -d '\n')
    echo "RAM ${used_ram%%i*}"
}

volume_icon () {
    mute_state=$(amixer sget Master|grep -o "\[\(on\|off\)\]")
    [ ${mute_state:1:-1} = "on" ]&&echo " "||echo "🔇"
}

volume_value () {
    amixer sget Master|grep -o "[0-9]*%"
}

date_ () {
    date '+%a %b %d %r %Y'
}

echo '{ "version": 1 }'
echo '[[]'

while :
do
    # Save the function value
    volume_value=$(volume_value)
    # Set the arrow volume color, when volume value equals to zero
    volume_arrow_color=$([ $volume_value = "0%" ]&&echo "#D1D642"||echo "#08CB14")

    # Config arrays
    data_array=("" "$(ram_)" "$(volume_icon) $volume_value" "$(date_)")
    arrow_array=("#FFFFFF" "#0764b1" $volume_arrow_color "#401210")
    color_array=("#000000" "#FFFFFF" "#000000" "#FFFFFF")

    json=',[[]'
    for i in ${!data_array[@]};
    do
        data=${data_array[$i]}
        arrow_color=${arrow_array[$i]}
        font_color=${color_array[$i]}
        # Get the previous arrow color to complete its fletching
        fletching_color=$([ $i -ge 1 ]&&echo "${arrow_array[$[$i-1]]}"||echo "#00000033")

        # Generate the json to display the arrows
        json+=",{\"full_text\":\"\",\"background\":\"$fletching_color\",\"color\":\"$arrow_color\",\"separator_block_width\":0}"
        json+=",{\"full_text\":\" $data \",\"background\":\"$arrow_color\",\"color\":\"$font_color\",\"separator_block_width\":0}"
    done
    echo -n "${json}]"
    sleep 1
done
