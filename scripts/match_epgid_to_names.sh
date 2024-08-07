#!/bin/bash


### FOR NOW UST A HELPER SCRIPT WITH HARDCODED WITH IDS WE'RE LOOKING UP
### IN THE FUTURE WE WANT TO FIND A MORE GENERIC WAY


#########################################
##### START OF FUNCTION DEFINITIONS #####
#########################################
match_epg_id_for_file () {
    local m3u8_in_file=$1
    local m3u8_out_file=$2
    local json_check_file=$3

    echo "### START Processing - '${m3u8_in_file}' ###"

    ls -alt "${m3u8_in_file}"
    ls -alt "${json_check_file}"

    python "${SCRIPT_PATH}/match_epgid_to_names.py" --input_file "${m3u8_in_file}" --out_file "${m3u8_out_file}" --json_file "${json_check_file}"

    if [[ $return_code -eq  0 ]];
    then
        echo "   No Issues"
    else
        echo "   Issues Found"
    fi
    echo "### FINISH Processing - '${m3u8_in_file}' ###"
}
#######################################
##### END OF FUNCTION DEFINITIONS #####
#######################################

echo '##### Calling: '`basename "$0"` '('$0')'

### Verify the parsed variables
echo Verifying passed arguments

m3u_in_dir=$1
m3u_out_dir=$2

if [[ -z ${m3u_in_dir} ]];
then
    echo "arg1 - M3u input directory is not set"
    exit 1
fi

if [[ ! -d ${m3u_in_dir} ]];
then
    echo "Directory '${m3u_in_dir}' DOES NOT exist." 
    exit 1
fi

if [[ -z ${m3u_out_dir} ]];
then
    echo "arg1 - M3u output directory is not set"
    exit 1
fi

if [[ ! -d ${m3u_out_dir} ]];
then
    echo "Directory '${m3u_out_dir}' DOES NOT exist." 
    exit 1
fi

### Action ###

SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
json_dir=${SCRIPT_PATH}/../ez_m3u8_creator/m3u4u.com/egp-channel-ids

echo SCRIPT_PATH: ${SCRIPT_PATH}
echo Command: 'ls -alt "${m3u_in_dir}"'
ls -alt "${m3u_in_dir}"
echo Command: 'ls -alt "${m3u_out_dir}"'
ls -alt "${m3u_out_dir}"
echo Command: 'ls -alt "${json_dir}"'
ls -alt "${json_dir}"

# Match the known json files
# match_epg_id_for_file "${m3u_in_dir}/australia.m3u8" "${m3u_out_dir}/australia.m3u8" "${json_dir}/australia.json"
# match_epg_id_for_file "${m3u_in_dir}/austria.m3u8" "${m3u_out_dir}/austria.m3u8" "${json_dir}/austria.json"
# match_epg_id_for_file "${m3u_in_dir}/canada.m3u8" "${m3u_out_dir}/canada.m3u8" "${json_dir}/canada.json"
# match_epg_id_for_file "${m3u_in_dir}/germany.m3u8" "${m3u_out_dir}/germany.m3u8" "${json_dir}/germany.json"
# match_epg_id_for_file "${m3u_in_dir}/switzerland.m3u8" "${m3u_out_dir}/switzerland.m3u8" "${json_dir}/switzerland.json"
# match_epg_id_for_file "${m3u_in_dir}/united kingdom.m3u8" "${m3u_out_dir}/united kingdom.m3u8" "${json_dir}/uk.json"
# match_epg_id_for_file "${m3u_in_dir}/united states of america.m3u8" "${m3u_out_dir}/united states of america.m3u8" "${json_dir}/usa.json"

match_epg_id_for_file "${m3u_in_dir}/all-streams.m3u8" "${m3u_out_dir}/all-streams.m3u8" "${json_dir}/codes.json"
match_epg_id_for_file "${m3u_in_dir}/all-streams.m3u8" "${m3u_out_dir}/all-streams.m3u8" "${json_dir}/australia.json"
match_epg_id_for_file "${m3u_in_dir}/all-streams.m3u8" "${m3u_out_dir}/all-streams.m3u8" "${json_dir}/austria.json"
match_epg_id_for_file "${m3u_in_dir}/all-streams.m3u8" "${m3u_out_dir}/all-streams.m3u8" "${json_dir}/canada.json"
match_epg_id_for_file "${m3u_in_dir}/all-streams.m3u8" "${m3u_out_dir}/all-streams.m3u8" "${json_dir}/germany.json"
match_epg_id_for_file "${m3u_in_dir}/all-streams.m3u8" "${m3u_out_dir}/all-streams.m3u8" "${json_dir}/switzerland.json"
match_epg_id_for_file "${m3u_in_dir}/all-streams.m3u8" "${m3u_out_dir}/all-streams.m3u8" "${json_dir}/uk.json"
match_epg_id_for_file "${m3u_in_dir}/all-streams.m3u8" "${m3u_out_dir}/all-streams.m3u8" "${json_dir}/usa.json"

match_epg_id_for_file "${m3u_in_dir}/all-streams.m3u8" "${m3u_out_dir}/all-streams.m3u8" "${json_dir}/codes2.json"
match_epg_id_for_file "${m3u_in_dir}/all-streams.m3u8" "${m3u_out_dir}/all-streams.m3u8" "${json_dir}/codes3.json"
match_epg_id_for_file "${m3u_in_dir}/all-streams.m3u8" "${m3u_out_dir}/all-streams.m3u8" "${json_dir}/codes4.json"
match_epg_id_for_file "${m3u_in_dir}/all-streams.m3u8" "${m3u_out_dir}/all-streams.m3u8" "${json_dir}/codes5.json"
match_epg_id_for_file "${m3u_in_dir}/all-streams.m3u8" "${m3u_out_dir}/all-streams.m3u8" "${json_dir}/codes6.json"
match_epg_id_for_file "${m3u_in_dir}/all-streams.m3u8" "${m3u_out_dir}/all-streams.m3u8" "${json_dir}/codes7.json"
match_epg_id_for_file "${m3u_in_dir}/all-streams.m3u8" "${m3u_out_dir}/all-streams.m3u8" "${json_dir}/codes8.json"
match_epg_id_for_file "${m3u_in_dir}/all-streams.m3u8" "${m3u_out_dir}/all-streams.m3u8" "${json_dir}/codes9.json"
match_epg_id_for_file "${m3u_in_dir}/all-streams.m3u8" "${m3u_out_dir}/all-streams.m3u8" "${json_dir}/codes10.json"
match_epg_id_for_file "${m3u_in_dir}/all-streams.m3u8" "${m3u_out_dir}/all-streams.m3u8" "${json_dir}/codes11.json"
match_epg_id_for_file "${m3u_in_dir}/all-streams.m3u8" "${m3u_out_dir}/all-streams.m3u8" "${json_dir}/codes12.json"
match_epg_id_for_file "${m3u_in_dir}/all-streams.m3u8" "${m3u_out_dir}/all-streams.m3u8" "${json_dir}/codes13.json"
match_epg_id_for_file "${m3u_in_dir}/all-streams.m3u8" "${m3u_out_dir}/all-streams.m3u8" "${json_dir}/pluto.json"

match_epg_id_for_file "${m3u_in_dir}/us_pluto.m3u8" "${m3u_out_dir}/us_pluto.m3u8" "${json_dir}/pluto.json"
match_epg_id_for_file "${m3u_in_dir}/uk_samsung.m3u8" "${m3u_out_dir}/uk_samsung.m3u8" "${json_dir}/pluto.json"
match_epg_id_for_file "${m3u_in_dir}/anthymtv.m3u8" "${m3u_out_dir}/anthymtv.m3u8" "${json_dir}/pluto.json"
match_epg_id_for_file "${m3u_in_dir}/avo.m3u8" "${m3u_out_dir}/avo.m3u8" "${json_dir}/pluto.json"
match_epg_id_for_file "${m3u_in_dir}/bumblebee.m3u8" "${m3u_out_dir}/bumblebee.m3u8" "${json_dir}/pluto.json"
match_epg_id_for_file "${m3u_in_dir}/cablevision.m3u8" "${m3u_out_dir}/cablevision.m3u8" "${json_dir}/pluto.json"
match_epg_id_for_file "${m3u_in_dir}/dashradio.m3u8" "${m3u_out_dir}/dashradio.m3u8" "${json_dir}/pluto.json"
match_epg_id_for_file "${m3u_in_dir}/distrotv.m3u8" "${m3u_out_dir}/distrotv.m3u8" "${json_dir}/pluto.json"
match_epg_id_for_file "${m3u_in_dir}/free2view.m3u8" "${m3u_out_dir}/free2view.m3u8" "${json_dir}/pluto.json"
match_epg_id_for_file "${m3u_in_dir}/freeli.m3u8" "${m3u_out_dir}/freeli.m3u8" "${json_dir}/pluto.json"
match_epg_id_for_file "${m3u_in_dir}/galxytv.m3u8" "${m3u_out_dir}/galxytv.m3u8" "${json_dir}/pluto.json"
match_epg_id_for_file "${m3u_in_dir}/gemonline.m3u8" "${m3u_out_dir}/gemonline.m3u8" "${json_dir}/pluto.json"
match_epg_id_for_file "${m3u_in_dir}/goodtv.m3u8" "${m3u_out_dir}/goodtv.m3u8" "${json_dir}/pluto.json"
match_epg_id_for_file "${m3u_in_dir}/herogotv.m3u8" "${m3u_out_dir}/herogotv.m3u8" "${json_dir}/pluto.json"
match_epg_id_for_file "${m3u_in_dir}/redboxtv.m3u8" "${m3u_out_dir}/redboxtv.m3u8" "${json_dir}/pluto.json"
match_epg_id_for_file "${m3u_in_dir}/rad.m3u8" "${m3u_out_dir}/rad.m3u8" "${json_dir}/pluto.json"
match_epg_id_for_file "${m3u_in_dir}/pbs.m3u8" "${m3u_out_dir}/pbs.m3u8" "${json_dir}/pluto.json"
match_epg_id_for_file "${m3u_in_dir}/mytvtogo.m3u8" "${m3u_out_dir}/mytvtogo.m3u8" "${json_dir}/pluto.json"
match_epg_id_for_file "${m3u_in_dir}/klowdtv.m3u8" "${m3u_out_dir}/klowdtv.m3u8" "${json_dir}/pluto.json"
match_epg_id_for_file "${m3u_in_dir}/jungo.m3u8" "${m3u_out_dir}/jungo.m3u8" "${json_dir}/pluto.json"


match_epg_id_for_file "${m3u_in_dir}/all-streams.m3u8" "${m3u_out_dir}/all-streams.m3u8" "${json_dir}/epgall1.json"
match_epg_id_for_file "${m3u_in_dir}/all-streams.m3u8" "${m3u_out_dir}/all-streams.m3u8" "${json_dir}/epgall2.json"
match_epg_id_for_file "${m3u_in_dir}/all-streams.m3u8" "${m3u_out_dir}/all-streams.m3u8" "${json_dir}/epgall3.json"
match_epg_id_for_file "${m3u_in_dir}/all-streams.m3u8" "${m3u_out_dir}/all-streams.m3u8" "${json_dir}/epgall4.json"
match_epg_id_for_file "${m3u_in_dir}/all-streams.m3u8" "${m3u_out_dir}/all-streams.m3u8" "${json_dir}/epgall5.json"
match_epg_id_for_file "${m3u_in_dir}/all-streams.m3u8" "${m3u_out_dir}/all-streams.m3u8" "${json_dir}/epgall6.json"
match_epg_id_for_file "${m3u_in_dir}/all-streams.m3u8" "${m3u_out_dir}/all-streams.m3u8" "${json_dir}/epgall7.json"
match_epg_id_for_file "${m3u_in_dir}/all-streams.m3u8" "${m3u_out_dir}/all-streams.m3u8" "${json_dir}/epgall8.json"
match_epg_id_for_file "${m3u_in_dir}/all-streams.m3u8" "${m3u_out_dir}/all-streams.m3u8" "${json_dir}/epgall9.json"
match_epg_id_for_file "${m3u_in_dir}/all-streams.m3u8" "${m3u_out_dir}/all-streams.m3u8" "${json_dir}/epgall10.json"
match_epg_id_for_file "${m3u_in_dir}/all-streams.m3u8" "${m3u_out_dir}/all-streams.m3u8" "${json_dir}/epgall11.json"
match_epg_id_for_file "${m3u_in_dir}/all-streams.m3u8" "${m3u_out_dir}/all-streams.m3u8" "${json_dir}/epgall12.json"
match_epg_id_for_file "${m3u_in_dir}/all-streams.m3u8" "${m3u_out_dir}/all-streams.m3u8" "${json_dir}/epgall13.json"
match_epg_id_for_file "${m3u_in_dir}/all-streams.m3u8" "${m3u_out_dir}/all-streams.m3u8" "${json_dir}/epgall14.json"
match_epg_id_for_file "${m3u_in_dir}/all-streams.m3u8" "${m3u_out_dir}/all-streams.m3u8" "${json_dir}/epgall15.json"
match_epg_id_for_file "${m3u_in_dir}/all-streams.m3u8" "${m3u_out_dir}/all-streams.m3u8" "${json_dir}/epgall16.json"
match_epg_id_for_file "${m3u_in_dir}/all-streams.m3u8" "${m3u_out_dir}/all-streams.m3u8" "${json_dir}/epgall17.json"
match_epg_id_for_file "${m3u_in_dir}/all-streams.m3u8" "${m3u_out_dir}/all-streams.m3u8" "${json_dir}/epgall18.json"
match_epg_id_for_file "${m3u_in_dir}/all-streams.m3u8" "${m3u_out_dir}/all-streams.m3u8" "${json_dir}/epgall19.json"
match_epg_id_for_file "${m3u_in_dir}/all-streams.m3u8" "${m3u_out_dir}/all-streams.m3u8" "${json_dir}/epgall20.json"
